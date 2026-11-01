# slidev-theme-paiza

A [Slidev](https://github.com/slidevjs/slidev) theme for paiza presentations, following the 2026
logo and brand guideline. The pre-2026 theme is kept, frozen, as [paiza-legacy](../paiza-legacy/).

Content slides share one frame: a gradient bar with the current section and the slide title at the
top, and the logo, copyright and page number at the foot. See
[docs/themes.md](../../docs/themes.md) for how it fits the other themes.

## Install

```yaml
---
theme: ../../themes/paiza
title: My talk
---
```

## Layouts

Every built-in layout name is provided, so existing decks switch over without renaming layouts.

| Layout | Header | Footer | Notes |
|--------|:------:|:------:|-------|
| `cover` | | | Brand gradient, white logo. `h1` title, then paragraphs for subtitle and date / speaker |
| `intro` | | | Light page with the colour logo, for an opening summary |
| `default` | ✓ | ✓ | |
| `section` | | ✓ | Section divider. Numbered automatically (`01`, `02`, …) |
| `toc` | ✓ | ✓ | Lists the `section` slides, linked |
| `center` | | ✓ | |
| `statement` | | ✓ | One large message |
| `fact` | | ✓ | A big gradient number with a caption |
| `quote` | | ✓ | `h1` is the quote, the paragraph below the attribution |
| `two-cols` | ✓ | ✓ | Default slot left, `::right::` right |
| `two-cols-header` | ✓ | ✓ | Default slot spans; `::left::`, `::right::`, `::bottom::` |
| `image-left` / `image-right` | ✓ | | `image` fills half the slide; `backgroundSize` defaults to `cover` |
| `image` | | | Full-bleed `image` |
| `end` | | | Closing slide on the gradient |

`iframe`, `iframe-left`, `iframe-right`, `full` and `none` fall back to Slidev's built-ins on the
theme's background, without the footer.

## Frontmatter

| Key | Where | Effect |
|-----|-------|--------|
| `section` | any slide with a header | Overrides the label above the title. `false` hides it. Defaults to the nearest preceding `section` slide, then the deck `title` |
| `footer` | any slide | `true` / `false` forces the footer on or off |
| `number` | `section` | Overrides the automatic number; `false` hides it |
| `speaker` | `section` | Shown beside the entry in `toc` |
| `items` | `toc` | Replaces the automatic list: strings or `{ title, speaker }` |

```yaml
---
layout: section
speaker: Your Name
---

# Getting started
```

## Theme config

```yaml
---
themeConfig:
  copyright: © paiza, Inc. # default; set to '' to hide
---
```

## Components

| Component | Description |
|-----------|-------------|
| `<Headline title subtitle>` | Centered title in the primary colour with an optional subtitle |
| `<Note>` | A line in the attention colour, for caveats |
| `<SectionLabel>` | The header label; used by the layouts, rarely needed directly |

## Styling

- `h2` is a light-blue band, `h3` a primary-coloured sub-heading, `strong` the primary colour
- Colours are published to UnoCSS as `paiza-primary` (`#0762e5`), `paiza-secondary` (`#35c4d4`),
  `paiza-accent` (`#9a34d5`), `paiza-attention` (`#f0841d`), `paiza-text`, `paiza-muted`,
  `paiza-line` and `paiza-tint`
- `.paiza-gradient` and `.paiza-gradient-accent` apply the brand gradients to any element
- Font is M PLUS 1; light colour scheme only
- `assets/logo.svg` and `assets/logo-white.svg` were traced from the brand guideline PNG

## Development

```sh
docker compose exec dev sh -c "cd themes/paiza && pnpm exec slidev example.md --remote --port 3030"
```

`example.md` renders every layout the theme ships.
