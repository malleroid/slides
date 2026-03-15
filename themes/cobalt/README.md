# Slidev Theme Cobalt

A Slidev theme featuring a deep cobalt blue color scheme with framed layouts, inspired by the v2.0 slide template.

## Install

Specify the relative path in frontmatter.

```yaml
---
theme: ../../themes/cobalt
---
```

## Layouts

This theme provides the following layouts:

- `cover` - Full blue cover slide with centered content
- `title` - Left-aligned title on framed slide
- `title-center` - Centered title on framed slide
- `title-sandwich` - Three-part layout with top subtitle, centered title, and bottom footer
- `intro` - Centered content on framed slide (similar to title-center)
- `toc` - Table of contents with numbered badges
- `section` - Full blue section divider
- `section-frame` - Framed section divider with white background
- `panel` - Light gray panel on white background for quotes and content
- `team` - Panel layout for three team members with images
- `team-border` - Team layout with blue border frame
- `steps-layout` - Vertical or 2-column step list layout (use `.steps-column`, `.step`, `.step-header`, `.step-number`, `.step-title`, `.step-body`)
- `process-flow` - Horizontal process flow with circular steps and connecting arrows (use `.process-flow-container`, `.process-step`, `.process-step-circle`, `.process-step-title`, `.process-step-description`, `.process-arrow`)
- `table` - Framed table-focused layout for feature comparison or data overview slides
- `two-cols` - Two equal columns for side-by-side content (use `.two-cols-col` divs for each column)
- `quote` - Centered testimonial/blockquote slide: large quote + source (name/title). Use a div with class `quote` (and optionally `quote blue` or `quote black`) for the quote text, and `quote-source` for attribution
- `profile` - Framed profile/text pages with header
- `frame-panel` - Framed slide with inner panel and header
- `image-left` - Left image and right text (use `image-col` and `content-col` divs)
- `image-right` - Right image and left text (use `image-col` and `content-col` divs)

## Components

No custom components are required. Use the utility classes in `styles/layout.css` such as:

- `text-blue` - Emphasized blue text
- `quote` - Quote text; use with `quote` layout for full testimonial slides. Optional modifiers: `quote blue` or `quote black` for color. Use `quote-source` for name/title below the quote
- `member` / `name` - Team member blocks and names
- `steps-column`, `step`, `step-header`, `step-number`, `step-title`, `step-body` - For structuring step-by-step slides with `steps-layout`
- `process-flow-container`, `process-step`, `process-step-circle`, `process-step-title`, `process-step-description`, `process-arrow` - For horizontal process flow diagrams with `process-flow`
- `table-layout` with native Markdown tables or HTML `<table>` elements - For clean, full-width tables with zebra stripes and hover states
- `two-cols-col` - For each column in the `two-cols` layout (wrap content in two divs with this class)

## Features

- **Deep Cobalt Blue**: Rich blue color palette (`oklch(37.9% 0.146 265.522)`) for professional presentations
- **Framed Layouts**: Elegant blue frames surrounding white content areas
- **Japanese Support**: Includes Noto Sans JP font for Japanese text
- **Multiple Layouts**: 19 layout options for various presentation needs

## Development

```sh
docker compose --profile cobalt-theme up
```

- Edit `example.md` to preview theme changes
- Open https://cobalt-theme.slides.localhost
