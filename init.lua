-- 📌 General Settings
vim.g.mapleader = " "  -- Set leader to Space
vim.g.maplocalleader = " "  -- Set local leader to Space

vim.opt.tabstop = 4        -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4     -- Number of spaces used for auto-indent
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.relativenumber = true -- Enable Relative Numbers
vim.opt.termguicolors = true -- Enable true colors
vim.opt.signcolumn = 'yes'

-- 📥 Auto-install lazy.nvim if not present
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', lazypath,
  })
  print('Done.')
end
vim.opt.rtp:prepend(lazypath)

-- 📦 Plugin Setup using lazy.nvim
require('lazy').setup({
  {'catppuccin/nvim', name = 'catppuccin'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'nvim-tree/nvim-tree.lua'},
  {'nvim-telescope/telescope.nvim', dependencies = {'nvim-lua/plenary.nvim'}},
  {'akinsho/bufferline.nvim', dependencies = {'nvim-tree/nvim-web-devicons'}},
  {'windwp/nvim-autopairs'},
  {'L3MON4D3/LuaSnip'},
  {'rose-pine/neovim', name = 'rose-pine'}
})

-- 🎨 Theme Setup
--[[
-- Catppuccin Theme (commented out, previously used)
require("catppuccin").setup({
  flavour = "macchiato",
  transparent_background = true,
  integrations = {
    treesitter = true,
    nvimtree = true,
    telescope = true,
    bufferline = true,
  }
})
-- vim.cmd.colorscheme("catppuccin")
]]

-- Rose Pine Theme (Active)
require('rose-pine').setup({
    variant = 'main',
    dark_variant = 'main',
    enable_transparent = true,
    styles = {
        bold = true,
        italic = true,
        transparency = true,
    },
})

vim.cmd.colorscheme("rose-pine")

-- Ensure Neovim uses transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- 🔧 LSP Setup
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force', lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- LSP Keybindings
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gv', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', 'nc', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, 'F', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- 🛠️ Enable Language Servers
local lspconfig = require('lspconfig')
lspconfig.gopls.setup({})
lspconfig.clangd.setup({})
lspconfig.ts_ls.setup({})
lspconfig.html.setup({})
lspconfig.cssls.setup({})
lspconfig.pyright.setup({})
-- ⚡ Completion Engine (CMP)
local cmp = require('cmp')
cmp.setup({
  sources = { {name = 'nvim_lsp'}, },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

-- 📁 File Explorer (nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
  sort = { sorter = "case_sensitive" },
  view = { width = 30 },
  renderer = { group_empty = true },
  filters = { dotfiles = true },
})
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- 🔍 File Searching (Telescope)
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>", { noremap = true, silent = true })

-- 📌 Tab/Buffer Navigation (Bufferline)
require("bufferline").setup()
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- 🔄 Auto Pairs (Brackets)
require('nvim-autopairs').setup()

