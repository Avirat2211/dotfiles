return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls", "clangd", "ts_ls", "jdtls", "pyright" },
				automatic_enable = {
					exclude = {
						"jdtls",
					},
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"java-debug-adapter",
					"java-test",
					"ruff",
				},
			})
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "information about the function" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "goto definition" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "goto references" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "code actions" })
			vim.lsp.enable("clangd")
			vim.lsp.enable("gopls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("ts_ls", {
				settings = {
					javascript = { suggest = { autoImports = true } },
					typescript = { suggest = { autoImports = true } },
				},
			})
		end,
	},
}
