vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFFFFF", bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#C2C1AC", bg = "NONE" })
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false })
vim.keymap.set("n", "<leader>oc", function()
	local file = vim.fn.expand("%")
	local cmd = { "g++", "-std=c++23", file, "-o", "a" }
	vim.fn.jobstart(cmd, {
		stdout_buffered = true,
		stderr_buffered = true,

		on_exit = function(_, code)
			if code == 0 then
				vim.notify("Compiled successfully ✔️", vim.log.levels.INFO)
			else
				vim.notify("Compilation failed ❌ (check :messages)", vim.log.levels.ERROR)
			end
		end,
	})
end, { desc = "Async Compile current file with g++" })
vim.keymap.set("n", "<leader>oy", 'ggVG"+y', { desc = "Select all & copy to clipboard" })
