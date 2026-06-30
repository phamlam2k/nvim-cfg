# 💤 Neovim Config — ReactJS · Rust · C/C++

My personal [LazyVim](https://github.com/LazyVim/LazyVim)-based Neovim configuration,
tuned for three stacks:

- **ReactJS / TypeScript** — `typescript-tools.nvim` (MUI-friendly imports), Tailwind CSS, ESLint, Prettier
- **Rust** — `rustaceanvim` (rust-analyzer + clippy + inlay hints + debug)
- **C / C++** — `clangd` + `nvim-dap` (codelldb) + competitive-programming template & snippets

Works on **macOS / Linux** and **Windows**. Requires **Neovim ≥ 0.11**.

---

## ✨ Features

### ReactJS / TypeScript
- `pmizio/typescript-tools.nvim` instead of the default `ts_ls` — faster, and configured to
  prefer **non-relative direct imports** (e.g. `@mui/material/Button`), great for Material UI.
- LSP servers: `tailwindcss`, `html`, `cssls`, `jsonls`.
- Tailwind completion also recognizes `class`, `className`, `clsx`, and `cva` attributes.
- **Linting**: `nvim-lint` with `eslint_d` on save.
- **Formatting**: `conform.nvim` with `eslint_d` (+ LazyVim's Prettier extra).
- Auto `EslintFixAll` on save when an ESLint client is attached.

### Rust
- `mrcjkb/rustaceanvim` (v5) manages rust-analyzer — the default `rust_analyzer` is disabled
  on both `mason-lspconfig` and `nvim-lspconfig` to avoid running **two** rust-analyzer
  processes against the same project.
- `checkOnSave` runs **clippy** (`--no-deps`), all Cargo features enabled, proc-macros on,
  inlay hints (parameter / type / chaining).
- Format-on-save via the LSP.
- `saecki/crates.nvim` for `Cargo.toml` (crate versions / updates).

#### Rust keymaps (buffer-local, normal mode)
| Key  | Action |
|------|--------|
| `K`  | Hover docs |
| `gd` | Go to definition |
| `gr` | References |
| `rn` | Rename symbol |
| `ra` | Code action |
| `rr` | Runnables ▶ |
| `rt` | Testables |
| `re` | Expand macro |
| `rc` | Open `Cargo.toml` |
| `rd` | Debug (debuggables) |

### C / C++
- `clangd` with `--background-index`, `--clang-tidy`, detailed completion, function-arg
  placeholders, `utf-16` offset encoding (fixes a common C++ encoding issue).
- `<leader>ch` — switch between source / header.
- **Debugging**: `nvim-dap` with the `codelldb` adapter (auto-detected via `vim.fn.exepath`).
- **New `.cpp` files** are pre-filled from `templates/cpp.cpp` (competitive-programming skeleton).
- Custom C++ snippets in `lua/snippets/cpp.lua`.
- `<leader>r` — compile & run the current C++ file with `g++ -std=c++20 -O2` in a split terminal.

### General
- GitHub **Copilot** (`copilot.lua`) with inline suggestions: `Alt+l` accept, `Alt+]`/`Alt+[`
  next/prev, `Ctrl+]` dismiss. Plus Copilot Chat (LazyVim extra).
- LuaSnip + friendly-snippets.
- Sensible options: relative numbers, 4-space indent, `signcolumn=yes`, `scrolloff=8`,
  no swapfile, true color, cursorline.

---

## 📦 Prerequisites

Neovim only edits the code — the language toolchains must be installed on the OS.
LazyVim's **Mason** auto-installs the editor tools (`rust-analyzer`, `clangd`, `codelldb`,
`eslint_d`, `prettier`, …) on first launch, but you still need the compilers/runtimes:

| Stack       | Install on your machine |
|-------------|--------------------------|
| ReactJS/TS  | [Node.js](https://nodejs.org) (`node`, `npm`) |
| Rust        | [rustup](https://rustup.rs) (`cargo`, `rustc`) |
| C / C++     | A compiler + debugger — `gcc`/`g++` or `clang`/LLVM (Windows: MSVC Build Tools or MinGW-w64) |

> **Note:** `templates/cpp.cpp` uses `#include <bits/stdc++.h>` and the `<leader>r`
> mapping calls `g++`. These assume a **GCC/MinGW** toolchain. With MSVC, swap them for
> your own headers / build command.

---

## 🚀 Installation

> ⚠️ Back up any existing Neovim config first.

### macOS / Linux
```bash
git clone https://github.com/phamlam2k/nvim-cfg.git ~/.config/nvim
nvim   # Lazy + Mason auto-install everything on first launch
```

### Windows (PowerShell)
```powershell
git clone https://github.com/phamlam2k/nvim-cfg.git $env:LOCALAPPDATA\nvim
nvim   # Lazy + Mason auto-install everything on first launch
```

The config path differs by OS:

| OS            | Path |
|---------------|------|
| macOS / Linux | `~/.config/nvim` |
| Windows       | `%LOCALAPPDATA%\nvim` (i.e. `C:\Users\<you>\AppData\Local\nvim`) |

All internal paths use `vim.fn.stdpath("config")`, so they resolve correctly on both.

After the first launch:
- `:Lazy` — check plugin status
- `:Mason` — check / install LSP servers, formatters, linters, debug adapters
- `:checkhealth` — verify everything is wired up

`lazy-lock.json` is committed so every machine installs the **exact same plugin versions**.

---

## 📁 Structure

```
nvim/
├── init.lua                 # bootstraps lua/config/lazy.lua
├── lazy-lock.json           # pinned plugin versions (committed)
├── lazyvim.json             # enabled LazyVim extras
├── templates/cpp.cpp        # C++ new-file template
└── lua/
    ├── config/              # options, keymaps, autocmds, lsp, lazy bootstrap
    ├── plugins/             # rust, debug (cpp), typescript, tailwind, lint, format, copilot, snippets
    └── snippets/            # cpp.lua
```

---

## 📝 License

[Apache-2.0](./LICENSE)
