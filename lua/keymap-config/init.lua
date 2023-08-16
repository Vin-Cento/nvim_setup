local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- local opts2 = { noremap = true, expr = true }
vim.g.mapleader = " " -- leader key
vim.g.maplocalleader = "," -- leader key

--> key swap <--
-- map("n", ";", ":", opts)
map("n", "J", "}", opts)
map("n", "K", "{", opts)
map("v", "J", "}", opts)
map("v", "K", "{", opts)

-- map('n', '<CR>', '<cmd>FineCmdline<CR>', {noremap = true})

map("n", "<leader>T", ":NvimTreeToggle<cr>", opts) --> toggle nvim tree
-- map("n", "<leader>S", ":set spell!<cr>", opts) --> toggle spell

--> Git Movement <--
map("n", "<leader>gg", ":GitGutterBufferToggle<cr>", opts) --> toggle git gutter
map("n", "<leader>gj", "<Plug>(GitGutterNextHunk)", opts) --> toggle git gutter
map("n", "<leader>gk", "<Plug>(GitGutterPrevHunk)", opts) --> toggle git gutter
map("n", "<leader>ga", ":Git add %<cr>", opts) --> toggle git gutter
map("n", "<leader>gs", ":Git add . | Git status<cr>", opts) --> toggle git gutter
map("n", "<leader>gc", ":Git commit<cr>", opts) --> toggle git gutter

map("n", "<leader>s", ":w<cr>", opts) --> write to file
-- map("n", "<leader>R", ":runtime! %<cr>", opts) --> reload new file
map("n", "<leader>x", ":source %<cr>", opts) --> reload new file
-- map("n", "s", "<Plug>Sneak_s", opts) --> reload new file
-- map("n", "S", "<Plug>Sneak_S", opts) --> reload new file

--> telescope mappings <--
map("n", "<leader>ff", ":Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>", opts)
map("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
map("n", "<leader>fb", ":Telescope buffers<cr>", opts)
map("n", "<leader>fp", ":Telescope project<cr>", opts)
map("n", "gR", ":Telescope lsp_references<cr>", opts)
map("n", "gD", ":Telescope lsp_definitions<cr>", opts)
map("n", "<leader>fs", ":UltiSnipsEdit<CR>", opts)

--> barbar mappings <--
map("n", "<leader>n", ":BufferPrevious<cr>", opts)
map("n", "<leader>p", ":BufferNext<cr>", opts)
map("n", "<leader>mn", ":BufferMovePrevious<cr>", opts)
map("n", "<leader>mp", ":BufferMoveNext<cr>", opts)
map("n", "<leader>bd", ":BufferClose<cr>", opts)
map("n", "<leader>bon", ":BufferOrderByBufferNumber<cr>", opts)
map("n", "<leader>bod", ":BufferOrderByDirectory<cr>", opts)
map("n", "<leader>bol", ":BufferOrderByLanguage<cr>", opts)

--> debugger <--
map("n", "<leader>dr", ":lua require'dap'.continue()<CR>", opts)
map("n", "<leader>dd", ":lua require'dap'.step_over()<CR>", opts)
map("n", "<leader>dC", ":lua require'dap'.reverse_continue()<CR>", opts)
map("n", "<leader>di", ":lua require'dap'.step_into()<CR>", opts)
map("n", "<leader>do", ":lua require'dap'.step_out()<CR>", opts)
map("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<Leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
map("n", "<Leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
map("n", "<Leader>dR", ":lua require'dap'.repl.toggle()<CR>", opts)
map("n", "<Leader>dl ", ":lua require'dap'.run_last()<CR>", opts)

map("n", "s", ":HopChar2<cr>", opts)
map("n", "S", ":HopChar2BC<cr>", opts)

map("n", "<leader>zz", ":TZAtaraxis<CR>", {})
map("v", "<leader>zz", ":'<,'>TZNarrow<CR>", {})

--> new feature
map("n", "<Leader>tk", "<cmd>:ChatGPT<cr>", opts)
map("n", "<Leader>tj", "<cmd>:ChatGPTActAs<cr>", opts)
map("n", "<Leader>tt", "<cmd>:ChatGPTEditWithInstructions<cr>", opts)
map("n", "<Leader><Leader>", "<cmd>:w<cr>:lua require('autorun').run()<cr>", opts)

map("n", "<Leader>S", "<cmd>:SymbolsOutline<cr>", opts)
