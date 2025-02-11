return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvimtools/none-ls-extras.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      debug = true,
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.diagnostics.rubocop,

        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.pylint.with({
          extra_args = { "--disable=line-too-long", "--max-line-length=120" }, -- Disable line-too-long and set max length
        }),
        require("none-ls.diagnostics.eslint_d").with({
          extra_args = {
            "--rule",
            "no-unused-vars:off",
            "--rule",
            "@typescript-eslint/no-unused-vars:off",
            "--rule",
            "prefer-const:off", -- Disable the prefer-const rule
          },
        }),
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "html", "ejs.html" }, -- Add EJS to Prettier's file types
        }),
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
