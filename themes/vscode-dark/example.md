---
theme: ./
colorSchema: dark
title: VS Code Dark Theme
author: yourname
link: slides.example.com
---

# VS Code Dark Theme

Slidev theme inspired by Visual Studio Code

<div class="pt-12">
  <span @click="next" class="px-2 p-1 rounded cursor-pointer hover:bg-white hover:bg-opacity-10">
    Press Space for next page <carbon:arrow-right class="inline"/>
  </span>
</div>

---

# What is Slidev?

Slidev is a slides maker and presenter designed for developers

- 📝 **Text-based** - focus on the content with Markdown
- 🎨 **Themable** - theme can be shared and used with npm packages
- 🧑‍💻 **Developer Friendly** - code highlighting, live coding
- 🤹 **Interactive** - embedding Vue components
- 🎥 **Recording** - built-in recording and camera view
- 📤 **Portable** - export into PDF, PNGs, or SPA

---

## Features

### Code Highlighting

```ts
interface User {
  id: number
  firstName: string
  lastName: string
  role: string
}

function updateUser(id: number, update: Partial<User>) {
  const user = getUser(id)
  const newUser = { ...user, ...update }
  saveUser(id, newUser)
}
```

---

## Blockquote Example

> The best way to predict the future is to invent it.
> — Alan Kay

---

## Ordered List

1. Numbered items get their own marker styling
2. The counter colour follows the editor palette
3. Nesting works the same way

<img src="https://sli.dev/logo.png" class="w-32 mt-8" alt="Slidev logo" />

---
layout: center
---

<div class="center-content">

# Centred Block

`center-content` centres a block and tightens its lists.

- Use it inside `layout: center`
- Or anywhere a block needs to sit on its own

</div>

---
layout: center
class: "text-center"
---

# Learn More

[Documentations](https://sli.dev) · [GitHub](https://github.com/slidevjs/slidev)
