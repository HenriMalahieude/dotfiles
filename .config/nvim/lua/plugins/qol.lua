return {
	--[[{ --Helpful extra keys, might remove
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{"<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)"},
		},
	}, --]]

	--[[ --Doesn't work because of experimental state
	{ --Notifications, but doesn't change E#### errors that nvim spits out. Grr
		"rcarriga/nvim-notify",
		lazy = false,
		opts = {
			stages = "fade_in_slide_out",
			timeout = 3000,
		},
		config = function(_, opts)
			notif = require("notify")
			notif.setup(opts)

			vim.notify = notif
		end,
	},

	{ --Override the default notifications
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = { enabled = false },
			notify = { enabled = true, view="notify" },
		},
	}, --]]

	{
		"folke/snacks.nvim",
		opts = {
			bigfile = {
				notify = true,
				size = 1 * 1024 * 1024,
				line_length = 1500,
			},
		},
	},
}
