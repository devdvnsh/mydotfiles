-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "failed to clone lazy.nvim:\n", "errormsg" },
			{ out, "warningmsg" },
			{ "\npress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
vim.filetype.add({
	extension = {
		ejs = "ejs",
		-- Associate .ejs files with the 'ejs' file type
	},
})
-- Automatically set the filetype of .ejs files to html
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
-- 	pattern = "*.ejs", --  Files with ".myext" extension
-- 	callback = function()
-- 		vim.bo.filetype = "html" -- Treat them as Python files
-- 	end,
-- })
require("vim-options")
require("lazy").setup("plugins")

-- -- Function to check if inside tmux
-- local function inside_tmux()
-- 	return os.getenv("TMUX") ~= nil
-- end

-- -- Only save session if inside tmux
-- if inside_tmux() then
-- 	vim.opt.sessionoptions = "buffers,curdir,folds,tabpages,winsize"

-- 	-- Auto-save session on exit
-- 	vim.cmd([[
--     autocmd VimLeavePre * mksession! ~/.config/nvim/tmux_session.vim
--   ]])

-- 	-- Auto-load session when starting Neovim inside tmux
-- 	vim.cmd([[
--     autocmd VimEnter * if argc() == 0 | source ~/.config/nvim/tmux_session.vim | endif
--   ]])
-- end
