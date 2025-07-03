return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.ts_ls.setup({
			on_attach = function(client, bufnr)
				-- Enable code actions
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Actions" })
			end,
		})
		lspconfig.lua_ls.setup({
			on_attach = function(client, bufnr)
				-- Enable code actions
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Actions" })
			end,
		})
	end,
}
