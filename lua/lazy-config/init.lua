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
  "nvim-lua/plenary.nvim", --> library

  "folke/neoconf.nvim",
  "folke/neodev.nvim",
  "hrsh7th/nvim-cmp", --> autocomplete dropdown

  --> completion
  "f3fora/cmp-spell",                                       --> spell
  "hrsh7th/cmp-path",                                       --> filepath
  "hrsh7th/cmp-buffer",                                     --> buffer words
  "hrsh7th/cmp-cmdline",                                    --> commandline
  "hrsh7th/cmp-nvim-lsp",                                   --> lsp completion

  "neovim/nvim-lspconfig",                                  --> configurate lsp client
  "williamboman/mason.nvim",                                --> diagnistocs, formattings, code actions package manager
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }, --> treesitter
  "williamboman/mason-lspconfig.nvim",                      --> bridge mason and lsp
  { "ThePrimeagen/harpoon",            branch = "harpoon2" },
  "ethanholz/nvim-lastplace",                               --> checkpoint
  "onsails/lspkind-nvim",
  { "bluz71/vim-moonfly-colors",                name = "moonfly",                                                                                                                      lazy = false, priority = 1000 },
  "nvim-telescope/telescope.nvim",               --> telescope fzf viewing
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
  "nvim-telescope/telescope-project.nvim",       --> pull up projects
  "p00f/nvim-ts-rainbow",                        --> better pairing color
  "nvim-treesitter/playground",                  --> toggle treesitter
  "nvim-treesitter/nvim-treesitter-refactor",    --> refactor variables
  "nvim-telescope/telescope-media-files.nvim",   --> show media
  "JoosepAlviste/nvim-ts-context-commentstring", --> better comment
  "nvim-treesitter/nvim-treesitter-textobjects", --> better textobjects
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
  "kylechui/nvim-surround",
  "windwp/nvim-autopairs",
  "VonHeikemen/fine-cmdline.nvim",
  "folke/tokyonight.nvim",
  "nvim-lualine/lualine.nvim",
  "lewis6991/gitsigns.nvim",
  "nvim-tree/nvim-tree.lua",
  "github/copilot.vim",
  "numToStr/FTerm.nvim",
  "numToStr/Comment.nvim",
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  { "lukas-reineke/indent-blankline.nvim",      main = "ibl" }
})
