# Theme Concepts

The eight themes in this repository each started from a different idea. Deciding whether a new
layout belongs in a given theme means knowing what that theme actually is.

## Premise: built-in layouts are always there

Slidev loads layouts in the order **default → theme → addon → custom**, and a later source
overrides an earlier one of the same name ([Slidev docs](https://sli.dev/guide/layout)).

So a theme that ships no `layouts/` at all can still use `two-cols`, `quote`, `image-left` and
the rest. A theme's `layouts/` directory **overrides built-ins rather than adding capability**,
which means "few layouts of its own" does not mean "less expressive".

## Three kinds

### Chrome — the identity is furniture around every slide

A consistent apparatus sits outside the slide body. The body itself is expected to use the
built-in layouts, so adding layouts of its own adds nothing to the theme's identity.

### Palette — the identity is colour

The goal is conformance to an external colour spec, or switching between brand palettes.
Layouts are just a surface for the colour.

### Page — the identity is the page composition itself

The layout vocabulary is the product. This is the only kind where "more layouts" really does
mean "more ways to present".

## The themes

| Theme | Kind | Origin |
|---|---|---|
| [frankfurt](../themes/frankfurt/) | Chrome | [MuTsunTsai/slidev-theme-frankfurt](https://github.com/MuTsunTsai/slidev-theme-frankfurt) |
| [vscode-dark](../themes/vscode-dark/) | Chrome | ogadra/slide template |
| [academic](../themes/academic/) | Chrome | [alexanderdavide/slidev-theme-academic](https://github.com/alexanderdavide/slidev-theme-academic) |
| [dracula](../themes/dracula/) | Palette | [jd-solanki/slidev-theme-dracula](https://github.com/jd-solanki/slidev-theme-dracula) |
| [paiza](../themes/paiza/) | Palette | Written here |
| [cobalt](../themes/cobalt/) | Page | Ported from an external slide template |
| [emerald-synth](../themes/emerald-synth/) | Page | Written here (cobalt's page structure, own palette) |
| [barrel](../themes/barrel/) | Page | Written here (emerald-synth's page structure, own palette) |

### frankfurt — Chrome

`components/Frankfurt.vue` walks the `section:` frontmatter of every slide and keeps a
navigation bar on screen that marks progress through each section with ●/○, after Beamer's
Frankfurt theme. The point is that the audience always knows where they are. `InfoLine` sits
alongside it.

Only `cover` and `intro` are provided, both overrides of built-in names. The bar rides on top of
every layout, so there is no reason to add more.

### vscode-dark — Chrome

`global-bottom.vue` → `components/Footer.vue` renders the headmatter's `title` / `author` /
`link` as a VS Code status bar. `styles/vscode.css` applies the Dark+ palette throughout, and
`setup/shiki.ts` pins code blocks to `dark-plus`.

No layouts of its own. The goal is to reproduce the look of the editor; composition is left to
the built-ins.

### academic — Chrome

`global-top.vue` → `components/Pagination.vue` draws page numbers, positioned with
`themeConfig.paginationX` / `paginationY` and suppressed per slide with
`paginationPagesDisabled`. Together with `Footnote` / `Footnotes` /
`FigureWithOptionalCaption` / `TextWithOptionalLink`, it brings the apparatus of a paper —
captioned figures, footnotes, an index, page numbers — to a talk.

Its four own layouts (`toc`, `index`, `figure`, `figure-side`) all serve that metaphor.

### dracula — Palette

`styles/layout.css` follows the [Dracula spec](https://spec.draculatheme.com/), mapping the
official palette (`--purple`, `--cyan`, `--orange`, `--green` and friends) onto h1–h6, `strong`,
`em`, links, `kbd` and blockquotes. `setup/shiki.ts` highlights code with `dracula` to match.

Most of the work is overriding eight built-in layouts to place those colours; `author` is the
only layout of its own.

### paiza — Palette

**Every layout carries `:class="$slidev.themeConfigs?.service"`.** One theme holds five brand
palettes — `top`, `career`, `student`, `en_try`, `learning` — switchable per slide, defaulting
to `career`. `uno.config.ts` defines primary / secondary / global for each brand.

Only `toc` and `lead` are its own. Brand switching, not layout vocabulary, is the core.

### cobalt — Page

A blue frame around a white content area. Ported wholesale from an external slide template,
bringing 19 layouts and over 1100 lines of CSS with it.

### emerald-synth — Page

Cobalt's page structure with the [emerald-synth](https://github.com/malleroid/emerald-synth)
palette and neon glow effects (`styles/effects.css`) on top. 21 layouts.

### barrel — Page

Emerald-synth's page structure re-clothed in warm amber with Libre Baskerville serif headings.
21 layouts.

## When a layout may spread to another theme

Layouts fall into three sorts.

| Sort | Examples | What it encodes |
|---|---|---|
| Structural | `two-cols` `image-left` `table` `toc` | Nothing but the arrangement of content |
| Rhetorical | `process-flow` `steps` `compare` `cards` `quote` | A way of carrying an argument |
| Ornamental | `frame-panel` `section-frame` `title-sandwich` `figure-side` | The theme's own visual idea |

The rule:

> Spread a layout only to a **Page** theme, and only when it is **structural or rhetorical**.

- Never to a Chrome or Palette theme. The built-ins already cover them, and extra layouts cost
  maintenance without touching the identity.
- Never an ornamental layout, even between Page themes. A frame layout means nothing in a theme
  that has no frame.
- Spreading means **copying the contract, not the implementation**. Share the slots and their
  meaning; let each theme write the CSS in its own visual language.

## How a theme is styled

The kind decides the CSS architecture as well, and the eight themes already split that way.
The size of a stylesheet tracks the number of layouts, nothing else:

| Theme | Kind | Layouts | Stylesheet | Semantic classes | Utilities in templates |
|---|---|---:|---:|---:|---:|
| academic | Chrome | 6 | 25 | 3 | 33 |
| frankfurt | Chrome | 2 | 98 | 4 | 19 |
| vscode-dark | Chrome | 0 | 208 | 5 | 0 |
| dracula | Palette | 9 | 202 | 8 | 11 |
| paiza | Palette | 6 | 148 | 10 | 13 |
| cobalt | Page | 19 | 1108 | 60 | 0 |
| emerald-synth | Page | 21 | 1215 | 76 | 3 |
| barrel | Page | 21 | 1193 | 76 | 3 |

Which gives the rule:

| Kind | Templates | Stylesheet |
|---|---|---|
| Chrome | UnoCSS utilities, written inline | Only what a utility cannot express |
| Palette | Lean on the built-in structure | Re-colour it, reaching for utilities via `@apply` |
| Page | Semantic class names only | Every appearance decision lives here |

This is a split worth keeping, not drift worth flattening. Academic's 25 lines are the right
answer for six layouts and emerald-synth's 1215 are the right answer for twenty-one; rewriting
either into the other's shape would cost a great deal and buy nothing. It is the same reason a
layout does not spread across kinds.

The three rules below apply to every theme regardless of kind.

### Appearance lives in `styles/*.css`

Not in a scoped `<style>` block inside a layout.

Mostly this is so there is one place to look. For emerald-synth and barrel it is also load
bearing: `pnpm check:themes` reads `styles/*.css` and nothing else, so a rule that moves into a
layout drops out of the comparison silently.

A component may keep a scoped block for something genuinely local to it — vscode-dark's
`Footer.vue` is a fair use — but a layout's appearance belongs in the sheet. Paiza is the one
theme that does otherwise: six of its layouts carry their own `<style>` block, and `default.vue`
leaves that block unscoped, so it is global CSS hidden inside a component.

### Reach for UnoCSS with `@apply`, and keep the values plain CSS

`@apply` and `--at-apply` do the same job, and one spelling is enough.

Two UnoCSS shorthands have to stay out of stylesheets: the `$var` form (`text-$foreground`) and
bracket values (`next-[p]-mt-2`). Biome's CSS parser reads neither, and its formatter corrupts
the second into `next- [p] -mt-2`. Between them they are why
`themes/dracula/styles/layout.css` is excluded from linting altogether. Write `var(--foreground)`
and ordinary CSS instead.

### Tokens should be reachable from both sides

A theme that defines colour tokens should also publish them through `uno.config.ts`:

```ts
theme: { colors: { "es-accent": "var(--es-accent)" } }
```

The stylesheet then writes `var(--es-accent)` while a deck author writes `text-es-accent` in
markdown, and both land on the same value. Emerald-synth, barrel and paiza bridge their tokens
this way. Cobalt defines an equivalent set — a mirror of Tailwind's colour and spacing scales —
but no bridge, so a cobalt deck cannot reach them.

Token *naming* is deliberately not settled here. Four conventions are in use (`--es-*`, `--br-*`,
`--slidev-theme-*`, and cobalt's `--color-*` / `--size-*`), and choosing between them is a
separate question from making them reachable.

## The shared skeleton

Emerald-synth took its page structure from cobalt, and barrel took it from emerald-synth. The
result is that emerald-synth and barrel are **structurally identical**: measured across their
stylesheets, every remaining difference is a colour, a border, a shadow or a font weight, and
not one is a `display`, `flex`, `grid`, `gap`, `padding` or `width`.

They stay separate packages anyway. Each is published as its own Slidev theme and named for its
own palette, so folding them into one theme with a palette switch — the way paiza handles its
five brands — would cost more than the duplication does.

The duplication was never the real harm. The harm was that barrel could lose 136 lines of CSS,
ship `cards` and `compare` with nothing styling them, and have no build, lint or deck notice.
`pnpm check:themes` compares the class selectors the themes define and fails on anything that
exists in one and not the other.

So when a layout is added to one of them, adding it to the other becomes a decision rather than
something that quietly never happens. If the skeletons should genuinely diverge one day, add to
the script's `ALLOWED_ONLY_IN` or drop the check — it is guarding a choice, not a law.

### The shared vocabulary

The check passes with `ALLOWED_ONLY_IN` empty, which is the useful state: emerald-synth and
barrel share every class name, so a deck moves between them without edits.

That is why the class names say what a thing is for and not what it looks like. `quote`,
`frame-panel` and `panel` take a `color`, and the values are the same in both themes:

| Value | Meaning |
|---|---|
| `primary` | The theme's main foreground |
| `accent` | The theme's signature highlight |
| `muted` | De-emphasised |

`.emphasis` and `.emphasis-accent` follow the same rule: a text effect in the theme's own idiom,
a neon glow in emerald-synth and a warm lift in barrel, under one name.

A name that only makes sense in one palette — `cyan`, `warm`, `neon-text`, `blue` — is a reason
to find a neutral one, not a reason to add an exception.

Cobalt uses this vocabulary too, minus `muted`, which it has no rule for. What differs is the
default: cobalt puts dark text on light panels, so its signature blue reads as a highlight
against the body colour rather than as the body colour itself. Its `quote` therefore defaults to
`accent` where the other two default to `primary`. The words mean the same thing in all three;
only the choice of default differs.

### Cobalt is outside the check

Cobalt is the older fork: no `cards` or `compare`, and a different `panel` contract. It is
internally consistent, so nothing is broken, but pulling it into `check:themes` would need a
longer exception list than the check is worth. The shared vocabulary above is a separate matter
and does apply to it.

## Naming layouts

Layout names decide how portable a deck is. A deck that says `layout: process-flow` can only
move to a theme that has that name.

- Use a built-in name whenever it fits (`cover`, `section`, `two-cols`, `image-left`,
  `image-right`, `quote`, `statement`, `fact`, `center`, `end` and so on).
- Invent a name only for a genuinely new shape of slide.

Two names still overlap on purpose. Academic's `toc` renders Slidev's `<Toc />` while its
`index` takes an `indexEntries` prop and can link outside the deck — same idea, genuinely
different contracts. Dracula's `author` and the Page themes' `profile` are likewise both person
slides, but `author` styles plain markdown while `profile` has named slots; dracula is a Palette
theme, so the rule above never asks them to converge.
