"          _   _ ________  ___     _____ _____ _   _ ______ _____ _____ 
"         | | | |_   _|  \/  |    /  __ \  _  | \ | ||  ___|_   _|  __ \
"         | | | | | | | .  . |    | /  \/ | | |  \| || |_    | | | |  \/
"         | | | | | | | |\/| |    | |   | | | | . ` ||  _|   | | | | __ 
"         \ \_/ /_| |_| |  | |    | \__/\ \_/ / |\  || |    _| |_| |_\ \
"          \___/ \___/\_|  |_/     \____/\___/\_| \_/\_|    \___/ \____/



call plug#begin('~/.config/nvim/plugged')
" Github Copilot
+Plug 'github/copilot.vim'

" Swapping words, lines, longer parts of text
Plug 'tommcdo/vim-exchange'

" Go coding
Plug 'tweekmonster/gofmt.vim' " Format code on save
Plug 'mattn/vim-goimports' " Manage imports on save
Plug 'sebdah/vim-delve' " Deleve Go debugger

" Snippets (Engine)
Plug 'SirVer/ultisnips' " The actual collection of snippets
Plug 'honza/vim-snippets'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Code completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

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

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Colors and color schemes
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
call plug#end()

" Basic configuration
set nocompatible
filetype plugin indent on
syntax on
set hidden
set noswapfile
set lazyredraw
set path+=**  " all the children dirs of the cwd
set wildmode=longest:list,full
set splitbelow splitright
set nu rnu
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set signcolumn=yes
set scrolloff=8
set nowrap
set incsearch
set copyindent
set autoindent
set foldmethod=manual
set nohlsearch
set cursorline
set cursorcolumn
set backupcopy=yes
set clipboard=unnamed
set updatetime=50
set smartindent
set completeopt=menuone,noinsert,noselect
colorscheme gruvbox

" Set leader to comma
let mapleader = ";"

" Cursor line and column color
" DISABLE Background in Vim :: highlight! Normal ctermbg=NONE
highlight CursorColumn ctermbg=238
highlight CursorLine cterm=bold ctermbg=238

" Highlight TABS (for Go)
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>

" Go make & format commands.
autocmd BufNewFile,BufRead *.go set makeprg=go\ run\ %

" Tab expansion for Python code files
autocmd Filetype python setlocal expandtab
autocmd FileType lua,javascript,typescript,css,html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype python,go setlocal colorcolumn=80  " Add a column showing 80 line length

" Enters interactive mode
autocmd FileType python xnoremap <leader>p :w! \| :sp \| :term python3 -i % <CR>

" Set path to python
let g:python3_host_prog = "~/.pyenv/versions/neovim/bin/python3"

" Newtrw :Explore key binding
nnoremap <leader>e :Explore<CR>

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

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Ctags bar - toggle/untoggle the bar
nmap gt :TagbarToggle<CR>

" Go plugin settings
let g:goimports=1
let g:gofmt_on_save=1

" LUA configuration
:lua << EOF
-- LSP config
-- There is one issue with 'handlers' parameter in the completion module
-- Make sure to rename handlers to callbacks in case you get the error with
-- autocompletion on.
  local lspconfig = require('lspconfig')
  local cmp = require('cmp')

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'cmdline' },
    })
  })
  cmp.setup({
      snippet = {
      expand = function(args)
        vim.fn['UltiSnips#Anon'](args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-x><C-o>'] = cmp.mapping.complete(),
      ['<C-space>'] = cmp.mapping.confirm(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-c>'] = cmp.mapping.close(),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' },
      { name = 'buffer' },
    }),
    completion = cmp.mapping.preset.insert({
      autocomplete = {
        cmp.TriggerEvent.TextChanged,
        cmp.TriggerEvent.InsertEnter,
      },
        completeopt = "menuone,noinsert,noselect",
    }),
  })

  local on_attach = function(clnt, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap=true, silent=true }
    vim.keymap.set("n", "<leader>d", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>n", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>p", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>gd", function() vim.diagnostic.open_float() end, opts)
  end
  local servers = {"pyright", "gopls", "tsserver"}
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
end

-- This is gsnip-based completion running on efm-langserver
lspconfig['efm'].setup({
  on_attach = on_attach,
  init_options = { completion = true },
  settings = {
    languages = {
      ["="] = {
        {
          completionCommand = "gsnip list | grep -v '^$' |  cut -f1 -d$\'\t\' | sort -u",
          completionStdin = true
        },
      },
    },
  },
})

-- Treesitter and Treesitter-context configuration
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

function ContextSetup(show_all_context)
  require("treesitter-context").setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    show_all_context = show_all_context,
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
      -- For all filetypes
      -- Note that setting an entry here replaces all other patterns for this entry.
      -- By setting the 'default' entry below, you can control which nodes you want to
      -- appear in the context window.
      default = {
        "function",
        "method",
        "for",
        "while",
        "if",
        "switch",
        "case",
        "class_declaration",
      },
    },
  })
end

ContextSetup(true)
EOF

" Gsnip lsp completion expand trigger
" Press @w to change the placeholder under the cursor
" Press n/N to move forward and backward between placeholders
inoremap <c-x>g <esc>!!gsnip find<CR>:let @w='cf}'<CR>/\${[0-9]\+:\w*}<CR>


" Telescope commands
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

 " Avoid showing message extra message when using completion
 set shortmess+=c
