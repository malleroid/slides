# slidev-theme-dracula

A [Slidev](https://sli.dev) theme built to conform to the [Dracula spec](https://spec.draculatheme.com/):
the official palette is mapped onto headings, `strong`, `em`, links, `kbd` and blockquotes, and
`setup/shiki.ts` highlights code with `dracula` to match.

The theme is about colour rather than page structure, so it mostly overrides Slidev's built-in
layouts instead of inventing new ones — see [docs/themes.md](../../docs/themes.md) for how that
fits the other themes.

## Usage

```yaml
---
theme: ../../themes/dracula
---
```

Dark only (`colorSchema: "dark"`).

## Layouts

Overrides of Slidev built-ins: `cover`, `intro`, `section`, `quote`, `statement`, `fact`,
`image-left`, `image-right`.

Theme-specific: `author` — a centred portrait with name, bio and footer links.

## Color Palette

Declared as CSS custom properties on `:root` in `styles/layout.css`.

| Variable | Usage |
|----------|-------|
| `--background` / `--foreground` | Slide background and body text |
| `--purple` | Headings |
| `--orange` | `strong` |
| `--yellow` | `em`, blockquotes |
| `--cyan` | Links, list markers |
| `--green` | `kbd`, inline code |
| `--comment` | Muted text |

## Development

```sh
docker compose --profile dracula-theme up
# https://dracula-theme.slides.localhost
```
