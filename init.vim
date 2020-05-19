call plug#begin('~/.config/nvim/plugged')

" Swapping words, lines, longer parts of text
Plug 'tommcdo/vim-exchange' " The actual collection of snippets

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'davidhalter/jedi-vim'  " Necessary for Python to work right
Plug 'w0rp/ale'  " Proper Python syntax checker

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

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

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

" ------COC SETTINGS------

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-go',
  \ 'coc-python',
  \ 'coc-texlab'
  \ ]

" From Coc Readme
set updatetime=300

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use D to show documentation in preview window
nnoremap <silent> D :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>r <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
