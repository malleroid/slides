# slidev-theme-barrel

A [Slidev](https://sli.dev) theme with modern warm aesthetic — amber tones, cozy feel, refined typography.

## Features

- Dark-only theme with warm shadow effects
- 22 layout variants
- Custom Shiki syntax highlighting theme
- Libre Baskerville (headings) + Inter (body) + Noto Sans JP fonts
- UnoCSS color utilities (`text-br-fg`, `bg-br-accent`, etc.)

## Usage

```yaml
---
theme: ../../themes/barrel
---
```

## Color Palette

| Variable | Color | Usage |
|----------|-------|-------|
| `--br-bg` | `#1c1816` | Main background |
| `--br-fg` | `#e8ddd0` | Primary text (warm cream) |
| `--br-accent` | `#e09f3e` | Accent (golden amber) |
| `--br-fg-dim` | `#c4b8a8` | Body text |
| `--br-fg-muted` | `#7a6e62` | Muted text |

## Development

```sh
docker compose --profile barrel-theme up
# https://barrel-theme.slides.localhost
```
