require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules", "venv", "tmp", "snippets", "yarn", ".git", "versions" },
		layout_config = {
			preview_width = 0.65,
		},
	},

	extensions = {
		media_files = {
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "jpg", "jpeg" },
		},
		fzf = {
			-- find_cmd = "rg --hidden", -- find command (defaults to `fd`)
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			hidden_files = true,
		},
		project = {
			-- https://github.com/nvim-telescope/telescope-project.nvim
			hidden_files = true,
			theme = "dropdown",
			base_dirs = {
				{ "~/dotfiles" },
				{ "~/Code" },
			},
			sync_with_nvim_tree = false,
			order_by = "recent",
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("project")
require("telescope").load_extension("media_files")
