return {

	{ --Override the default notifications
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = { enabled = false }, --no lsp
			cmdline = { view = "cmdline" }, --default, cause I prefer that
		},
	}, --]]

	{
		"folke/snacks.nvim",
		priority = 1000,
		opts = {
			bigfile = {
				notify = true,
				size = 1 * 1024 * 500, --500 KiB
				line_length = 1000,

				setup = function(ctx)
					if not vim.api.nvim_buf_is_valid(ctx.buf)
						 or ctx.ft == 'neo-tree' then
						return
					end

					if vim.fn.exists(":NoMatchParen") then
						vim.cmd([[NoMatchParen]])
					end

					--[[ local sm = require('smear_cursor')
					sm.smear_horizontally = false
					sm.smear_vertically = false
					sm.smear_diagonally = false --]]

					vim.cmd([[Gitsigns toggle_signs false]])

					vim.cmd([[SatelliteDisable]])

					local ibl = require('ibl')
					ibl.enabled = false

					vim.schedule(function()
						if vim.api.nvim_buf_is_valid(ctx.buf) then
							vim.bo[ctx.buf].syntax = ctx.ft
						end
					end)
				end
			},
		},
	},

	--[[{ --Doesn't work?, I do want this though
		"laytan/cloak.nvim",
		opts = {
			enabled = true,
			cloak_character = "*",
			cloak_length = nil,

			highlight_group = 'Comment',

			try_all_patterns = true,
			cloak_telescope = false, --don't have it
			cloak_on_leave = true,

			patterns = {
				file_pattern = '.env*',
				cloak_pattern = "=.+",
				replace = nil,
			},
		},
	}, --]]

}
