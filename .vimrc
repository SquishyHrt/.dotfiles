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

highlight ExtraWhitespace ctermbg=grey guibg=grey
2match ExtraWhitespace /\s\+$/

function FormatBuffer()
    if &filetype == 'c' || &filetype == 'cpp'
     let cursor_pos = getpos('.')
     :%!clang-format -style=file:"/home/squishy/Documents/.clang-format"
     call setpos('.', cursor_pos)
    else
        echo "Not c file"
   endif
 endfunction
map <silent> <C-k> :call FormatBuffer()<CR>

set nobackup
set nowritebackup
set updatetime=200
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>as  <Plug>(coc-codeaction-source)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <leader>cl  <Plug>(coc-codelens-action)

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
