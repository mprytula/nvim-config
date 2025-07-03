return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		-- no automatic setup
		ensure_installed = { "lua_ls", "vtsls", "biome@1.9.4", "eslint", "eslint_d", "prettier" },
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
