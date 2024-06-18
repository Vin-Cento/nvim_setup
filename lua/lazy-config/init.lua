local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- set this before lazy

require("lazy").setup({
  --> dependencies
  "nvim-lua/plenary.nvim",                                  --> library
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }, --> treesitter
  "nvim-telescope/telescope.nvim",                          --> telescope fzf viewing

  "folke/neoconf.nvim",                                     --> language tool config

  --> nvim development
  { "Bilal2453/luvit-meta",            lazy = true },
  { "folke/lazydev.nvim",              ft = "lua" },

  --> completion interface
  "hrsh7th/nvim-cmp",     --> autocomplete dropdown
  --> completion engines
  "f3for /cmp-spell",     --> spell
  "hrsh7th/cmp-path",     --> filepath
  "hrsh7th/cmp-buffer",   --> buffer words
  "hrsh7th/cmp-cmdline",  --> commandline
  "hrsh7th/cmp-nvim-lsp", --> lsp completion

  --> lsp
  "neovim/nvim-lspconfig",             --> lsp client
  "williamboman/mason.nvim",           --> install for lsp tool
  "williamboman/mason-lspconfig.nvim", --> bridge mason and lsp

  --> ui
  "VonHeikemen/fine-cmdline.nvim", --> better cmdline
  "nvim-lualine/lualine.nvim",     --> status bar
  "nvim-tree/nvim-tree.lua",       --> file tree
  "numToStr/FTerm.nvim",           --> terminal
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  "folke/todo-comments.nvim",
  "karb94/neoscroll.nvim",

  --> git
  "lewis6991/gitsigns.nvim", --> git integration

  --> look
  { "bluz71/vim-moonfly-colors",           name = "moonfly", lazy = false, priority = 1000 }, --> theme
  { "lukas-reineke/indent-blankline.nvim", main = "ibl" },                                    --> show indent
  "onsails/lspkind-nvim",                                                                     --> cmp icon

  --> better movement and positioning
  { "ThePrimeagen/harpoon",                     branch = "harpoon2" }, --> fast file jumping
  "ethanholz/nvim-lastplace",                                          --> checkpoint
  "numToStr/Comment.nvim",                                             --> better comment
  "kylechui/nvim-surround",                                            --> upgrade surround movement
  "windwp/nvim-autopairs",                                             --> automatic pair

  --> telescope
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
  "nvim-telescope/telescope-project.nvim",       --> pull up projects
  "nvim-treesitter/playground",                  --> toggle treesitter
  "nvim-treesitter/nvim-treesitter-refactor",    --> refactor variables
  "nvim-telescope/telescope-media-files.nvim",   --> show media
  "nvim-treesitter/nvim-treesitter-textobjects", --> better textobjects

  "p00f/nvim-ts-rainbow",                        --> better pairing color

  --> LLM
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  "github/copilot.vim",
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  }

})
