return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.goimports,

				null_ls.builtins.diagnostics.golangci_lint,

				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.code_actions.eslint_d,

				null_ls.builtins.formatting.ruff,
				null_ls.builtins.diagnostics.ruff,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "format" })
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = {
				"*.go",
				"*.cpp",
				"*.hpp",
				"*.c",
				"*.h",
				"*.lua",
				"*.js",
				"*.ts",
				"*.jsx",
				"*.tsx",
				"*.json",
				"*.py",
			},
			callback = function()
				vim.lsp.buf.format()
			end,
		})
		vim.diagnostic.config({
			virtual_text = true, -- or false if you prefer floating
			signs = true,
			underline = true,
		})
	end,
}
