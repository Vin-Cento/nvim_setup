require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "node_modules", "venv", "tmp", "snippets", "yarn", ".git", "versions" },
    layout_config = {
      preview_width = 0.65,
    },
  },

  extensions = {
    media_files = {
      filetypes = { "png", "jpg", "mp4", "webm", "pdf" },
    },
    fzf = {
      -- find_cmd = "rg --hidden", -- find command (defaults to `fd`)
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      hidden_files = true,
    },
    project = {
      -- https://github.com/nvim-telescope/telescope-project.nvim
      hidden_files = true,
      theme = "dropdown",
      base_dirs = {
        -- { "~/dotfiles" },
        { "~/Code" },
        { "~/.config" },
      },
      sync_with_nvim_tree = false,
      order_by = "recent",
    },
  },
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>ff",
  ":Telescope find_files find_command=rg,--hidden,--files prompt_prefix=🔍<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fp", ":Telescope project<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
vim.api.nvim_set_keymap("n", "gR", ":Telescope lsp_references<cr>", opts)
vim.api.nvim_set_keymap("n", "gD", ":Telescope lsp_definitions<cr>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>fs", ":UltiSnipsEdit<CR>", opts)

require("telescope").load_extension("fzf")
require("telescope").load_extension("project")
require("telescope").load_extension("media_files")
