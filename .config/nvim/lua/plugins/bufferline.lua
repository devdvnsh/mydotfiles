return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "ordinal",      -- Display buffer numbers
          diagnostics = "nvim_lsp", -- Show diagnostics in tabs
          separator_style = "slant", -- Separator style for buffers
          always_show_bufferline = true, -- Always display bufferline
          offsets = {
            {
              filetype = "NvimTree", -- don't show bufferline when nvimtree is open
              text = "",      -- title for the offset
              highlight = "directory",
              text_align = "left",
            },
          },
          show_buffer_close_icons = true, -- show close icons for buffers
          show_close_icon = false,   -- hide global close icon
          color_icons = true,        -- use filetype icons
        },
        highlights = {
          buffer_selected = {
            fg = "#ffffff", -- white text for selected buffer
            bold = true,
          },
          buffer_visible = {
            fg = "#bbbbbb", -- dim white text for unselected buffers
          },
          fill = {
            bg = "#1e222a", -- background color for bufferline
          },
          separator = {
            fg = "#1e222a", -- separator color
          },
          separator_selected = {
            fg = "#61afef", -- separator color for selected buffer
          },
        },
      })

      -- keybindings for bufferline
      vim.keymap.set("n", "<tab>l", function()
        for _ = 1, vim.v.count1 do
          -- cycle to the next buffer, wrapping to the first if at the last buffer
          vim.cmd("BufferLineCycleNext")
        end
      end, { desc = "next buffer (with wrap)" })

      vim.keymap.set("n", "<tab>h", function()
        for _ = 1, vim.v.count1 do
          -- cycle to the previous buffer, wrapping to the last if at the first buffer
          vim.cmd("BufferLineCyclePrev")
        end
      end, { desc = "previous buffer (with wrap)" })

      vim.keymap.set("n", "<tab>t", ":bdelete | bnext | bfirst<cr>", { desc = "close current buffer" })
      vim.keymap.set("n", "<c-tab>", function()
        local bufnum = vim.fn.input("enter buffer number: ")
        vim.cmd("bufferlinegotobuffer " .. bufnum)
      end, { desc = "go to buffer by number" })
      vim.keymap.set("i", "<c-tab>l", function()
        for _ = 1, vim.v.count1 do
          vim.cmd("BufferLineCycleNext")
        end
      end, { desc = "next buffer in insert mode (with wrap)" })

      vim.keymap.set("i", "<c-tab>h", function()
        for _ = 1, vim.v.count1 do
          vim.cmd("BufferLineCyclePrev")
        end
      end, { desc = "previous buffer in insert mode (with wrap)" })

      vim.keymap.set(
        "i",
        "<c-tab>t",
        ":bdelete | bnext | bfirst<cr>",
        { desc = "Close current buffer in Insert mode" }
      )

      vim.keymap.set("i", "<C-Tab>", function()
        local bufnum = vim.fn.input("Enter buffer number: ")
        vim.cmd("BufferLineGoToBuffer " .. bufnum)
      end, { desc = "Go to buffer by number in Insert mode" })
    end,
  },
  {
    "nvim-tree/nvim-web-devicons", -- Optional dependency for icons
  },
}
