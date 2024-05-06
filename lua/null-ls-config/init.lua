local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions


local sources = {
	formatting.prettierd,
	formatting.black.with({ extra_args = { "--fast" }, filetypes = { "python" } }),
	-- require("none-ls.diagnostics.eslint"),
	formatting.stylua,
	formatting.clang_format,
	formatting.shellharden,
	require("none-ls-shellcheck.diagnostics"),
	require("none-ls-shellcheck.code_actions"),
	formatting.terraform_fmt,
}

null_ls.setup({
	sources = sources,
})
