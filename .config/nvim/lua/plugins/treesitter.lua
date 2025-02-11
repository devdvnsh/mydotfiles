return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      --    ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "cpp", "css", "go", "http", "json", "json5", "nginx", "php", "python", "rust", "sql", "typescript", "tsx", "graphql","ejs"},
      auto_install = true,
      highlight = { enable = true },

      indent = { enable = true },
    })
  end,
}
