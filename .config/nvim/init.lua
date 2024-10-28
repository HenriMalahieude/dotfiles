--Standard
vim.g.mapleader = " "
vim.g.title = false

--NetRW Configs
vim.g.netrw_banner = 0
--vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3

--Options
vim.opt.syntax = "ON"
vim.opt.backup = false
vim.opt.compatible = false
vim.opt.number = true
--vim.opt.relativenumber = false --for now I don't enjoy this
--vim.opt.mouse = 'a' --annoying
vim.opt.tabstop = 4 --spaces
vim.opt.shiftwidth = 4
vim.opt.fileencoding = "utf-8"
vim.opt.pumheight = 5
vim.opt.showtabline = 2
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.cmd('colorscheme koehler')
vim.cmd('filetype plugin on')
vim.cmd('set wildmenu')

function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Normal Section
map("n", "<leader>dotfiles", ":!make -C ~/dotfiles<CR>");
map("n", "<leader>r", ":source ~/.config/nvim/init.lua<CR>") --reload nvim init
map("n", "<leader>e", ":vnew .<CR>") --split window and open netrw
map("n", "<leader>E", ":new .<CR>") --split window horizontal and open netrw
map("n", "<leader>.", ":e .<CR>") --find a new location
map("n", "<leader>t", ":new . <CR>:term<CR><C-w>J:resize 15<CR>") --Create VSCode style terminal
map("n", "<leader>p", "\"+p"); --pasting from system clipboard
--map("n", "<leader><leader>", "@@") --repeat the search

--Visual Section
function surround(charL, charR)
	return ":<esc>`>a" .. charR .. "<esc>`<i" .. charL .. "<esc>"
end
map("v", "'", surround("'", "'"))
map("v", "\"", surround("\"", "\""))
map("v", "(", surround("(", ")"))
map("v", ")", surround("(", ")"))
map("v", "[", surround("[", "]"))
map("v", "]", surround("[", "]"))
map("v", "{", surround("{", "}"))
map("v", "}", surround("{", "}"))

map("v", "<leader>/", "y/<C-r>\"<CR>");
--map("v", "<leader>y", "\"+y");  --unfortunately cannot map this because map " alr

--Insert Section
--map("i", "jk", "<esc>")

--Terminal Section
map("t", "<ESC>", "<C-\\><C-n>");
map("t", "<esc>", "<C-\\><C-n>");