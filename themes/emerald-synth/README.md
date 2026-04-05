# slidev-theme-emerald-synth

A [Slidev](https://sli.dev) theme with synthwave/cyberpunk aesthetic based on the [Emerald Synth](https://github.com/malleroid/emerald-synth) color palette.

## Features

- Dark-only theme with neon glow effects
- 20 layout variants (cover, title, section, two-cols, image, quote, table, steps, process-flow, team, etc.)
- Custom Shiki syntax highlighting theme derived from `palette.toml`
- Monaspace Neon + IBM Plex Sans JP fonts
- UnoCSS color utilities (`text-es-fg`, `bg-es-accent`, etc.)

## Usage

```yaml
---
theme: ../../themes/emerald-synth
---
```

## Layouts

| Layout | Description |
|--------|-------------|
| `cover` | Full-bleed cover with neon glow title |
| `section` | Section divider |
| `section-frame` | Section divider with frame |
| `title` | Left-aligned title with frame |
| `title-center` | Centered title with frame |
| `title-sandwich` | Top/main/footer three-slot title |
| `intro` | Alias for title-center |
| `toc` | Table of contents with numbered badges |
| `two-cols` | Two-column layout |
| `image-left` | Image left, content right |
| `image-right` | Image right, content left |
| `quote` | Centered quote with source |
| `frame-panel` | Frame with header and quoted content |
| `panel` | Inset panel with heading or quote |
| `table` | Styled data table |
| `steps-layout` | Numbered steps in 2-col grid |
| `process-flow` | Horizontal process with circles and arrows |
| `profile` | Speaker/author profile |
| `team` | Team members grid |
| `team-border` | Team members with accent border |

## Color Palette

All colors are defined as CSS custom properties with `--es-` prefix and registered as UnoCSS utilities with `es-` prefix.

| Variable | Color | Usage |
|----------|-------|-------|
| `--es-bg` | `#0d0221` | Main background |
| `--es-fg` | `#00ffcc` | Primary text (cyan) |
| `--es-accent` | `#ff79c6` | Accent (magenta) |
| `--es-fg-dim` | `#60e0d0` | Body text |
| `--es-fg-muted` | `#8d73af` | Muted text |

## Development

```sh
docker compose --profile emerald-synth-theme up
# https://emerald-synth-theme.slides.localhost
```
