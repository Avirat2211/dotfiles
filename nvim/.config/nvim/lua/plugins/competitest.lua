return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	config = function()
		require("competitest").setup({
			companion_port = 27121,
		})
		vim.keymap.set("n", "<leader>rr", "<cmd>CompetiTest run<CR>")
		vim.keymap.set("n", "<leader>rc", "<cmd>CompetiTest compile<CR>")
		vim.keymap.set("n", "<leader>ra", "<cmd>CompetiTest add_testcase<CR>")
		vim.keymap.set("n", "<leader>rp", "<cmd>CompetiTest run_all<CR>")
		vim.keymap.set("n", "<leader>ro", "<cmd>CompetiTest show_ui<CR>")
	end,
}
