require("toggleterm").setup({
	open_mapping = [[<c-\>]],
	size = 100,
	shade_terminals = true,
	direction = "vertical",
	close_on_exit = true,
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	float_opts = {
		border = "double",
	},
	hidden = true,
})

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
