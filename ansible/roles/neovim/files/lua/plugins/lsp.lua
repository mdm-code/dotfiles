--  _      ___________ 
-- | |    /  ___| ___ \
-- | |    \ `--.| |_/ /
-- | |     `--. \  __/ 
-- | |____/\__/ / |    
-- \_____/\____/\_|    
--


return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())

		-- NOTE: Add and configure servers.
		local server_configs = {
			gopls = {
				cmd = { "gopls" },
				-- ...
			},
			pyright = {
			},
		}

		for server, config in pairs(server_configs) do
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				['<C-x><C-o>'] = cmp.mapping.complete(),
				['<C-space>'] = cmp.mapping.confirm({ select = true }),
				['<C-c>'] = cmp.mapping.close(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
			}),
		})
	end,
}
