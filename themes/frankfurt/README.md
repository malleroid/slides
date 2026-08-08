# slidev-theme-frankfurt

A [Slidev](https://sli.dev) theme whose identity is a persistent navigation bar: `Frankfurt.vue`
reads the `section:` frontmatter of every slide and shows where you are in the talk with ●/○
markers, after Beamer's Frankfurt theme.

Layouts are incidental here — the bar rides on top of all of them, so the theme ships only
`cover` and `intro`. See [docs/themes.md](../../docs/themes.md) for how that fits the other themes.

## Usage

```yaml
---
theme: ../../themes/frankfurt
---
```

Mark section boundaries with `section:` in a slide's frontmatter; the navigation bar groups
slides by the most recent one.

```yaml
---
section: Introduction
---
```

Set `infoLine: false` in the headmatter to hide the info line.

## Development

```sh
docker compose --profile frankfurt-theme up
# https://frankfurt-theme.slides.localhost
```
