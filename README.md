# Neovim Config Setup

## 🚀 Introduction
This repository contains my customized Neovim setup using **lazy.nvim** for plugin management. It includes a modern theme, LSP support, auto-completion, file explorer, and more.

## 📥 Installation
### Prerequisites
- Neovim (v0.8+)
- Git
- A terminal with true color support

### Steps
```bash
# Clone this repository
mkdir -p ~/.config/nvim && git clone https://github.com/TheAmgadX/nvim-config ~/.config/nvim

# Open Neovim and install plugins
nvim
# Run :Lazy install inside Neovim
```

## 🎨 Themes
This setup uses **Catppuccin Mocha** by default. To change the theme:
1. Open `init.lua`
2. Modify the `flavour` inside the `require("catppuccin").setup()` block:
   ```lua
   require("catppuccin").setup({
     flavour = "latte", -- Options: latte, frappe, macchiato, mocha
   })
   vim.cmd.colorscheme("catppuccin")
   ```

## 🛠️ Features
- **LSP Support** (Go, C/C++, Python, JavaScript, TypeScript, HTML, CSS)
- **Autocompletion** via `nvim-cmp`
- **File Explorer** (`nvim-tree`)
- **Buffer Management** (`bufferline`)
- **Fuzzy Finder** (`telescope.nvim`)
- **Auto Brackets** (`nvim-autopairs`)
- **Transparent Dark Theme**

## 🔧 Customization Guide
### Adding a New Language to LSP
1. Open `init.lua`
2. Find the **Enable Language Servers** section
3. Add your desired LSP setup, e.g., for Rust:
   ```lua
   lspconfig.rust_analyzer.setup({})
   ```
4. Restart Neovim.

### Changing Keybindings
1. Open `init.lua`
2. Modify the `vim.keymap.set()` entries.
   Example: Change `<leader>e` (toggle file explorer) to `<leader>n`:
   ```lua
   vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
   ```
3. Save and restart Neovim.

## ⌨️ Keybindings
### General
| Shortcut        | Action                  |
|----------------|-------------------------|
| `<leader>e`    | Toggle file explorer    |
| `<leader>f`    | Find files (Telescope)  |
| `<leader>g`    | Live grep (Telescope)   |
| `<Tab>`        | Next buffer             |
| `<S-Tab>`      | Previous buffer         |

### LSP Keybindings
| Shortcut  | Action                      |
|----------|-----------------------------|
| `gd`     | Go to definition            |
| `gr`     | Find references             |
| `gi`     | Go to implementation        |
| `go`     | Type definition             |
| `nc`     | Rename symbol               |

## 📜 License
MIT License


