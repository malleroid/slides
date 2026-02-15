# slidev-theme-paiza

A custom [Slidev](https://github.com/slidevjs/slidev) theme designed for paiza corporate presentations.

## Install

When using from a deck within the monorepo, specify the relative path in frontmatter.

```yaml
---
theme: ../../themes/paiza
---
```

## Layouts

| Layout | Description |
|--------|-------------|
| `cover` | Title slide |
| `default` | Standard layout |
| `end` | Closing slide |
| `intro` | Section divider |
| `lead` | Emphasis slide (centered) |
| `toc` | Table of contents |

## Components

| Component | Description |
|-----------|-------------|
| `<Label>` | Badge-style label. Supports `color` and `outline` props |
| `<NumberHeading>` | Numbered heading |

## Theme Config

Switch service colors via `themeConfig` in frontmatter.

```yaml
---
themeConfig:
  # top | career | student | en_try | learning
  # Default: career
  service: career
---
```

## Development

```sh
docker compose exec dev sh -c "cd themes/paiza && pnpm exec slidev example.md --remote --port 3030"
```

- Edit `example.md` to preview theme changes
- `pnpm exec slidev export example.md` to generate preview PDF
- `pnpm exec slidev export example.md --format png` to generate preview PNG

        "automatic_copilot_code_review_enabled": true
