return {
  "tpope/vim-commentary",
  config = function()
    -- Key mappings for vim-commentary
    vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false })    -- Normal mode
    vim.api.nvim_set_keymap("v", "<C-/>", "gc", { noremap = false })     -- Visual mode
    vim.api.nvim_set_keymap("i", "<C-/>", "<ESC>gcc", { noremap = false }) -- Insert mode

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*",
      callback = function()
        vim.opt.formatoptions:remove("o")
      end,
    })
  end,
}
