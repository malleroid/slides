---
theme: ./
title: slidev-theme-paiza
layout: cover
---

# slidev-theme-paiza

paiza corporate theme for Slidev

2026.11 | Your Name

---
layout: intro
---

# About this theme

A Slidev theme following paiza's 2026 brand guideline.

Every built-in layout name is restyled, so decks can use the layouts they already know.

---
layout: toc
---

# Agenda

---
layout: section
speaker: Your Name
---

# Writing slides

Typography, code and tables

---

# Typography

## Headings and text

Body text uses **M PLUS 1** in `#303030`. Strong text takes the main colour.
日本語の本文もそのまま読みやすく表示されます。

- `h1` becomes the slide title next to the gradient bar
- `h2` renders as the light-blue band above
- `h3` is a blue sub-heading

### A third-level heading

<Note>※ Notes stand out in the attention colour.</Note>

---

# Code and tables

```ts
export function greet(name: string): string {
  return `Hello, ${name}`;
}
```

| Token | Value | Utility |
| --- | --- | --- |
| Primary | `#0762e5` | `text-paiza-primary` |
| Secondary | `#35c4d4` | `bg-paiza-secondary` |
| Attention | `#f0841d` | `text-paiza-attention` |

> Blockquotes sit on the tint colour with a primary rule.

---
layout: two-cols
---

# Two columns

The default slot fills the left column, `::right::` the right one.

- Comparisons
- Before / after
- Text beside a diagram

::right::

## Right column

```yaml
---
layout: two-cols
---
```

---
layout: two-cols-header
---

# Two columns with a header

The default slot spans the full width.

::left::

## Left

Content for the left column.

::right::

## Right

Content for the right column.

::bottom::

<Note>`::bottom::` aligns to the foot of the slide.</Note>

---
layout: section
---

# Layouts

Built-in names, restyled

---
layout: center
---

# Centered

`center` places content in the middle of the slide.

---
layout: statement
---

# Say one thing, clearly

`statement` is for a single message.

---
layout: fact
---

# 100%

`fact` puts a number front and centre

---
layout: quote
---

# "Design is not just what it looks like. Design is how it works."

Steve Jobs

---
layout: image-right
image: /example-image.svg
---

# Image right

`image` frontmatter fills the right half; the content keeps the page header.

- `backgroundSize` defaults to `cover`

---
layout: image-left
image: /example-image.svg
---

# Image left

The same layout mirrored.

---
layout: image
image: /example-image.svg
---

---
layout: section
number: false
---

# Components

`number: false` hides the section number

---
section: Components
---

# Headline and colours

<Headline title="Main title" subtitle="Subtitle" />

<div class="grid grid-cols-6 gap-3 text-sm text-center">
  <div class="bg-paiza-primary text-white rounded-xl py-8">primary</div>
  <div class="bg-paiza-secondary text-white rounded-xl py-8">secondary</div>
  <div class="bg-paiza-accent text-white rounded-xl py-8">accent</div>
  <div class="bg-paiza-attention text-white rounded-xl py-8">attention</div>
  <div class="paiza-gradient rounded-xl py-8">gradient</div>
  <div class="paiza-gradient-accent rounded-xl py-8">gradient-accent</div>
</div>

---
layout: two-cols
---

# Frontmatter

## Per slide

```yaml
---
layout: section
number: 3       # or false
speaker: Your Name
---
```

```yaml
---
section: Custom label  # or false
footer: false
---
```

::right::

## Per deck

```yaml
---
theme: ../../themes/paiza
title: My talk
---
```

<Note>The header label defaults to the nearest section slide, then the deck title.</Note>

---
layout: end
---

# Thank you
