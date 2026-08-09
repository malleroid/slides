---
theme: ./
layout: cover
---

# Emerald Synth

## A synthwave theme for Slidev

---
layout: title
---

# Presentation Title

malleroid 2026.03.30

---
layout: title-sandwich
---

# Presentation Title

::top::
Project — Emerald Synth

::footer::
Date and other information

---
layout: intro
---

# Introduction

Welcome to the synthwave experience

---
layout: section
---

# Section Title

This is a section divider slide with neon glow effects.

---
layout: section-frame
---

# Framed Section

---
layout: toc
---

# Table of Contents

1. Introduction
2. Color Palette
3. Typography
4. Layouts
5. Code Blocks
6. Components

---

# Default Slide

- Regular content with **bold text** and `inline code`
- Links look like [this](https://example.com)
- Japanese text: シンセウェーブテーマのテスト
- UnoCSS utility: <span class="text-es-accent">accent colored text</span>

> This is a blockquote with neon styling

---
layout: two-cols
---

::left::

## Left Column

- Item one
- Item two
- Item three

::right::

## Right Column

- Item four
- Item five
- Item six

---
layout: quote
---

The future is already here — it's just not evenly distributed.

::source::

**William Gibson**

---
layout: quote
color: accent
---

In the neon glow of synthwave, we find our digital home.

::source::

Emerald Synth

---
layout: frame-panel
header: Quote
---

Technology is best when it brings people together.

---
layout: panel
heading: License
---

MIT License — Open source and free to use.

---
layout: panel
color: primary
align: left
---

# Panel with Quote

Content displayed in a **panel layout** with cyan accent.

---
layout: table
---

# Comparison

| Feature | Emerald Synth | Default |
|---------|:---:|:---:|
| Dark mode | ✓ | ✓ |
| Neon glow | ✓ | — |
| Custom Shiki | ✓ | — |
| JP fonts | ✓ | — |

---
layout: steps
steps:
  - title: Design
    body: Define the color palette and typography from palette.toml
  - title: Build
    body: Create layouts, styles, and effects with synthwave aesthetic
  - title: Test
    body: Verify all layouts render correctly in Docker environment
  - title: Ship
    body: Push to the slides monorepo and create a pull request
---

---
layout: process-flow
steps:
  - title: palette.toml
    description: Color source of truth
  - title: CSS Variables
    description: Map to --es-* properties
  - title: UnoCSS
    description: Utility classes enabled
  - title: Layouts
    description: Vue components styled
---

# Theme Build Process

---
layout: profile
header: Speaker
---

# malleroid

Software Engineer

::name::

# malleroid

---
layout: cards
cards:
  - title: Neon
    description: Glow effects layered over a deep indigo ground.
  - title: Mono
    description: Monaspace Neon for both body and code.
  - title: Contrast
    description: Cyan against magenta, tuned for a dark room.
---

# Design Notes

---
layout: compare
left:
  heading: Cyan
  items:
    - Body text and headings
    - Primary quotes
    - Step numbers
right:
  heading: Magenta
  items:
    - Accents and highlights
    - Frame edges
    - Hover states
---

# Two Signals

---
layout: image-left
image: https://images.unsplash.com/photo-1536590158209-e9d615d525e4?auto=format&fit=crop&w=800&q=80
alt: Neon lit street
---

## Image Left

The image takes the left half and the content sits on the right.

- Bullet points are supported
- Add headings and paragraphs as you like

---
layout: image-right
image: https://images.unsplash.com/photo-1549545931-59bf067af9ab?auto=format&fit=crop&w=800&q=80
alt: Neon sign
label: Photo label
---

## Image Right

Add `label` to caption the image along its bottom edge.

---
layout: team
members:
  - name: Team Member 1
    img: https://images.unsplash.com/photo-1518791841217-8f162f1e1131?auto=format&fit=crop&w=600&q=80
  - name: Team Member 2
    img: https://images.unsplash.com/photo-1518791841217-8f162f1e1131?auto=format&fit=crop&w=600&q=80
  - name: Team Member 3
    img: https://images.unsplash.com/photo-1518791841217-8f162f1e1131?auto=format&fit=crop&w=600&q=80
---

---
layout: team-border
members:
  - name: Team Member 1
    img: https://images.unsplash.com/photo-1518791841217-8f162f1e1131?auto=format&fit=crop&w=600&q=80
  - name: Team Member 2
    img: https://images.unsplash.com/photo-1518791841217-8f162f1e1131?auto=format&fit=crop&w=600&q=80
  - name: Team Member 3
    img: https://images.unsplash.com/photo-1518791841217-8f162f1e1131?auto=format&fit=crop&w=600&q=80
---

---

# Code Block

```ts
import { defineShikiSetup } from "@slidev/types";
import theme from "./emerald-synth.json";

export default defineShikiSetup(() => ({
  themes: {
    dark: theme,
    light: theme,
  },
}));
```
