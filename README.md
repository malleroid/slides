# slides

A monorepo for managing presentation decks and custom [Slidev](https://sli.dev/) themes.

## Directory Structure

```
.
├── themes/   # Custom Slidev themes
│   └── paiza/
├── decks/    # Presentation decks
├── Dockerfile
└── compose.yaml
```

## Prerequisites

- [Docker](https://www.docker.com/)

## Getting Started

```sh
# Start the dev container
docker compose up -d

# Launch a theme preview (example: paiza)
docker compose exec dev sh -c "cd themes/paiza && pnpm exec slidev example.md --remote --port 3030"

# Launch a deck
docker compose exec dev sh -c "cd decks/<deck-name> && pnpm exec slidev slides.md --remote --port 3031"
```

Access the slides at `http://localhost:<port>`.

Press `Ctrl+C` to stop the dev server. The container keeps running in the background.

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
