vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    local ok, api = pcall(require, "nvim-tree.api")
    if not ok then return end

    -- Get total window width
    local win_width = vim.o.columns

    -- Set NvimTree to 20% of window width
    local target_width = math.floor(win_width * 0.2)

    -- Resize the tree pane
    api.tree.resize(target_width)

    -- Optionally equalize all other splits
    vim.cmd("wincmd =")
  end,
})
