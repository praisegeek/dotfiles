-- n, v, i, t = mode names

-- Goto beginning and end of line within insert mode
vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "End of line" })

-- Highlight
vim.keymap.set("n", "<Esc>", ":noh <CR>", { desc = "Clear highlights" })
vim.keymap.set("n", "<leader>h", "v$", { desc = "Highlight to end of line" })
vim.keymap.set("n", "<leader>H", "v0", { desc = "Highlight to beginning of line" })
vim.keymap.set("n", "<leader>l", "^vg_", { desc = "Highlight entire line" })

-- Surround with HTML tag
vim.keymap.set("n", "<leader>,", function()
  vim.cmd("normal! ^vg_")
  local tag = vim.fn.input("HTML Tag: ")
  return "S" .. "<" .. tag .. ">" .. "\r" .. "</" .. tag .. ">"
end, { expr = true, desc = "Wrap current line in HTML tag" })

-- Line numbers
vim.keymap.set("n", "<leader>n", "<cmd> set nu! <CR>", { desc = "Toggle line number" })
vim.keymap.set("n", "<leader>rn", "<cmd> set rnu! <CR>", { desc = "Toggle relative number" })

-- Window Navigation
vim.keymap.set("n", "<leader><Left>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<leader><Right>", "<C-w>l", { desc = "Window right" })
vim.keymap.set("n", "<leader><Up>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<leader><Down>", "<C-w>j", { desc = "Window down" })

-- Bufferline
vim.keymap.set("n", "<Tab>", "<cmd> bnext <CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd> bprevious <CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", { desc = "New buffer" })
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Close buffer" })

-- Save/Copy
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", { desc = "Save file" })
vim.keymap.set("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "Copy whole file" })

-- Terminal mode escape
vim.keymap.set("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), { desc = "Escape terminal mode" })

-- Comments
vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })

vim.keymap.set("v", "<leader>/", function()
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment" })

-- LSP
vim.keymap.set("n", "<leader>I", vim.lsp.buf.hover, { desc = "LSP Hover" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code action" })
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "LSP Type definition" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Definition" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "LSP Implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP References" })
vim.keymap.set("n", "<leader>F", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "Floating Diagnostic" })
vim.keymap.set("n", "[d", function()
  vim.diagnostic.goto_prev { border = "rounded" }
end, { desc = "Goto Prev Diagnostic" })
vim.keymap.set("n", "]d", function()
  vim.diagnostic.goto_next { border = "rounded" }
end, { desc = "Goto Next Diagnostic" })
vim.keymap.set("n", "<leader>fm", function()
  vim.lsp.buf.format { async = true }
end, { desc = "LSP Formatting" })
vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
vim.keymap.set("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

-- NvimTree
vim.keymap.set("n", "fa", "<cmd> NvimTreeCreateFile <CR>", { desc = "Create file" })
vim.keymap.set("n", "fs", "<cmd> NvimTreeFindFile <CR>", { desc = "Find file in tree" })
vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
vim.keymap.set("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", { desc = "Focus nvimtree" })

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", { desc = "Find all files" })
vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "Old files" })
vim.keymap.set("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "Fuzzy find in buffer" })
vim.keymap.set("n", "<leader>ma", "<cmd> Telescope marks <CR>", { desc = "Find marks" })

-- Git
vim.keymap.set("n", "<leader>cm", "<cmd> Telescope git_commits <CR>", { desc = "Git commits" })
vim.keymap.set("n", "<leader>gt", "<cmd> Telescope git_status <CR>", { desc = "Git status" })

-- Terminal picker
vim.keymap.set("n", "<leader>pt", "<cmd> Telescope terms <CR>", { desc = "Pick hidden terminal" })

-- Theme switcher
vim.keymap.set("n", "<leader>th", "<cmd> Telescope themes <CR>", { desc = "Switch themes" })

-- Which-key
vim.keymap.set("n", "<leader>wa", "<cmd> WhichKey <CR>", { desc = "WhichKey: all" })
vim.keymap.set("n", "<leader>wk", function()
  local input = vim.fn.input "WhichKey: "
  vim.cmd("WhichKey " .. input)
end, { desc = "WhichKey query" })
