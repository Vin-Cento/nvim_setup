require 'FTerm'.setup({
  border     = 'double',
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})

-- Example keybindings
vim.keymap.set('n', '<A-i>', '<cmd>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

vim.keymap.set('n', 'gl', '<cmd>lua require("FTerm").scratch({cmd = "lazygit"})<cr>')
