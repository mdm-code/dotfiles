--  _____ _____ _      _____ _____ _____ ___________ _____ 
-- |_   _|  ___| |    |  ___/  ___/  __ \  _  | ___ \  ___|
--   | | | |__ | |    | |__ \ `--.| /  \/ | | | |_/ / |__  
--   | | |  __|| |    |  __| `--. \ |   | | | |  __/|  __| 
--   | | | |___| |____| |___/\__/ / \__/\ \_/ / |   | |___ 
--   \_/ \____/\_____/\____/\____/ \____/\___/\_|   \____/ 
--


return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("telescope").setup({})
		local builtin = require("telescope.builtin")
		vim.keymap.set({ "n" }, "<leader>ff", builtin.find_files , { desc = "Telescope find files." })
		vim.keymap.set({ "n" }, "<leader>fg", builtin.live_grep, { desc = "Telescope live grep." })
	end,
}
