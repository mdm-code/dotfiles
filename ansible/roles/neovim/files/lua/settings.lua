--  _____ _____ _____ _____ _____ _   _ _____  _____ 
-- /  ___|  ___|_   _|_   _|_   _| \ | |  __ \/  ___|
-- \ `--.| |__   | |   | |   | | |  \| | |  \/\ `--. 
--  `--. \  __|  | |   | |   | | | . ` | | __  `--. \
-- /\__/ / |___  | |   | |  _| |_| |\  | |_\ \/\__/ /
-- \____/\____/  \_/   \_/  \___/\_| \_/\____/\____/ 
--


require("settings.python")


----------- GENERAL -------------
vim.opt.swapfile = true
vim.opt.backup = false
vim.opt.lazyredraw = true
vim.opt.updatetime = 50

--------- LINE NUMBERS ----------
vim.opt.number = true
vim.opt.relativenumber = true

----------- DISPLAY -------------
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.shortmess:append("c")
vim.opt.listchars = { nbsp = "¬", tab = "»·", trail = "·", extends = ">" }
vim.opt.list = true

------------- TABS --------------
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

--------- INDENTATION -----------
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.copyindent = true

----------- SEARCH --------------
vim.opt.path:append("**")
vim.opt.wildmode = { "longest:list", "full" }
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

----------- SPLITS --------------
vim.opt.splitbelow = true
vim.opt.splitright = true

---------- CLIPBOARD ------------
vim.opt.clipboard:append("unnamedplus")

---------- COMPLETION -----------
vim.opt.completeopt = { "menuone", "noinsert", "noselect", "popup" }
