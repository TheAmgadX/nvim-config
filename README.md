# Neovim Config Setup

## 🚀 Introduction
This repository contains my customized Neovim setup using **lazy.nvim** for plugin management. It includes a modern theme, LSP support, auto-completion, file explorer, buffer management, and more.

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
This setup uses **Nightfox** theme by default (you can choose between **Carbonfox** or **Duskfox**).

To change the theme:
1. Open `init.lua`
2. Modify the theme configuration:
   ```lua
   -- Theme configuration using Nightfox
   require('nightfox').setup({
       options = {
           transparent = true,    -- Enable transparent background
           terminal_colors = true, -- Use terminal colors
       },
       palettes = {
           carbonfox = {
               bg = '#1f1f1f',  -- Example for Carbonfox
           },
           duskfox = {
               bg = '#232a3d',  -- Example for Duskfox
           },
       }
   })
   vim.cmd.colorscheme("carbonfox")  -- or "duskfox" based on your choice
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

### Adding a New Language to Treesitter
1. Open Neovim and run:
   ```bash
   :TSInstall <language>
   ```
   Example for Rust:
   ```bash
   :TSInstall rust
   ```
2. Restart Neovim to apply changes.

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
| `K`      | Hover documentation         |
| `gd`     | Go to definition            |
| `gr`     | Find references             |
| `gi`     | Go to implementation        |
| `go`     | Type definition             |
| `gf`     | Signature help              |
| `nc`     | Rename symbol               |
| `F`      | Format code                 |
| `<F2>`   | Code actions                |

### Other Keybindings
| Shortcut       | Action                           |
|---------------|---------------------------------|
| `<C-Space>`   | Trigger completion menu        |
| `<C-u>`       | Scroll completion up           |
| `<C-d>`       | Scroll completion down         |
| `<leader>e`   | Toggle file explorer           |
| `<leader>f`   | Find files (Telescope)         |
| `<leader>g`   | Live grep (Telescope)          |
| `<Tab>`       | Next buffer                    |
| `<S-Tab>`     | Previous buffer                |

