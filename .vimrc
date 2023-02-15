"vimrc ~/.vimrc

" all plugin
call plug#begin('~/.vim/plugged')
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'patstockwell/vim-monokai-tasty'
 Plug 'jacoborus/tender.vim'
 Plug 'itchyny/lightline.vim'
 Plug 'vim-scripts/c.vim'
 Plug 'frazrepo/vim-rainbow'
 Plug 'airblade/vim-gitgutter'
 Plug 'scrooloose/syntastic'
 Plug 'github/copilot.vim'
call plug#end()

" Put the noice line
set laststatus=2


let g:coc_disable_startup_warning = 1

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




"diffrent function to execute on diffrent file type

"Remaps for c files
function! RUSTSET()
    map <F9> :!clear <CR> <bar> :w <CR> <bar> :!make all <CR>
    map <F10> :!clear <CR> <bar> :!cargo run <CR>
    inoremap {{ {<CR>}<ESC>O
    inoremap ppp println!("{}", );<ESC><c-h><c-h> i
endfunction

"Remaps for python files
function! PYTHONSET()
    map <F9> :!clear <CR> <bar> :w <CR> <bar> :!python3 % <CR>
endfunction

"Remaps for c files
function CSET()
    map <F10> :w <CR> <bar> :!clear <CR> <bar> :!make all
    map <F11> :w <CR> <bar> :!clear <CR> <bar> :!make <CR> <bar> :!./main <CR>
endfunction


autocmd FileType python call PYTHONSET()
autocmd FileType rust   call RUSTSET()
autocmd FileType c      call CSET()

"quit and write nicely
map qq :q<CR>
map <C-n> :Sex!<CR>
map ff :CocCommand clangd.switchSourceHeader<CR>
map vsp :vertical resize +5<CR>
map vsm :vertical resize -5<CR>
map <C-d> <C-d>zz
map <C-u> <C-u>zz
inoremap jj <ESC>



"remap in insertmode
"config for autocomplete


colorscheme vim-monokai-tasty
syntax on
filetype indent plugin on
"Display line number
set nu rnu
set number relativenumber

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set cc=80
set scrolloff=5
set backspace=indent,eol,start

