"vimrc ~/.vimrc

" all plugin
call plug#begin('~/.vim/plugged')
 Plug 'itchyny/lightline.vim'
 Plug 'frazrepo/vim-rainbow'
 Plug 'airblade/vim-gitgutter'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'morhetz/gruvbox'
call plug#end()

" Put the noice line
set laststatus=2

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

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=200

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
