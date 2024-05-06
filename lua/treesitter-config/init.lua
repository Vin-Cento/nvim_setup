require("ts_context_commentstring").setup({})
vim.g.skip_ts_context_commentstring_module = true

require("nvim-treesitter.configs").setup({
	--> parsers <--
	ensure_installed = {
		"c",
		"css",
		"bash",
		"javascript",
		"lua",
		"typescript",
		"html",
		"python",
		"go",
		"vue",
	},
	sync_install = false,
	--> highlight <--
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
	--> indent <--
	indent = {
		enable = true,
	},
	--> textobjects selection <--
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		--> LSP interop <--
		lsp_interop = {
			enable = true,
			border = "none",
			peek_definition_code = {
				["<leader>df"] = "@function.outer",
				["<leader>dF"] = "@class.outer",
			},
		},
	},
	--> moving between textobjext <--
	move = {
		enable = true,
		set_jumps = true, -- whether to set jumps in the jumplist
		goto_next_start = {
			["]]"] = "@function.outer",
			["]m"] = "@class.outer",
		},
		goto_next_end = {
			["]["] = "@function.outer",
			["]M"] = "@class.outer",
		},
		goto_previous_start = {
			["[["] = "@function.outer",
			["[m"] = "@class.outer",
		},
		goto_previous_end = {
			["[]"] = "@function.outer",
			["[M"] = "@class.outer",
		},
	},
	--> treesitter playground <--
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	--> refactor module <--
	refactor = {
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "<leader>rn",
			},
		},
	},
	--> rainbow tags <--
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
