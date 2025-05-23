require("catppuccin").setup({
   flavour = "mocha",
   integrations = {
      nvimtree = true,
      treesitter = true,
      mason = true,
      cmp = true,
      lsp_saga = true,
   }
})

vim.cmd [[colorscheme catppuccin]]
