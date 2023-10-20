"vimrc ~/.vimrc

" all plugin
call plug#begin('~/.vim/plugged')
 Plug 'patstockwell/vim-monokai-tasty'
 Plug 'jacoborus/tender.vim'
 Plug 'itchyny/lightline.vim'
 Plug 'frazrepo/vim-rainbow'
 Plug 'airblade/vim-gitgutter'
 Plug 'dense-analysis/ale'
call plug#end()

" Put the noice line
set laststatus=2


"Config for rainbow vim
let g:rainbow_active = 1
let g:rainbow_load_separately = [
            \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
            \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
            \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
            \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
            \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']



map <C-n> :Sex!<CR>
map <Space>pv :Ex<CR>
map vsp :vertical resize +5<CR>
map vsm :vertical resize -5<CR>
map <C-d> <C-d>zz
map <C-u> <C-u>zz




colorscheme vim-monokai-tasty
syntax on
filetype indent plugin on
set nu rnu
set number relativenumber

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set cc=80
set scrolloff=5
set backspace=indent,eol,start

