# slidev-theme-vscode-dark

A [Slidev](https://sli.dev) theme that dresses slides as the VS Code editor: `styles/vscode.css`
applies the Dark+ palette, `setup/shiki.ts` pins code blocks to `dark-plus`, and
`global-bottom.vue` renders the headmatter's `title` / `author` / `link` as a status bar.

The theme ships **no layouts on purpose** — Slidev's built-in layouts stay in place and get
restyled, rather than being replaced. See [docs/themes.md](../../docs/themes.md) for why that
is a design position and not a gap.

## Usage

```yaml
---
theme: ../../themes/vscode-dark
title: My Talk
author: Your Name
link: https://example.com
---
```

`title`, `author` and `link` feed the status bar.

## Development

```sh
docker compose --profile vscode-dark-theme up
# https://vscode-dark-theme.slides.localhost
```
