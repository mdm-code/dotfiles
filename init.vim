"          _   _ ________  ___     _____ _____ _   _ ______ _____ _____ 
"         | | | |_   _|  \/  |    /  __ \  _  | \ | ||  ___|_   _|  __ \
"         | | | | | | | .  . |    | /  \/ | | |  \| || |_    | | | |  \/
"         | | | | | | | |\/| |    | |   | | | | . ` ||  _|   | | | | __ 
"         \ \_/ /_| |_| |  | |    | \__/\ \_/ / |\  || |    _| |_| |_\ \
"          \___/ \___/\_|  |_/     \____/\___/\_| \_/\_|    \___/ \____/



call plug#begin('~/.config/nvim/plugged')

" Swapping words, lines, longer parts of text
Plug 'tommcdo/vim-exchange'

" Code completion
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Go coding
Plug 'tweekmonster/gofmt.vim' " Format code on save
Plug 'mattn/vim-goimports' " Manage imports on save

" Asynchronous Python linting
Plug 'dense-analysis/ale'

" Coloured parenthesis
Plug 'kien/rainbow_parentheses.vim'

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

" Fuzzy finder in Vim
Plug 'ctrlpvim/ctrlp.vim' 

" Colors and color schemes
Plug 'ryanoasis/vim-devicons' " the beauty of devicons
Plug 'morhetz/gruvbox' " Mmm... classy.

call plug#end()

" Basic configuration
set nocompatible
filetype plugin indent on
syntax on
set hidden
set noswapfile
set path+=**  " all the children dirs of the cwd
set wildmode=longest:list,full
set splitbelow splitright
set nu rnu
set mouse=a
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set incsearch
set copyindent
set autoindent
set foldmethod=manual
set nohlsearch
set cursorline
set cursorcolumn
colorscheme gruvbox

" Set leader to comma
let mapleader = ";"

" Cursor line and column color
highlight CursorColumn ctermbg=238
highlight CursorLine cterm=bold ctermbg=238

" Highlight TABS (for Go)
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>

" Tab expansion for Python code files
autocmd Filetype python setlocal expandtab
autocmd Filetype python setlocal colorcolumn=80  " Add a column showing 80 line length

" Enters interactive mode
autocmd FileType python xnoremap <leader>p :w! \| :sp \| :term python -i % <CR>
autocmd FileType python xnoremap <leader>P :w! \| :sp \| :term poetry run python -i % <CR>

" Set path to python
" let g:python3_host_prog = '$HOME/.pyenv/shims/python3'
let g:python3_host_prog = '/usr/bin/python3'

" Latex
let g:tex_flavor='latex'
augroup filetypedetect
    au BufRead,BufNewFile *.Rnw set filetype=tex  " Latex identify .Rnw files as .tex
augroup END
au BufRead,BufNewFile *.tex,*.Rnw, setlocal textwidth=120  " Latex text folding on 120 characters

" Terminal mode configuration
tnoremap <Esc> <C-\><C-n>

" Brackets and quotation autocompletion
ino " ""<left>
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

" Write shortcuts
nnoremap <leader>u :update<CR>

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz
"

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Snippets
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-u>"
let g:UltiSnipsJumpBackwardTrigger="<c-d>"

" Ctags bar - toggle/untoggle the bar
nmap gt :TagbarToggle<CR>

" MELD tags shortcuts
autocmd FileType tex map <leader>b :vsp<Space>$BIB<CR>

" Go plugin settings
let g:goimports=1
let g:gofmt_on_save=1

" LSP config
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype go setlocal omnifunc=v:lua.vim.lsp.omnifunc
set completeopt=menuone,noinsert,noselect
let g:completion_mathching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'nvim_lsp'.pyls.setup{on_attach=require'completion'.on_attach}
lua require'nvim_lsp'.gopls.setup{on_attach=require'completion'.on_attach}
lua require'nvim_lsp'.texlab.setup{on_attach=require'completion'.on_attach}

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Trigger completion with <Tab>
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

" Avoid showing message extra message when using completion
set shortmess+=c

" Add snippets
let g:completion_enable_snippet = 'UltiSnips'

" LSP key bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

