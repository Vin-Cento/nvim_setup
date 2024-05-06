require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	map("n", "gd", ":Telescope lsp_definitions<cr>", opts) --> jumps to the definition of the symbol under the cursor
	map("n", "gr", ":Telescope lsp_references<cr>", opts) --> lists all the references to the symbl under the cursor in the quickfix window
	map("n", "L", ":lua vim.lsp.buf.hover()<CR>", opts) --> information about the symbol under the cursos in a floating window
	map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts) --> lists all the implementations for the symbol under the cursor in the quickfix window
	map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts) --> rename old_fname to new_fname / using treesitter refactor
	map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) --> selects a code action available at the current cursor position
	map("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", opts)
	map("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
	map("n", "<leader>fm", ":lua vim.lsp.buf.format { async = true }<CR>", opts) --> formats the current buffer
end

-- You must make sure volar is setup
-- e.g. require'lspconfig'.volar.setup{}
-- See volar's section for more information

require("mason-lspconfig").setup_handlers({
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
	-- ["tsserver"] = function()
	-- 	require("lspconfig").tsserver.setup({
	-- 		init_options = {
	-- 			plugins = {
	-- 				{
	-- 					name = "@vue/typescript-plugin",
	-- 					location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
	-- 					languages = { "javascript", "typescript", "vue" },
	-- 				},
	-- 			},
	-- 		},
	-- 		filetypes = {
	-- 			"javascript",
	-- 			"typescript",
	-- 			"vue",
	-- 		},
	-- 	})
	-- end,
	["sqls"] = function()
		require("lspconfig").sqls.setup({
			on_attach = function(client, bufnr)
				require("sqls").on_attach(client, bufnr)
			end,
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
	-- ["volar"] = function()
	-- 	require("lspconfig").volar.setup({
	-- 		on_attach = on_attach,
	-- 		capabilities = capabilities,
	-- 		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
	-- 	})
	-- end,
	["lua_ls"] = function()
		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					workspace = {
						library = {
							"/usr/share/nvim/runtime/lua",
							"/usr/share/nvim/runtime/lua/vim",
							"/usr/share/nvim/runtime/lua/vim/lsp",
						},
					},
					diagnostics = {
						globals = { "vim", "use" },
					},
				},
			},
		})
	end,
	["pyright"] = function()
		require("lspconfig").pyright.setup({
			on_attach = on_attach,
			filetypes = { "python", "tac" },
		})
	end,
	["ltex"] = function()
		local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
		local words = {}

		for word in io.open(path, "r"):lines() do
			table.insert(words, word)
		end

		require("lspconfig").ltex.setup({
			on_attach = on_attach,
			settings = {
				ltex = {
					dictionary = { ["en-US"] = words },
					disabledRules = {
						-- ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
						["en-US"] = { ":" .. path },
					},
				},
			},
		})
	end,
	-- ["sqls"] = function()
	-- 	require("lspconfig").sqls.setup({
	--      cmd = {'sqls'},
	--      -- cmd = {"sql-language-server", "up", "--method", "stdio"},
	-- 		on_attach = function(client, bufnr)
	-- 			on_attach(client, bufnr)
	-- 			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	-- 			map("n", "gd", ":Telescope lsp_definitions<cr>", opts) --> jumps to the definition of the symbol under the cursor
	-- 			map("n", "gr", ":Telescope lsp_references<cr>", opts) --> lists all the references to the symbl under the cursor in the quickfix window
	-- 			map("n", "L", ":lua vim.lsp.buf.hover()<CR>", opts) --> information about the symbol under the cursos in a floating window
	-- 			map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts) --> lists all the implementations for the symbol under the cursor in the quickfix window
	-- 			map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts) --> rename old_fname to new_fname / using treesitter refactor
	-- 			map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) --> selects a code action available at the current cursor position
	-- 			map("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", opts)
	-- 			map("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
	-- 			map("n", "<leader>fm", ":%!sqlformat --keywords upper --identifiers lower -<CR>", opts)
	-- 		end,
	-- 		capabilities = capabilities,
	-- 	})
	-- end,
})
