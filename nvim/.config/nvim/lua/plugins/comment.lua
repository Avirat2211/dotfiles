return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()
		-- Normal mode: toggle comment
		vim.keymap.set("n", "<C-/>", function()
			require("Comment.api").toggle.linewise.current()
		end, { noremap = true, silent = true })

		-- Visual mode: toggle comment on selection
		vim.keymap.set("x", "<C-/>", function()
			local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
			vim.api.nvim_feedkeys(esc, "nx", false)
			require("Comment.api").toggle.linewise(vim.fn.visualmode())
		end, { noremap = true, silent = true })
	end,
}
