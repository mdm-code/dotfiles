call plug#begin('~/.config/nvim/plugged')

" Swapping words, lines, longer parts of text
Plug 'tommcdo/vim-exchange' " The actual collection of snippets

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Coloured parenthesis
Plug 'kien/rainbow_parentheses.vim'

" Vim, tmux and airline theme
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'

" Snippets (Engine)
Plug 'SirVer/ultisnips' " The actual collection of snippets
Plug 'honza/vim-snippets' " The actual collection of snippets

" Align text on symbol, e.g., '='
Plug 'junegunn/vim-easy-align' " Select text, type ga and then the delimiter

" Vim sorround cs'" | ds" | ysiw"
Plug 'tpope/vim-surround'

" Comment out line with gcc / selection or motion with gc
Plug 'tpope/vim-commentary'

" Tagbar - menu bar with ctags
Plug 'majutsushi/tagbar'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Quick line navigation for f/F
Plug 'unblevable/quick-scope'

" Colors and color schemes
Plug 'rrethy/vim-hexokinase', {'do': 'make hexokinase'} " Display colours in the file
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" Basic configuration
filetype plugin indent on
syntax on
set path+=**
set wildmode=longest:list,full
set splitbelow splitright
set nu rnu
set mouse=a
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set incsearch
set copyindent
set autoindent
set foldmethod=manual
set nohlsearch
set cursorline
set cursorcolumn
set termguicolors
colorscheme dracula

" Set leader to comma
let mapleader = ";"

" Cursor line and column color
highlight CursorColumn ctermbg=238
highlight CursorLine cterm=bold ctermbg=238

" Enters interactive mode
autocmd FileType python xnoremap <leader>p :w! \| :sp \| :term python -i % <CR>

" Code competion uses Python binaries from Conda environment
let $VIRTUAL_ENV = $CONDA_PREFIX

" Set path to python
let g:python3_host_prog = '/Users/michal/Documents/python/miniconda3/bin/python3'

" Latex
let g:tex_flavor='latex'
augroup filetypedetect
    au BufRead,BufNewFile *.Rnw set filetype=tex  " Latex identify .Rnw files as .tex
augroup END
au BufRead,BufNewFile *.tex,*.Rnw, setlocal textwidth=120  " Latex text folding on 120 characters

" Terminal mode configuration
tnoremap <Esc> <C-\><C-n>

" Navigations between splits
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Brackets and quotation autocompletion
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino { {}<left>
ino [ []<left>

" Resizing splits
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Moving visual selection vertically
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"
" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Netwr configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" colourful parantheses
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" Ctags bar - toggle/untoggle the bar
nmap gt :TagbarToggle<CR>

" Hexokinase configuration
let g:Hexokinase_refreshEvents = ['InsertLeave']
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]
let g:Hexokinase_highlighters = ['backgroundfull']
autocmd VimEnter * HexokinaseTurnOn " Reenable hexokinase on enter

" MELD tags shortcuts
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
autocmd FileType text inoremap <leader><tab> ~
autocmd FileType tex map <leader>b :vsp<Space>$BIB<CR>

source $HOME/.dotfiles/coc-config.vim " Source config file for CoC code completion
