--   ___  _   _ _____ _____ _____ ___  ________  _____ 
--  / _ \| | | |_   _|  _  /  __ \|  \/  |  _  \/  ___|
-- / /_\ \ | | | | | | | | | /  \/| .  . | | | |\ `--. 
-- |  _  | | | | | | | | | | |    | |\/| | | | | `--. \
-- | | | | |_| | | | \ \_/ / \__/\| |  | | |/ / /\__/ /
-- \_| |_/\___/  \_/  \___/ \____/\_|  |_/___/  \____/ 
--


require("autocmds.go")
require("autocmds.python")


local nvim_config_augroup = vim.api.nvim_create_augroup("nvimConfig", { clear = true })
local autocmd = vim.api.nvim_create_autocmd


autocmd({ "BufEnter" }, {
	group = nvim_config_augroup,
	pattern = { "*" },
	callback = function()
		vim.schedule(
			function()
				vim.cmd([[
					highlight CursorColumn ctermbg=238
					highlight CursorLine cterm=bold ctermbg=238
				]])
			end
		)
	end,
})

autocmd({ "BufEnter" }, {
	group = nvim_config_augroup,
	pattern = { "*" },
	callback = function()
		vim.cmd.colorscheme("gruvbox")
	end,
})

autocmd("InsertEnter", {
	group = nvim_config_augroup,
	pattern = { "*" },
	callback = function()
		vim.cmd.norm("zz")
	end,
})

autocmd("FileType", {
	group = nvim_config_augroup,
	pattern = { "javascript", "typescript", "css", "html", "yaml" },
	callback = function()
		vim.schedule(
			function()
				vim.opt_local.tabstop = 2
				vim.opt_local.shiftwidth = 2
				vim.opt_local.softtabstop = 2
				vim.opt_local.expandtab = true
			end
		)
	end,
})

autocmd("LspAttach", {
	group = nvim_config_augroup,
	pattern = { "*" },
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.keymap.set({ "n" }, "<leader>d", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set({ "n" }, "K", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set({ "n" }, "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
		vim.keymap.set({ "n" }, "<leader>rn", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set({ "n" }, "<leader>rr", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set({ "n" }, "<leader>n", function() vim.diagnostic.goto_next() end, opts)
		vim.keymap.set({ "n" }, "<leader>p", function() vim.diagnostic.goto_prev() end, opts)
		vim.keymap.set({ "n" }, "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set({ "n" }, "<leader>gd", function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set({ "n" }, "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
	end,
})
