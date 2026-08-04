return {
	{
		"HenriMalahieude/xterm-tmux.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd [[colorscheme tmux-system]]
		end,
	},

	{ --Git Diffs in file editor
		"lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				local function map(m, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(m, l, r, opts)
				end

				map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end)
				map("n", "<leader>hd", gitsigns.diffthis)
				map("n", "<leader>hD", function() gitsigns.diffthis("~") end)

				map("n", "<leader>hB", gitsigns.toggle_current_line_blame)
				map("n", "<leader>hw", gitsigns.toggle_word_diff)
			end
		},
	},

	{ --Better Status bar in editor
		"nvim-lualine/lualine.nvim",
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		opts = {
			options = {
				icons_enabled = true,
				theme = 'tmux-system',
				--component_separators = { left = '', right = ''},
				section_separators = { left = '', right = '' }, --┃
    			--section_separators = { left = '', right = ''},
				component_separators = { left = '│', right = '│' },
				disabled_filetypes = {
					--statusline = {'neo-tree'},
					--winbar = {'neo-tree'},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = false,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16,
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"FileType",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},

			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch', 'diagnostics'},
				lualine_c = {'filename'},
				lualine_x = {
					'searchcount',
					'fileformat',
					{'filetype', colored = false}
				},
				lualine_y = {'location'},
				lualine_z = {"vim.api.nvim_buf_line_count(0)"},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {'filename'},
				lualine_x = {{'filetype', colored = false}},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
		--[[config = function(_, opts)
			local custom_16color = require('lualine.themes.16color')
			custom_16color.inactive.a.bg = "#0F0F0F"
			custom_16color.inactive.b.bg = "#0F0F0F"
			custom_16color.inactive.c.bg = "#0F0F0F"
			opts.options.theme = custom_16color
			require('lualine').setup(opts)
		end --]]
	},

	{ --Prettier Buffers/Tabs
		"akinsho/bufferline.nvim",
		event = "VeryLazy", --Fix for if the buffer line at the top doesn't show up
		version = "*",
		dependencies = {'nvim-tree/nvim-web-devicons'},
		keys = {
    		{"<leader>bh", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
			{"<leader>bl", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
			{"<M-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer"},
			{"<M-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		},
		opts = {
			options = {
				mode = "buffers",
				themable = true,
				numbers = "buffer_id",
				show_close_icon = false,
				show_buffer_close_icons = false,
				separator_style = { '│', '│' };
				indicator = {
					icon = '│', -- this should be omitted if indicator style is not 'icon'
					style = 'icon',
				},
				diagnostics = false,
				always_show_bufferline = true,
				--auto_toggle_bufferline = true,
				--separator_style = "slant",
				hover = { enabled = false },
				offsets = {
					{
						filetype = 'neo-tree',
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left"
					},
				},
			},
		}
	},

	{--Indent scoping and blanklines
		"lukas-reineke/indent-blankline.nvim",
		--event = "LazyFile", --we aren't using lazy vim, whoops
		main = 'ibl',
		opts = {
			indent = {
				char = "╎",
				tab_char = "╎",
			},
			scope = {
				--show_start = false, show_end = false
				enabled = false, --I don't have an LSP or Treesitter so
			},
			whitespace = {
				highlight = {"Whitespace", "NonText"},
			},
			exclude = {
				filetypes = {
					"Trouble",
					"trouble",
					"help",
					"lazy",
					"meson",
					"neo-tree",
					"terminal",
					"toggleterm",
				},
			},
		},
	},

	{--Better cursor tracking, and fun :)
		"sphamba/smear-cursor.nvim",
		opts = {
			smear_insert_mode = false,

			stiffness = 0.8, --fast mode
			trailing_stiffness = 0.6,
			damping = 0.95,
			distance_stop_animating = 0.5,
		},
	},

	{ --this also includes search results
		"lewis6991/satellite.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim"
		},
		opts = {
			current_only = false,
			excluded_filetypes = {
				"neo-tree",
				"lazy",
			},

			handlers = {
				cursor = {enable = true},
				search = {enable = true},
				diagnostic = {enable = false}, --no lsp
				gitsigns = {enable = true},
				marks = {enable = true},
			},
		},
	},
}
