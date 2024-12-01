-- ________   _______ _   _ _____ _   _ 
-- | ___ \ \ / /_   _| | | |  _  | \ | |
-- | |_/ /\ V /  | | | |_| | | | |  \| |
-- |  __/  \ /   | | |  _  | | | | . ` |
-- | |     | |   | | | | | \ \_/ / |\  |
-- \_|     \_/   \_/ \_| |_/\___/\_| \_/
--


local python_augroup = vim.api.nvim_create_augroup("pythonConfig", {})
local autocmd = vim.api.nvim_create_autocmd


autocmd({ "FileType" }, {
	group = python_augroup,
	pattern = { "python" },
	callback = function()
		vim.schedule(
			function()
				vim.opt_local.expandtab = true
			end
		)
	end,
})

autocmd({ "FileType" }, {
	group = python_augroup,
	pattern = { "python" },
	callback = function()
		vim.schedule(
			function()
				vim.keymap.set(
					{ "x" },
					"<leader>p",
					":w! | :sp | :term python3 -i %<cr>",
					{ desc = "Execute visual selection in the Python interpreter." }
				)
			end
		)
	end,
})
