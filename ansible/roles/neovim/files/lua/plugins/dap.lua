-- ______  ___  ______ 
-- |  _  \/ _ \ | ___ \
-- | | | / /_\ \| |_/ /
-- | | | |  _  ||  __/ 
-- | |/ /| | | || |    
-- |___/ \_| |_/\_|    
--


return {
	{
		"mfussenegger/nvim-dap",
	},

	{
		"leoluz/nvim-dap-go",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("dap-go").setup({
				dap_configurations = {
					type = "go",
					name = "Attach mode",
					mode = "remote",
					request = "attach",
				},
			})
		end,
	},
}
