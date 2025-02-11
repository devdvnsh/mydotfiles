return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		-- vim.g.loaded_netrw = 1
		-- vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			filters = { dotfiles = false },
			disable_netrw = true,
			hijack_cursor = true,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			view = {
				width = 30,
				relativenumber = true,
				preserve_window_proportions = true,
				side = "left", -- Display NvimTree on the left side of the window
			},
			-- Change folder arrow icons and make the look more modern
			renderer = {
				root_folder_label = false, -- Hide the root folder label
				highlight_git = true,
				indent_markers = { enable = true },
				icons = {
					glyphs = {
						default = "󰈚", -- Default file icon
						folder = {
							default = "", -- Default folder icon
							empty = "", -- Empty folder
							empty_open = "", -- Open empty folder
							open = "", -- Open folder
							symlink = "", -- Symlink folder
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			-- Disable window_picker for better experience with window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			git = {
				ignore = false,
			},
		})

		-- Set keymaps for NvimTree actions
		local keymap = vim.keymap -- for conciseness

		-- Toggle file explorer
		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

		-- Toggle file explorer on current file
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		)

		-- Collapse the file explorer
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })

		-- Refresh the file explorer
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

		-- Custom keybinding for opening NvimTree from the current file
		keymap.set("n", "<leader>ev", "<cmd>NvimTreeFocus<CR>", { desc = "Focus on file explorer" })

		-- Set transparency for NvimTree
		vim.cmd([[
      hi NvimTreeNormal guibg=NONE ctermbg=NONE
      hi NvimTreeNormalNC guibg=NONE ctermbg=NONE
      hi NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE
    ]])
	end,
}
