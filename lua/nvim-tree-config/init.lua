-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
local opts = { noremap = true, silent = true }

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 25,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
    git_ignored = false,
  },
})

vim.api.nvim_set_keymap('n', '<leader>T', ":NvimTreeToggle<cr>", opts)
