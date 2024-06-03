local set = vim.opt

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.termguicolors = true
set.showmode = false
set.splitbelow = true
set.splitright = true
set.wrap = false
set.breakindent = true
set.scrolloff = 5
--et.fileencoding = "utf-8"
set.conceallevel = 2

set.relativenumber = true
set.cursorline = true
set.wildmenu = true
set.completeopt = "menuone,noselect"

set.hidden = true
set.mouse = "a"
set.clipboard = "unnamedplus"

set.fillchars = "eob: "

set.nu = true

set.foldmethod = "indent"
set.wrap = true

set.foldnestmax = 10
set.foldlevel = 7
set.foldexpr = "nvim_treesitter#foldexpr()"

set.spell.spelllang="en_us"

-- vimtex config
vim.g.vimtex_view_method = "zathura"
vim.g.UltiSnipsJumpForwardTrigger="<c-j>"
vim.g.UltiSnipsJumpBackwardTrigger="<c-k>"
