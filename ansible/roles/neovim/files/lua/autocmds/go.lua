--  _____ _____ 
-- |  __ \  _  |
-- | |  \/ | | |
-- | | __| | | |
-- | |_\ \ \_/ /
--  \____/\___/ 
--


local go_augroup = vim.api.nvim_create_augroup("goConfig", {})
local autocmd = vim.api.nvim_create_autocmd


autocmd({ "BufEnter" }, {
	group = go_augroup,
	pattern = { "*.go" },
	callback = function()
		vim.schedule(
			function()
				vim.opt_local.makeprg = "go run %"
			end
		)
	end,
})

autocmd({ "BufEnter" }, {
	group = go_augroup,
	pattern = { "*.go" },
	callback = function()
		local dap = require("dap")
		local dap_go = require("dap-go")
		vim.keymap.set(
			{ "n" },
			"<leader>db",
			function() dap.toggle_breakpoint() end,
			{ desc = "Toggle breakpoint at line.",
		})
		vim.keymap.set(
			{ "n" },
			"<leader>dos",
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			{ desc = "Open debugging sidebar.",
		})
		vim.keymap.set(
			{ "n" },
			"<leader>dgt",
			function()
				dap_go.debug_test()
			end,
			{ desc = "Debug Go test.",
		})
		vim.keymap.set(
			{ "n" },
			"<leader>dgl",
			function()
				dap_go.debug_last()
			end,
			{ desc = "Debug last Go test.",
		})
	end,
})

autocmd("BufWritePre", {
	group = go_augroup,
	pattern = { "*.go" },
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = {only = {"source.organizeImports"}}
		-- buf_request_sync defaults to a 1000ms timeout. Depending on your
		-- machine and codebase, you may want longer. Add an additional
		-- argument after params if you find that you have to write the file
		-- twice for changes to be saved.
		-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
		vim.lsp.buf.format({async = false})
	end,
})
