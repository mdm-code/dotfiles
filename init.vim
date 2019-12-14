call plug#begin('~/.config/nvim/plugged')

" Git integration
Plug 'tpope/vim-fugitive'

" Swapping words, lines, longer parts of text
" to swap two words on sep -> cxiw
Plug 'tommcdo/vim-exchange'

" Code completion
Plug 'davidhalter/jedi-vim'
Plug 'valloric/youcompleteme'

" Syntax checker
Plug 'w0rp/ale'

" Coloured parenthesis
Plug 'kien/rainbow_parentheses.vim'

" Vim, tmux and airline theme
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dracula/vim'

" Snippets (Engine)
" Snippet expansion c-e
Plug 'SirVer/ultisnips'
" The actual collection of snippets
Plug 'honza/vim-snippets'

" Align text on symbol, e.g., '='
" Select text, type ga and type in the delimiter
Plug 'junegunn/vim-easy-align'

" Vim sorround cs'" | ds" | ysiw"
Plug 'tpope/vim-surround'

" Pywal color schemes for vim
Plug 'dylanaraps/wal.vim'

" Go syntax and linting {{{
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" }}}

call plug#end()
" }}}

" Colors/Theme {{{
set background=dark
colorscheme wal
" }}}

" Basic configuration {{{
set nocompatible
filetype off
filetype indent on
filetype plugin on
set path+=**
set wildmenu
set splitbelow
set nu rnu
set incsearch
set title
set noswapfile
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set hlsearch
set incsearch
set copyindent
set autoindent
set foldmethod=manual
set guicursor=n-i-v-c:block-Cursor
set tags=tags

" Set leader to comma
let mapleader = ";"

" Python selected code {{{
" Enters interactive mode
autocmd FileType python xnoremap <leader>p :w! \| :sp \| :term python -i % <CR>
" }}}

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>N :call RenameFile()<cr>
" }}}

" Set path to python
let $VIRTUAL_ENV = $CONDA_PREFIX
let g:python3_host_prog = '/Users/michal/Documents/python/miniconda3/bin/python3'

" PEP-8 / PYTHON {{{
" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100
" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
" For full syntax highlighting:
let python_highlight_all=1
syntax on
" }}}

" Latex {{{
 let g:tex_flavor='latex'
" Latex identify .Rnw files as .tex
augroup filetypedetect
    au BufRead,BufNewFile *.Rnw set filetype=tex
augroup END
" Latex text folding on 120 characters
au BufRead,BufNewFile *.tex,*.Rnw,*.md setlocal textwidth=120
" }}}

" Terminal Mode Configuration {{{
nnoremap <Esc> <C-\><C-n>
" }}}

" Navigations between splits {{{
let g:BASH_Ctrl_j = 'off'
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
" }}}

" Brackets and quotation autocompletion {{{
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino { {}<left>
ino [ []<left>
" }}}

" Netwr configuration {{{
let g:netrw_liststyle = 3
let g:netrw_banner = 0
"  }}}

" EasyAlign {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" Snippets {{{
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" }}}

" colourful parantheses {{{
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
" }}}

" MELD tags shortcuts {{{
function! Input()
  call inputsave()
  let text = input('> ')
  let text = '<' . toupper(text) . '>'
  call inputrestore()
  return text
endfunction

autocmd FileType text inoremap <leader><Space><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType text inoremap <c-t> <Esc>viwgUdiwa<<Esc>pa></<Esc>pa><Space><++><Esc>F>cit
autocmd FileType text inoremap <c-g> <Esc>viwgUdiwa<<Esc>pa></<Esc>pa><Space><++><Esc>F>cit<c-r>=Input()<cr>
autocmd FileType text inoremap <c-f> <Esc>viwgUdiwa<<Esc>pa>

" Tilde ~ vim remap
autocmd FileType text inoremap <leader><tab> ~
" }}}

" Open bibliography file in a separate split {{{
autocmd FileType tex map <leader>b :vsp<Space>$BIB<CR>
" }}}

" Polish characters in LaTeX
autocmd FileType tex inoremap <c-a>a \k{a}
autocmd FileType tex inoremap <c-a>c \'{c}
autocmd FileType tex inoremap <c-a>e \k{e}
autocmd FileType tex inoremap <c-a>l \l{}
autocmd FileType tex inoremap <c-a>n \'{n}
autocmd FileType tex inoremap <c-a>o \'{o}
autocmd FileType tex inoremap <c-a>s \'{s}
autocmd FileType tex inoremap <c-a>z \.{z}
autocmd FileType tex inoremap <c-a>Z \'{z}

" R markdown compilation {{{
autocmd FileType rmd map <c-c> <Esc>:!echo<space> "require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
" }}}
