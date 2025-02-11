vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- keymap.set("i", "<C-/>", "<ESC>gcc", { desc = "comments in insert mode" })
-- keymap.set("n", "<C-/>", "gcc", { desc = "comments in normal mode" })
-- keymap.set("v", "<C-/>", "gc", { desc = "comments in visual mode" })
keymap.set("n", "<leader>pv", vim.cmd.Explore, { desc = "Open the explorer for vim" })
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "<C-BS>", "<C-w>", { desc = "" })
keymap.set("i", "<C-z>", "<ESC>ua", { desc = "" })
-- Create a new line below in insert mode with Ctrl + Enter
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

keymap.set("n", "J", "mzJ`z", { desc = "append the line next to j to current line" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "jump page down without moving cursor" })

keymap.set("n", "<C-u>", "<C-u>zz", { desc = "jump page up without moving cursor" })

keymap.set("n", "n", "nzzzv", { desc = "keep the search result in middle,next" })
keymap.set("n", "N", "Nzzzv", { desc = "keep the search result in middle,previous" })

keymap.set("x", "<leader>p", '"_dp', { desc = "delete the highlighted word and paste without loosing copied content" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
-- Save and format with Ctrl+s
keymap.set({ "n", "i", "v" }, "<C-s>", function()
  vim.lsp.buf.format()                                                                        -- Format the file
  vim.cmd("w")                                                                                -- Save the file
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true) -- Exit to normal mode
end, { desc = "Save and format file" })
-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close Current tab" })
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
-- keymap.set("n", "<leader>tf", "<cmd>tabnew<CR>", { desc = " open current buffer in new tab" })

local opt = vim.opt

opt.relativenumber = true
opt.number = true
-- opt.nu = true

-- tabs & indentation
opt.tabstop = 2       -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2    -- 2 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting a new one

opt.wrap = true

-- search settings
opt.ignorecase = true --ignore case when searching
opt.smartcase = true  --if you include mixed case in your search , assumes you want case-sensitive
opt.hlsearch = false
opt.incsearch = true

opt.cursorline = true

opt.scrolloff = 8
-- turn on termguicolors to tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" --colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"  --show sign coloumn so that text doesn't shift

--backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboad as default register

-- split windows
opt.splitright = true -- split vertical windows to the right
opt.splitbelow = true -- split horizontal windows to the bottom
