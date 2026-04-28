return {
	{ --vscode style side-bar workspace viewer
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
    		"nvim-tree/nvim-web-devicons",
		},
		opts = {
			sources = {"filesystem", "buffers", "git_status"},
			open_files_do_not_replace_types = {"term", "terminal", "Trouble", "trouble", "qf", "Outline"},
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = {enabled = true},
			},
			window = {
				mapping_options = {
					noremap = true,
					nowait = false,
				},
				mappings = {

				}
			},
		},
	},

	--[[ I don't think it works with neositter
	{ --workspace finder
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
		config = function(_, opts)
			require('project_nvim').setup{
				detection_methods = {"pattern"},
				patterns = {".git", "Makefile"},
			}

		end,
	}, --]]
}
