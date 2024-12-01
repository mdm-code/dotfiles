--  ___________ _____ _____ _____ _____ _____ _____ ___________ 
-- |_   _| ___ \  ___|  ___/  ___|_   _|_   _|_   _|  ___| ___ \
--   | | | |_/ / |__ | |__ \ `--.  | |   | |   | | | |__ | |_/ /
--   | | |    /|  __||  __| `--. \ | |   | |   | | |  __||    / 
--   | | | |\ \| |___| |___/\__/ /_| |_  | |   | | | |___| |\ \ 
--   \_/ \_| \_\____/\____/\____/ \___/  \_/   \_/ \____/\_| \_|
--


return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
		})
	end,
}
