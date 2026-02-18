# slides

A monorepo for managing presentation decks and custom [Slidev](https://sli.dev/) themes.

## Directory Structure

```
.
├── themes/   # Custom Slidev themes
│   └── paiza/
├── decks/    # Presentation decks
├── .docker/
│   └── traefik/  # Reverse proxy config
├── Dockerfile
└── compose.yaml
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

Access via HTTPS:

| Profile | URL |
|---------|-----|
| paiza-theme | https://paiza-theme.slides.localhost |
| lt-devin | https://lt-devin.slides.localhost |
| (dashboard) | https://traefik.slides.localhost |

### Ad-hoc development

```fish
docker compose --profile dev up -d
docker compose exec dev sh
```

## Themes

| Theme | Description |
|-------|-------------|
| [paiza](./themes/paiza/) | Corporate theme for paiza presentations |

## Creating a New Deck

1. Create a directory under `decks/`
2. Add a `package.json` with `@slidev/cli` as a dev dependency
3. Reference the theme via relative path in frontmatter:

```yaml
---
theme: ../../themes/paiza
---
```

4. Add a service block to `compose.yaml` with a profile and Traefik labels
