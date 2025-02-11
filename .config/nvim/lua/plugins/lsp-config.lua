return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = {
          "pylint",
          "mypy",
          "ruff",
          "pyright",
          "lua_ls",
          "ts_ls",
          "ast_grep",
          "angularls",
          "graphql",
          "clangd",
          "clang-format",
          "tailwindcss",
          "prettier",
          "stylua",
          "eslint_d",
          "js-debug-adapter",
          "black",
        },
        automatic_installation = true, -- Enable auto-installation
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "cssls",
          "lua_ls",
          "ts_ls",
          "ast_grep",
          "angularls",
          "graphql",
          "clangd",
          "tailwindcss",
        },
        automatic_installation = true, -- Install LSPs automatically
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local map = vim.keymap.set
      local M = {}
      M.on_attach = function(_, bufnr)
        local function opts(desc)
          return { buffer = bufnr, desc = "LSP " .. desc }
        end
        map("n", "K", vim.lsp.buf.hover, opts("Hover"))
        map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
        map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
        map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
        map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
        map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
        map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

        map("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts("List workspace folders"))

        map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))

        map("n", "<leader>ra", ":IncRename ", opts("Rename"))
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
        map("n", "gr", vim.lsp.buf.references, opts("Show references"))
      end

      M.capabilities = require("cmp_nvim_lsp").default_capabilities()
      M.capabilities.textDocument.completion.completionItem = {
        documentationFormat = { "markdown", "plaintext" },
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = { valueSet = { 1 } },
        resolveSupport = {
          properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
          },
        },
      }

      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = M.capabilities,
        on_attach = M.on_attach,
      })
      lspconfig.ts_ls.setup({
        capabilities = M.capabilities,
        on_attach = M.on_attach,
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
      })

      lspconfig.tailwindcss.setup({
        capabilities = M.capabilities,
        on_attach = M.on_attach,

        filetypes = {
          "html",
          "css",
          "javascript",
          "typescript",
          "react",
          "jsx",
          "tsx",
          "javascriptreact",
          "plaintext",
          "scss",
        },
      })
      lspconfig.pyright.setup({
        capabilities = M.capabilities,
        on_attach = M.on_attach,
        filetypes = { "python" },
      })
      lspconfig.angularls.setup({
        capabilities = M.capabilities,
        on_attach = M.on_attach,
      })
      lspconfig.graphql.setup({
        capabilities = M.capabilities,
        on_attach = M.on_attach,
      })
      lspconfig.ast_grep.setup({
        capabilities = M.capabilities,
        on_attach = M.on_attach,
      })
      lspconfig.clangd.setup({
        capabilities = M.capabilities,
        on_attach = function(client, bunfr)
          client.server_capabilities.signatureHelpProvider = false
          local function opts(desc)
            return { buffer = bufnr, desc = "LSP " .. desc }
          end
          map("n", "K", vim.lsp.buf.hover, opts("Hover"))
          map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
          map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
          map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
          map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
          map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
          map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

          map("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts("List workspace folders"))

          map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))

          map("n", "<leader>ra", ":IncRename ", opts("Rename"))
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
          map("n", "gr", vim.lsp.buf.references, opts("Show references"))
        end,
      })
    end,
  },
}
