" target: ~/.vimrc
"
" General
" set backup
set modeline
set ruler
" colorscheme darkblue
" colorscheme torte
" colorscheme zellner
set background=light
filetype indent plugin on
" http://www.8t8.us/vim/vim.html
set hlsearch
:map <silent> <C-N> :se invhlsearch<CR>
" Coding
syntax on
highlight BadWhitespace ctermbg=red guibg=red
" Python 
" http://wiki.python.org/moin/Vim
" http://svn.python.org/projects/python/trunk/Misc/Vim/vimrc
let python_highlight_all=1
autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4 colorcolumn=100
" SQL
autocmd FileType sql setlocal syntax:plsql tabstop=8 expandtab shiftwidth=3 softtabstop=3
" Shell
autocmd FileType sh setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
" R
autocmd BufNewFile,BufRead *.r,*.R set filetype=R
" C
autocmd FileType c setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
" Java
autocmd FileType java setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4 colorcolumn=100
" XML
autocmd FileType xml setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4 colorcolumn=100
" HTML
autocmd FileType html setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4 colorcolumn=100
" Markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
" Javascript
autocmd FileType javascript setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4 colorcolumn=100
