"vimrc ~/.vimrc
"
" List remaps:
" <space>pv = Ex
" gd = go to def
" gy = type def
" gi = go to implementation
" gr = references
" K = show dow
" <leader>rn = rename
" <leader>ac = code action
" <leader>qf = fix code current
" <leader>re = refractor
" <leader>r = refractor
" <leader>cl = codelens

" Plugins with Plug
" For coc-vim, install: coc-clangd / coc-snippets
call plug#begin('~/.vim/plugged')
 Plug 'itchyny/lightline.vim'
 Plug 'frazrepo/vim-rainbow'
 Plug 'airblade/vim-gitgutter'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'morhetz/gruvbox'
 Plug 'github/copilot.vim'
call plug#end()

"Config for rainbow vim
let g:rainbow_active = 1

map vsm :vertical resize -5<CR>
map vsp :vertical resize +5<CR>
map <Space>pv :Ex<CR>
map <C-d> <C-d>zz
map <C-u> <C-u>zz
map <C-@> :Sex!<CR>

noremap <Leader>y "*y

xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv

hi Normal guibg=NONE ctermbg=NONE
colorscheme gruvbox

set nu rnu
set number relativenumber
set bg=dark
set scrolloff=8

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set cc=80
set backspace=indent,eol,start
set laststatus=2
