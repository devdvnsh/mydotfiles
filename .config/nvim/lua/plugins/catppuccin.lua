return {
	"Mofiqul/vscode.nvim",
	name = "vscode",
	lazy = false, -- Load the plugin immediately
	priority = 1000, -- Ensure it loads before other plugins

	config = function()
		require("vscode").setup({
			transparent = true, -- Enable transparency
			-- color_overrides = {
			-- 	vscCursorLine = "#3e4451", -- Soft gray for current line background
			-- 	vscCursorLineNumber = "#c5c8c6", -- Light gray for the line number
			-- },
		})
		vim.cmd.colorscheme("vscode")
		-- Directly customize CursorLine and CursorLineNr
		-- " vim.cmd([[
		-- "   highlight CursorLine guibg=#000000  Soft gray for current line background
		-- "   highlight CursorLineNr guifg=#c5c8c6 guibg=#000000 - Light gray for line numbers
		-- " ]])
	end,
}

-- return {
-- 	"sainnhe/gruvbox-material",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("set background=dark")
-- 		vim.g.gruvbox_material_background = "hard"
-- 		vim.g.gruvbox_material_transparent_background = 1 -- Enable transparency
-- 		vim.cmd.colorscheme("gruvbox-material")
-- 	end,
-- }
--

-- return {
-- 	"sainnhe/everforest",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("set background=dark")
-- 		vim.g.everforest_background = "hard"
-- 		vim.g.everforest_transparent_background = 1 -- Enable transparency
-- 		vim.cmd.colorscheme("everforest")
-- 	end,
-- }

-- return {
-- 	"shaunsingh/nord.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.nord_disable_background = true -- Enable transparency
-- 		vim.cmd.colorscheme("nord")
-- 	end,
-- }

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("rose-pine").setup({
--       disable_background = true, -- Enable transparency
--     })
--     vim.cmd.colorscheme("rose-pine")
--   end,
-- }

-- good highlighting
-- return {
--   "olimorris/onedarkpro.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("onedarkpro").setup({
--       options = {
--         transparency = true, -- Enable transparency
--       },
--     })
--     vim.cmd.colorscheme("onedark")
--   end,
-- }

-- return {
--   "Mofiqul/dracula.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("dracula").setup({
--       transparent_bg = true,                                        -- Enable transparency
--       overrides = {
--         CursorLine = { bg = "#44475a" },                            -- Dark purple for the current line's background
--         CursorLineNr = { fg = "#ffb86c", bg = "#44475a", bold = true }, -- Orange for the current line's number
--      },
--     })
--     vim.cmd.colorscheme("dracula")
--   end,
-- }
