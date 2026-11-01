---
theme: ./
title: Slidev Theme Neon
themeConfig:
  variant: synthwave
---

# Slidev Theme Neon

Press `W` to switch between neon themes

---

# Neon Text Effects

## 白抜きバージョン

<div class="neon-glow-cyan text-3xl font-light tracking-wide">Cyberpunk Style</div>
<div class="neon-glow-matrix text-6xl font-bold tracking-mega uppercase">MATRIX</div>
<div class="neon-glow-pink text-4xl">Pink Neon</div>
<div class="neon-glow-purple text-4xl font-semibold">Purple Glow</div>
<div class="neon-glow-yellow text-4xl tracking-widest">Yellow Shine</div>
<div class="neon-glow-orange text-4xl font-thin">Orange Flame</div>

---

# Neon Text Effects

## 色付きバージョン

<div class="neon-glow-cyan-colored text-4xl">Cyan Colored</div>
<div class="neon-glow-matrix-colored text-6xl font-bold uppercase">MATRIX</div>
<div class="neon-glow-pink-colored text-4xl">Pink Colored</div>
<div class="neon-glow-purple-colored text-4xl">Purple Colored</div>
<div class="neon-glow-yellow-colored text-4xl">Yellow Colored</div>
<div class="neon-glow-orange-colored text-4xl">Orange Colored</div>

---

# 点滅ネオンエフェクト

<div class="neon-flicker-cyan text-6xl font-bold uppercase tracking-mega">FLICKER</div>
<div class="neon-flicker-matrix text-5xl font-bold">MATRIX STYLE</div>

### 速度バリエーション

<div class="neon-glow-cyan neon-flicker-fast text-4xl">高速点滅</div>
<div class="neon-glow-purple neon-flicker text-4xl">通常速度</div>
<div class="neon-glow-yellow neon-flicker-slow text-4xl">ゆっくり点滅</div>

### 点滅のみ

<div class="neon-glow-orange flicker text-4xl">オレンジ色で点滅</div>

---
layout: default
---

# デフォルトサイズのテスト

## これはH2見出し

これは通常のテキストです。デフォルトのフォントサイズが自動的に適用されます。

### H3見出し

- リストアイテム1
- リストアイテム2
- リストアイテム3

---
layout: center
---

# Center

中央寄せのスライド

- リストは左揃えのまま
- ブロックごと中央に置かれる

---
layout: two-cols-header
---

# Two Columns

::left::

## Left

左カラムの内容

::right::

## Right

右カラムの内容

---

# Code

```ts
import { defineShikiSetup } from "@slidev/types";

export default defineShikiSetup(() => ({
  theme: "vitesse-dark",
}));
```

---

# NeonCard

<div class="grid grid-cols-2 gap-6">
  <NeonCard title="Glow" subtitle="glow-color=cyan" icon="⚡" glow-color="cyan">
    カードの内容
  </NeonCard>
  <NeonCard title="Flicker" subtitle="glow-color=pink" icon="✨" glow-color="pink" :flicker="true">
    点滅するカード
  </NeonCard>
</div>

---

# NeonTimeline

<NeonTimeline
  :items="[
    { title: 'Kickoff', date: '2026-01', description: '構想を固める', icon: '🎯' },
    { title: 'Build', date: '2026-04', description: '実装する', icon: '🛠' },
    { title: 'Ship', date: '2026-07', description: '公開する', icon: '🚀' },
  ]"
  glow-color="matrix"
  orientation="horizontal"
/>

---

<NeonProfile
  name="Your Name"
  title="Software Engineer"
  bio="Slidev でスライドを作っています"
  :skills="['Vue', 'TypeScript', 'Slidev']"
  :social="[{ platform: 'github', url: 'https://github.com/' }]"
  glow-color="purple"
/>
