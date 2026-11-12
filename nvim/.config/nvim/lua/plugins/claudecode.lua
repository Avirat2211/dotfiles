return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	config = function(_, opts)
		require("claudecode").setup(opts)

		-- Inside the Claude terminal: Ctrl+h leaves it and jumps to the code window on the left
		vim.api.nvim_create_autocmd("TermOpen", {
			group = vim.api.nvim_create_augroup("ClaudeCodeNav", { clear = true }),
			callback = function(ev)
				if vim.api.nvim_buf_get_name(ev.buf):match("claude") then
					vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { buffer = ev.buf, desc = "Back to code" })
				end
			end,
		})
	end,
	opts = {
		terminal = {
			split_side = "right",
			split_width_percentage = 0.35,
		},
	},
	keys = {
		{ "<leader>a", nil, desc = "AI/Claude Code" },
		{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
		{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
		{ "<C-l>", "<cmd>ClaudeCodeFocus<cr>", desc = "Go to Claude (opens it if closed)" },
		{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude session" },
		{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue last Claude session" },
		{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer to Claude" },
		{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
		{
			"<leader>as",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file from tree to Claude",
			ft = { "neo-tree", "NvimTree", "oil" },
		},
		{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
		{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny Claude diff" },
	},
}
