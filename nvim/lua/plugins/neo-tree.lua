return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		source_selector = {
			separator = { left = " ", right = " " },
			separator_active = { left = " ", right = " " },
			show_separator_on_edge = false,
		},
		filesystem = {
			-- Don't auto-open on `nvim <folder>`; <Leader>e toggle still works.
			hijack_netrw_behavior = "disabled",
			components = {
				name = function(config, node, state)
					local component = require("neo-tree.sources.common.components").name(config, node, state)
					if node:get_depth() == 1 then
						component.text = vim.fn.fnamemodify((node.path or node.name):gsub("/$", ""), ":t")
					end
					return component
				end,
			},
			filtered_items = {
				hide_gitignored = false,
				hide_by_pattern = require("config.hide_patterns"),
			},
		},
	},
}
