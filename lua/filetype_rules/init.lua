vim.cmd([[autocmd FileType python nnoremap <buffer> <leader><leader> :w<CR>:TermExec cmd="python %"<CR>]])
vim.cmd([[autocmd FileType sh nnoremap <buffer> <leader><leader> :w<CR>:TermExec cmd="bash %"<CR>]])
vim.cmd([[autocmd FileType tex nnoremap <buffer> <leader><leader> :w<CR>:TermExec cmd="pdflatex %"<CR>]])
vim.cmd([[autocmd FileType javascript nnoremap <buffer> <leader><leader> :w<CR>:TermExec cmd="node %"<CR>]])
vim.cmd([[autocmd FileType typescript nnoremap <buffer> <leader><leader> :w<CR>:TermExec cmd="ts-node-esm %"<CR>]])
vim.cmd([[autocmd FileType cpp nnoremap <buffer> <leader><leader> :w<CR>:TermExec cmd="g++ % && ./a.out"<CR>]])
vim.cmd([[autocmd FileType c nnoremap <buffer> <leader><leader> :w<CR>:TermExec cmd="tcc -run %"<CR>]])
vim.cmd([[autocmd FileType go nnoremap <buffer> <leader><leader> :w<CR>:TermExec cmd="go build % && ./main"<CR>]])
vim.cmd([[autocmd FileType sql nnoremap <buffer> <leader><leader> :w<CR>:SqlsExecuteQuery<CR>]])
vim.cmd([[autocmd FileType yaml.ansible nnoremap <buffer> <leader><leader> :w<CR>:lua require('ansible').run()<CR>]])
vim.cmd([[autocmd FileType lua nnoremap <buffer> <leader><leader> :w<CR>:!lua %<CR>]])
vim.cmd(
	[[autocmd FileType java nnoremap <buffer> <leader><leader> :w<CR>:TermExec cmd="javac -cp src % && java -cp src %"<CR>]]
)
