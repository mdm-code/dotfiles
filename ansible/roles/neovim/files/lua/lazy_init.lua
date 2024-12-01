--  _       ___   ________   __
-- | |     / _ \ |___  /\ \ / /
-- | |    / /_\ \   / /  \ V / 
-- | |    |  _  |  / /    \ /  
-- | |____| | | |./ /___  | |  
-- \_____/\_| |_/\_____/  \_/  
--


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	change_detection = { notify = false },
})
