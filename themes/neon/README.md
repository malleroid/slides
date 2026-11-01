# slidev-theme-neon

A [Slidev](https://sli.dev) theme whose identity is the animated background: `global-bottom.vue`
→ `components/NeonBackground.vue` draws three blurred polygons behind every slide that morph on
each page turn and slowly rotate in hue.

The theme ships **no layouts of its own** — the built-in `cover`, `intro`, `default`, `center`
and `two-cols-header` are restyled in `styles/layout.css` instead. See
[docs/themes.md](../../docs/themes.md) for how that fits the other themes.

Ported from [mozumasu/slidev-template](https://github.com/mozumasu/slidev-template)
(`slidev-theme-neon`, MIT, by もずます).

## Usage

```yaml
---
theme: ../../themes/neon
themeConfig:
  variant: synthwave # default | cyberpunk | synthwave
---
```

`variant` picks the background palette the deck opens with (default `synthwave`). Press `W`, or
click the badge in the bottom-right corner, to cycle through the three. The badge is hidden when
exporting.

## Text effects

| Class | Effect |
|---|---|
| `neon-glow-<color>` | White text with a coloured glow |
| `neon-glow-<color>-colored` | Coloured text with a coloured glow |
| `neon-flicker-<color>` | White text whose coloured glow flickers |
| `neon-flicker` / `-fast` / `-slow` | Flickers in the element's own text colour |
| `flicker` / `-fast` / `-slow` | Blinks without changing colour or glow |
| `tracking-mega` | `letter-spacing: 0.25em` |

`<color>` is one of `cyan`, `matrix`, `pink`, `purple`, `yellow`, `orange`.

## Code blocks

| Class | Effect |
|---|---|
| `small-code` | Shrinks code to fit 26+ lines on one slide |
| `scrollable-code` / `-small` / `-large` | Caps the height at 80 / 60 / 90 vh and scrolls |

## Components

```html
<NeonCard title="Title" subtitle="Subtitle" icon="⚡" glow-color="cyan" :flicker="true">
  Card body
</NeonCard>

<NeonTimeline
  :items="[{ title: 'Title', subtitle: 'Subtitle', description: 'Text', icon: '🎯', date: '2026-01' }]"
  glow-color="matrix"
  orientation="vertical"
/>

<NeonProfile
  name="Your Name"
  title="Role"
  bio="One line about you"
  avatar="/avatar.png"
  :skills="['Vue', 'TypeScript']"
  :social="[{ platform: 'github', url: 'https://github.com/you' }]"
  glow-color="purple"
/>
```

`glow-color` takes the same six colours as the text effects.

## Development

```sh
docker compose --profile neon-theme up
# https://neon-theme.slides.localhost
```
