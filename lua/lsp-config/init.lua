local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap("n", "gd", ":Telescope lsp_definitions<cr>", opts)
  vim.api.nvim_set_keymap("n", "gr", ":Telescope lsp_references<cr>", opts)
  vim.api.nvim_set_keymap("n", "L", ":lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>fm", ":lua vim.lsp.buf.format { async = true }<CR>", opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("neoconf").setup({})
require('mason').setup()
require('mason-lspconfig').setup()
require('mason-lspconfig').setup_handlers({
  function(server)
    require("lspconfig")[server].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
})
