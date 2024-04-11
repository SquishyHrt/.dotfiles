"vimrc ~/.vimrc

" all plugin
call plug#begin('~/.vim/plugged')
 Plug 'jacoborus/tender.vim'
 Plug 'itchyny/lightline.vim'
 Plug 'vim-scripts/c.vim'
 Plug 'frazrepo/vim-rainbow'
 Plug 'airblade/vim-gitgutter'
 Plug 'dense-analysis/ale'
 Plug 'morhetz/gruvbox'
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

map vsm :vertical resize -5<CR>
map vsp :vertical resize +5<CR>
map <Space>pv :Ex<CR>
map <C-d> <C-d>zz
map <C-u> <C-u>zz
map <C-@> :Sex!<CR>

xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv


let g:ale_completion_enabled = 1
hi Normal guibg=NONE ctermbg=NONE
colorscheme gruvbox

"Display line number
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

highlight ExtraWhitespace ctermbg=red guibg=red
2match ExtraWhitespace /\s\+$/

function FormatBuffer()
    if &filetype == 'c' || &filetype == 'cpp'
     let cursor_pos = getpos('.')
     :%!clang-format -style=file:"/home/paolo.wattebled/afs/.clang-format"
     call setpos('.', cursor_pos)
    else
        echo "Not c file"
   endif
 endfunction

 silent! unmap <C-k>
 map <silent> <C-k> :call FormatBuffer()<CR>
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## eb5d1e6aaedcc2f876da50c205e3c498 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/paolowattebled/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
