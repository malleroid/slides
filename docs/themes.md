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
bringing 20 layouts and over 1100 lines of CSS with it.

### emerald-synth — Page

Cobalt's page structure with the [emerald-synth](https://github.com/malleroid/emerald-synth)
palette and neon glow effects (`styles/effects.css`) on top. 22 layouts.

### barrel — Page

Emerald-synth's page structure re-clothed in warm amber with Libre Baskerville serif headings.
22 layouts.

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
exists in one and not the other. Palette-specific names are declared in the script's
`ALLOWED_ONLY_IN`.

So when a layout is added to one of them, adding it to the other becomes a decision rather than
something that quietly never happens. If the skeletons should genuinely diverge one day, widen
that list or drop the check — it is guarding a choice, not a law.

Cobalt sits outside the check. It is the older fork: no `cards` or `compare`, and a different
`panel` contract. It is internally consistent, and forcing it back into line would mean a longer
exception list than the check is worth.

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
