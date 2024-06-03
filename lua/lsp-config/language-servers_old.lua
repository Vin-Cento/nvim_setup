require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "gd", ":Telescope lsp_definitions<cr>", opts) --> jumps to the definition of the symbol under the cursor
	buf_set_keymap("n", "gr", ":Telescope lsp_references<cr>", opts) --> lists all the references to the symbl under the cursor in the quickfix window
	buf_set_keymap("n", "L", ":lua vim.lsp.buf.hover()<CR>", opts) --> information about the symbol under the cursos in a floating window
	buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts) --> lists all the implementations for the symbol under the cursor in the quickfix window
	-- buf_set_keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts) --> rename old_fname to new_fname / using treesitter refactor
	buf_set_keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) --> selects a code action available at the current cursor position
	buf_set_keymap("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
	buf_set_keymap("n", "<leader>fm", ":lua vim.lsp.buf.format { async = true }<CR>", opts) --> formats the current buffer
end

require("mason-lspconfig").setup_handlers({

	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,

	["yamlls"] = function()
		require("lspconfig").yamlls.setup({
			settings = {
				yaml = {
					schemas = {
						["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] = "**/docker-compose*.yml",
					},
				},
			},
		})
	end,

	["volar"] = function()
		require("lspconfig").volar.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
		})
	end,

	["sumneko_lua"] = function()
		require("lspconfig").sumneko_lua.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "use" },
					},
				},
			},
		})
	end,

  -- ["sqls"] = function()
  -- 	require("lspconfig").sqls.setup({
  -- 		on_attach = function(client, bufnr)
  -- 			require("sqls").on_attach(client, bufnr)
  -- 			on_attach(client, bufnr)
  --
  -- 			local opts = { noremap = true, silent = true }
  --
  -- 			local function buf_set_keymap(...)
  -- 				vim.api.nvim_buf_set_keymap(bufnr, ...)
  -- 			end
  --
  -- 			buf_set_keymap(
  -- 				"n",
  -- 				"<leader>fm",
  -- 				":!pg_format % 1> %<CR>",
  -- 				opts
  -- 			)
  -- 		end,
  -- 		capabilities = capabilities,
  -- 	})
  -- end,

})
