return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		local vtsls_config = {
			on_attach = function(client, bufnr)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Actions" })
			end,
		}

		local lua_ls_config = {
			on_attach = function(client, bufnr)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Actions" })
			end,
		}

		lspconfig.vtsls.setup(vtsls_config)
		lspconfig.lua_ls.setup(lua_ls_config)
	end,
}
