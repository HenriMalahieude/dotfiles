return {

	--Git Signs
	{
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

				map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
				map("n", "<leader>tw", gitsigns.toggle_word_diff)
			end
		},
	},
}
