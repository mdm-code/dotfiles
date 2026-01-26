--  ___________ _____ _____ _____ _____ _____ _____ ___________ 
-- |_   _| ___ \  ___|  ___/  ___|_   _|_   _|_   _|  ___| ___ \
--   | | | |_/ / |__ | |__ \ `--.  | |   | |   | | | |__ | |_/ /
--   | | |    /|  __||  __| `--. \ | |   | |   | | |  __||    / 
--   | | | |\ \| |___| |___/\__/ /_| |_  | |   | | | |___| |\ \ 
--   \_/ \_| \_\____/\____/\____/ \___/  \_/   \_/ \____/\_| \_|
--


return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	opts = {
		indent = { enable = true },
		folds = { enable = true },
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "go", "python" },
		},
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"lua",
			"python",
			"javascript",
			"typescript",
			"go",
			"html",
			"xml",
			"markdown",
			"json",
			"toml",
			"yaml",
			"vim",
			"vimdoc",
			"query",
			"regex",
			"tsx",
		},
	},
}
