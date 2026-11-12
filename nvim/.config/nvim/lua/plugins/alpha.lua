-- return {
-- 	"goolord/alpha-nvim",
-- 	dependencies = {
-- 		"nvim-tree/nvim-web-devicons",
-- 	},
--
-- 	config = function()
-- 		local alpha = require("alpha")
-- 		local dashboard = require("alpha.themes.startify")
--
-- 		-- dashboard.section.header.val = {
-- 		-- 	[[                                                                       ]],
-- 		-- 	[[                                                                       ]],
-- 		-- 	[[                                                                       ]],
-- 		-- 	[[                                                                       ]],
-- 		-- 	[[                                                                     ]],
-- 		-- 	[[       ████ ██████           █████      ██                     ]],
-- 		-- 	[[      ███████████             █████                             ]],
-- 		-- 	[[      █████████ ███████████████████ ███   ███████████   ]],
-- 		-- 	[[     █████████  ███    █████████████ █████ ██████████████   ]],
-- 		-- 	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
-- 		-- 	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
-- 		-- 	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
-- 		-- 	[[                                                                       ]],
-- 		-- 	[[                                                                       ]],
-- 		-- 	[[                                                                       ]],
-- 		-- }
--
-- 		alpha.setup(dashboard.opts)
-- 	end,
-- }
-- return {
-- 	"goolord/alpha-nvim",
-- 	dependencies = {
-- 		"nvim-mini/mini.icons",
-- 		"nvim-lua/plenary.nvim",
-- 	},
-- 	config = function()
-- 		require("alpha").setup(require("alpha.themes.theta").config)
-- 	end,
-- }
return {
	"goolord/alpha-nvim",
	config = function()
		-- require("alpha").setup(require("alpha.themes.dashboard").config)
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}
		dashboard.section.buttons.val = {
			-- File / search
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("<C-p>", "󰱼  Search file", ":Telescope find_files<CR>"),
			dashboard.button("<leader>fg", "󰱼  Live grep", ":Telescope live_grep<CR>"),
			dashboard.button("<C-n>", "  Directory", ":Neotree filesystem toggle right<CR>"),

			-- LSP symbols
			-- dashboard.button("<leader>ds", "󰆧  Document symbols", ":Telescope lsp_document_symbols<CR>"),
			-- dashboard.button("<leader>ws", "󰆧  Workspace symbols", ":Telescope lsp_workspace_symbols<CR>"),

			-- Quit
			dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,
}
