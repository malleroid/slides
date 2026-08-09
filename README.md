# slides

A monorepo for managing presentation decks and custom [Slidev](https://sli.dev/) themes.

## Directory Structure

```
.
├── themes/   # Custom Slidev themes
│   ├── paiza/
│   ├── academic/
│   ├── dracula/
│   ├── frankfurt/
│   ├── vscode-dark/
│   ├── cobalt/
│   ├── emerald-synth/
│   └── barrel/
├── decks/    # Presentation decks
├── docs/
│   └── themes.md  # Theme concepts and layout policy
├── .docker/
│   └── traefik/  # Reverse proxy config
├── Dockerfile
├── compose.yaml         # Main compose (traefik, dev, includes)
├── compose.themes.yaml  # Theme services
└── compose.decks.yaml   # Deck services
```

## Prerequisites

- [Docker](https://www.docker.com/)
- [mkcert](https://github.com/FiloSottile/mkcert)

## Getting Started

### 1. Generate TLS certificates

```fish
mkcert -install && mkdir -p .docker/traefik/certs && mkcert -cert-file .docker/traefik/certs/_wildcard.slides.localhost.pem -key-file .docker/traefik/certs/_wildcard.slides.localhost-key.pem "*.slides.localhost"
```

### 2. Start Traefik

```fish
docker compose up -d
```

### 3. Launch a deck or theme preview

```fish
# Theme preview
docker compose --profile paiza-theme up -d

# Deck
docker compose --profile lt-devin up -d
```

### 4. Stop services

```fish
docker compose down --remove-orphans
```

Access via HTTPS:

| Profile | URL |
|---------|-----|
| paiza-theme | https://paiza-theme.slides.localhost |
| academic-theme | https://academic-theme.slides.localhost |
| dracula-theme | https://dracula-theme.slides.localhost |
| frankfurt-theme | https://frankfurt-theme.slides.localhost |
| vscode-dark-theme | https://vscode-dark-theme.slides.localhost |
| cobalt-theme | https://cobalt-theme.slides.localhost |
| emerald-synth-theme | https://emerald-synth-theme.slides.localhost |
| barrel-theme | https://barrel-theme.slides.localhost |
| lt-devin | https://lt-devin.slides.localhost |
| self-intro | https://self-intro.slides.localhost |
| (dashboard) | https://traefik.slides.localhost |

### Ad-hoc development

```fish
docker compose --profile dev up -d
docker compose exec dev sh
```

### Export a deck or theme to PDF

```fish
docker compose --profile export run --rm export decks/202603-self-intro
```

The argument is any workspace directory with an `export` script. The PDF is written
next to the source (e.g. `decks/202603-self-intro/slides-export.pdf`).

Chromium is not part of the regular images. The `export` service uses a dedicated
build stage carrying only the system libraries Chromium needs, and downloads the
browser itself on first use into the `playwright_browsers` volume (~1 GB). Later
runs reuse it. To reclaim the space:

```fish
docker compose down --remove-orphans && docker volume rm slides_playwright_browsers
```

## Themes

| Theme | Description |
|-------|-------------|
| [paiza](./themes/paiza/) | Corporate theme for paiza presentations |
| [academic](./themes/academic/) | Academic presentation theme |
| [dracula](./themes/dracula/) | Dracula color scheme theme |
| [frankfurt](./themes/frankfurt/) | Frankfurt-style academic theme |
| [vscode-dark](./themes/vscode-dark/) | VS Code inspired dark theme |
| [cobalt](./themes/cobalt/) | Deep cobalt blue framed layouts |
| [emerald-synth](./themes/emerald-synth/) | Synthwave/cyberpunk dark theme with neon glow |
| [barrel](./themes/barrel/) | Warm amber dark theme with refined typography |

Each theme is built around a different idea, and that decides which layouts belong in it.
[docs/themes.md](./docs/themes.md) records those concepts and the rule for spreading a layout
from one theme to another.

## Creating a New Deck

1. Create a directory under `decks/`
2. Add a `package.json` with `@slidev/cli` as a dev dependency
3. Reference the theme via relative path in frontmatter:

```yaml
---
theme: ../../themes/paiza
---
```

4. Add a service block to `compose.decks.yaml` with a profile and Traefik labels

## Creating a New Theme

1. Decide which of the three types it is — Chrome, Palette or Page. The type decides
   which layouts belong in it; see [docs/themes.md](./docs/themes.md).
2. Create a directory under `themes/`. The `themes/*` workspace glob picks it up, so
   `pnpm-workspace.yaml` needs no change.
3. Add a `package.json`. Copy one from an existing theme and rename it; the fields
   that carry weight are:

   | Field | Why |
   |-------|-----|
   | `name` | `slidev-theme-<name>` — the prefix Slidev resolves a bare theme name by once published. Locally, `example.md` and the decks point at a path instead |
   | `keywords` | must include `slidev-theme` |
   | `files` | each theme is meant to stand alone as a published package |
   | `slidev.colorSchema` | `dark`, `light` or `both` |
   | `slidev.defaults.fonts` | the theme's default font stack |
   | `scripts` | `build` / `dev` / `export` / `screenshot`, all pointing at `example.md` |

4. Add `styles/index.ts` to pull in Slidev's base layout styles and your own:

```ts
import "@slidev/client/styles/layouts-base.css";
import "./base.css";
```

5. Add `layouts/`, `components/`, `setup/` and `uno.config.ts` as the theme needs
   them. Layouts are optional — vscode-dark ships none and restyles the built-ins
   instead. Slidev resolves layouts in the order default → theme → addon → custom,
   so the built-ins are always available to fall back on.
6. Write an `example.md` that renders every layout the theme ships.
7. Add a service block to `compose.themes.yaml` with a profile and Traefik labels,
   plus a row in the URL table above.

### Conventions

- **Scope stylesheet rules with `.slidev-layout`.** Slidev's `layouts-base.css`
  styles `.slidev-layout h1` and friends, so a bare `h1` loses on specificity and
  the tempting fix is `!important` — which the linter rejects. Matching the selector
  wins on source order instead. Custom properties are the exception: they inherit,
  so declaring them on `.slidev-layout` already beats Slidev's `html.dark`.
- **Every layout belongs in `example.md`.** A layout nothing renders is a layout
  nobody checks — that gap is how barrel shipped `cards` and `compare` with no CSS
  at all.
- **A green build proves very little.** A missing layout silently falls back to a
  built-in, a missing rule renders as an unstyled div, and the wrong prop shape
  renders blank. Open the theme in a browser before calling it done.
- **emerald-synth and barrel are twins.** They share a skeleton and differ only in
  palette, and `pnpm check:themes` holds them to sharing every class name.
