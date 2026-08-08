# slidev-theme-academic

A [Slidev](https://sli.dev) theme that brings the apparatus of a paper to a talk: page numbers
via `global-top.vue`, plus `Footnote` / `Footnotes` for citations and
`FigureWithOptionalCaption` for numbered figures.

Its layouts serve that metaphor rather than forming a general visual vocabulary — see
[docs/themes.md](../../docs/themes.md) for how that fits the other themes.

## Usage

```yaml
---
theme: ../../themes/academic
---
```

## Layouts

| Layout | Description |
|--------|-------------|
| `cover` | Title slide with author list and background image |
| `intro` | Section divider |
| `index` | Contents list built from an `indexEntries` prop |
| `table-of-contents` | Contents list built from Slidev's `<Toc />` |
| `figure` | Slide content above a figure, via `figureUrl` / `figureCaption` |
| `figure-side` | Figure beside the content; `figureX: l` puts it on the left |

## Theme Config

```yaml
---
themeConfig:
  paginationX: r              # 'l' | 'r'
  paginationY: t              # 't' | 'b'
  paginationPagesDisabled: [1]
---
```

Drop `paginationX` and `paginationY` entirely to hide page numbers.

## Development

```sh
docker compose --profile academic-theme up
# https://academic-theme.slides.localhost
```
