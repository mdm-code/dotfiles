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
		local lspconfig = require("lspconfig")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())

		lspconfig.gopls.setup {
			capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "templ" },
			root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
					gofumpt = true,
					completeUnimported = true,
					usePlaceholders = false,
				},
			},
		} 

		lspconfig.htmx.setup({
			capabilities = capabilities,
			filetypes = { "html", "templ" },
		})

		local defaultServers = { "pyright", "templ" }
		for _, lsp in ipairs(defaultServers) do
			lspconfig[lsp].setup {
				capabilities = capabilities,
			}
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
