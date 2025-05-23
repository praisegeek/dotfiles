-- Neovim Config for Fullstack + ML

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
-- Buffers (remain listed after editing)
-- vim.opt.hidden = true
-- vim.opt.buflisted = true
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Alias vim as nvim
vim.cmd("command! Vim :e")

-- Sets the mouse option globally for mouse events
vim.o.mouse = "a"

-- Install Plugins via packer
require("packer").startup(function(use)
   use "wbthomason/packer.nvim"
   use "nvim-lua/plenary.nvim"
   use "nvim-tree/nvim-tree.lua"
   use "nvim-tree/nvim-web-devicons"
   use "nvim-telescope/telescope.nvim"
   use "neovim/nvim-lspconfig"
   use "williamboman/mason.nvim"
   use "williamboman/mason-lspconfig.nvim"
   use "hrsh7th/nvim-cmp"
   use "hrsh7th/cmp-nvim-lsp"
   use "L3MON4D3/LuaSnip"
   use "saadparwaiz1/cmp_luasnip"
   use "nvim-treesitter/nvim-treesitter"
   use "akinsho/flutter-tools.nvim"
   use "onsails/lspkind.nvim"
   use "windwp/nvim-autopairs"
   use "numToStr/Comment.nvim"
   use "kylechui/nvim-surround"
   use "folke/which-key.nvim"
   use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
   use { "folke/snacks.nvim", priority = 1000, lazy = false, opts = {
      input = true,
      picker = true,
      table = true,
      win = true
   } }
   use "folke/tokyonight.nvim"
   use "catppuccin/nvim"
end)

-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
   ensure_installed = { "pyright", "ts_ls", "eslint", "html", "cssls", "lua_ls", "emmet_ls", "ruff" }
})

-- Nvim Surround
require("nvim-surround").setup({
   surrounds = {
      -- Add custom surround for HTML tags using 't'
      t = {
         add = function()
            local tag = vim.fn.input("HTML Tag: ")
            return { { "<" .. tag .. ">" }, { "</" .. tag .. ">" } }
         end,
      },
   },
})

-- Comment
require("Comment").setup()

-- LSP
local lspconfig = require("lspconfig")
local on_attach = function(_, bufnr)
   local map = function(keys, func) vim.keymap.set("n", keys, func, { buffer = bufnr }) end
   -- map("<leader>ca", vim.lsp.buf.code_action)
   -- map("gd", vim.lsp.buf.definition)
   -- map("gi", vim.lsp.buf.implementation)
   -- map("gr", vim.lsp.buf.references)
end

for _, server in ipairs({ "pyright", 'ts_ls', "eslint", "html", "cssls", "lua_ls", "emmet_ls", "ruff" }) do
   lspconfig[server].setup({ on_attach = on_attach })
end

-- Flutter Tools
require("flutter-tools").setup({
   lsp = { on_attach = on_attach },
   flutter_path = "fvm flutter"
})

-- Autocomplete
local cmp = require("cmp")
cmp.setup({
   snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
   mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      ["<CR>"] = cmp.mapping.confirm({ select = true })
   }),
   sources = { { name = "nvim_lsp" }, { name = "luasnip" } },
   formatting = {
      format = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })
   }
})

-- Treesitter
require("nvim-treesitter.configs").setup {
   ensure_installed = { "python", "typescript", "tsx", "javascript", "html", "css", "lua" },
   highlight = { enable = true },
   indent = { enable = true }
}

-- NvimTree
require("nvim-tree").setup({
   filters = { dotfiles = false, exclude = { vim.fn.stdpath "config" .. "/lua/custom" } },
   disable_netrw = true,
   hijack_cursor = true,
   hijack_unnamed_buffer_when_opening = false,
   sync_root_with_cwd = true,
   update_focused_file = {
      enable = true,
      update_root = false
   },
   view = {
      adaptive_size = false,
      side = "left",
      width = 30,
      preserve_window_proportions = true,
   },
   actions = {
      open_file = {
         resize_window = true
      },
      -- change_dir = { enable = true, restrict_above_cwd = true },
      -- remove_file = { close_window = false },
   },
   renderer = {
      root_folder_label = false,
      highlight_git = false,
      highlight_opened_files = "none",

      indent_markers = {
         enable = false,
      },
   }
})

-- Auto Pairs
require("nvim-autopairs").setup({})

-- Bufferline
vim.opt.termguicolors = true
vim.diagnostic.config({ update_in_insert = true })
local bufferlineOpts = {
   options = {
      mode = "buffers",
      show_buffer_close_icons = true,
      show_close_icon = false,
      separator_style = "slant",
      offsets = {
         {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
         }
      },
      hover = {
         enable = true,
         delay = 200,
         reveal = { 'close' }
      }
   }
}
require("bufferline").setup(bufferlineOpts)

-- Optional: format on save
vim.api.nvim_create_autocmd("BufWritePre", {
   pattern = vim.fn.stdpath("config") .. "/init.lua",
   callback = function()
      vim.lsp.buf.format({ async = true })
      -- require("plenary.reload").reload_module("bufferline")
      -- require("bufferline").setup(bufferlineOpts)
      -- vim.notify("Reloaded bufferline", vim.log.levels.INFO)
      -- vim.bo.buflisted = true
   end
})

require("themes.catppuccin")
-- require("custom.windows")
require("custom.mappings")
