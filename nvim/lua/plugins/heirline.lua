return {
	"rebelot/heirline.nvim",
	opts = function(_, opts)
		local status = require("astroui.status")
		local function project_path(path)
			if path == "" then
				return ""
			end
			local root = vim.fs.root(path, { ".git" }) or vim.fn.getcwd()
			local root_name = vim.fn.fnamemodify(root, ":t")
			local rel = vim.fn.fnamemodify(path, ":p"):sub(#vim.fn.fnamemodify(root, ":p") + 1)
			return rel ~= "" and root_name .. "/" .. rel or root_name
		end
		local FilePath = {
			init = function(self)
				self.icon = " "
				local buf_path = vim.api.nvim_buf_get_name(0)
				self.file_path = project_path(buf_path)
			end,
			hl = { fg = "grey", bold = true },

			flexible = 1,

			{
				provider = function(self)
					if self.file_path == "" then
						return ""
					end
					return self.icon .. self.file_path .. " "
				end,
			},
			{
				provider = function(self)
					if self.file_path == "" then
						return ""
					end
					local short_path = vim.fn.pathshorten(self.file_path)
					return self.icon .. short_path .. " "
				end,
			},
			{
				provider = "",
			},
		}

		local function sidebar_width()
			local winid = vim.api.nvim_tabpage_list_wins(0)[1]
			if not winid then
				return 0
			end
			local width = vim.api.nvim_win_get_width(winid)
			local bufnr = vim.api.nvim_win_get_buf(winid)
			return width < vim.o.columns and vim.bo[bufnr].filetype == "neo-tree" and width or 0
		end

		local function get_sidebar_width(self)
			return self._sidebar_width or 0
		end

		local function sidebar_offset(args)
			args = args or {}
			return {
				condition = function(self)
					self._sidebar_width = sidebar_width()
					return self._sidebar_width > 0
				end,
				provider = function(self)
					local text = args.provider and args.provider(self) or (args.label and " " .. args.label or "")
					local used = args.used_width and args.used_width(self) or 0
					return text .. (" "):rep(math.max(get_sidebar_width(self) - used - vim.fn.strdisplaywidth(text), 0))
				end,
				hl = args.hl or { bg = args.bg or "tabline_bg" },
			}
		end

		local function active_file_bufnr()
			local current = vim.api.nvim_get_current_buf()
			if vim.bo[current].filetype ~= "neo-tree" then
				return current
			end

			for _, winid in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
				local cfg = vim.api.nvim_win_get_config(winid)
				local bufnr = vim.api.nvim_win_get_buf(winid)
				if cfg.relative == "" and vim.bo[bufnr].filetype ~= "neo-tree" and vim.bo[bufnr].buftype == "" then
					return bufnr
				end
			end

			return current
		end

		local branch_provider = status.provider.git_branch({
			icon = { kind = "GitBranch", padding = { right = 1 } },
		})

		local mode_block = {
			provider = " ",
			hl = function()
				local hl = vim.deepcopy(status.hl.get_attributes("mode"))
				hl.bg = status.hl.mode_bg()
				return hl
			end,
		}

		local mode_gap = {
			provider = " ",
			hl = { bg = "bg" },
		}

		local sidebar_branch = sidebar_offset({
			used_width = function()
				return 2 -- one mode block cell + one gap cell
			end,
			provider = function()
				return branch_provider({ bufnr = active_file_bufnr() }) or ""
			end,
			hl = function()
				local hl = vim.deepcopy(status.hl.get_attributes("git_branch"))
				hl.bg = "bg"
				return hl
			end,
		})

		opts.statusline = { -- statusline
			hl = { fg = "fg", bg = "bg" },
			init = function(self)
				self.bufnr = vim.api.nvim_get_current_buf()
				self._sidebar_width = sidebar_width()
			end,
			mode_block,
			mode_gap,
			sidebar_branch,
			status.component.file_info({
				file_icon = {
					hl = status.hl.file_icon("statusline"),
					padding = { left = 0, right = 1 },
				},
				filetype = { padding = { left = 0 } },
			}),
			status.component.git_diff(),
			status.component.diagnostics(),
			status.component.builder(FilePath),
			status.component.fill(),
			status.component.cmd_info(),
			status.component.fill(),
			status.component.lsp(),
			status.component.virtual_env(),
			status.component.treesitter(),
			status.component.nav(),
			status.component.mode({ surround = { separator = "right" } }),
		}

		opts.winbar = { -- winbar
			init = function(self)
				self.bufnr = vim.api.nvim_get_current_buf()
			end,
			fallthrough = false,
			{ -- inactive winbar
				condition = function()
					return not status.condition.is_active()
				end,
				status.component.separated_path({ padding = { left = 0 } }),
				status.component.file_info({
					file_icon = {
						hl = status.hl.file_icon("winbar"),
						padding = { left = 0 },
					},
					filename = {},
					filetype = false,
					file_read_only = false,
					hl = status.hl.get_attributes("winbarnc", true),
					surround = false,
					update = "BufEnter",
				}),
			},
			{ -- active winbar
				status.component.breadcrumbs({
					padding = { left = 0 },
					hl = status.hl.get_attributes("winbar", true),
				}),
			},
		}

		opts.tabline = { -- tabline
			sidebar_offset({ label = " GagaPony", bg = "tabline_bg" }),
			status.heirline.make_buflist(status.component.tabline_file_info()), -- component for each buffer tab
			status.component.fill({ hl = { bg = "tabline_bg" } }), -- fill the rest of the tabline with background color
			{ -- tab list
				condition = function()
					return #vim.api.nvim_list_tabpages() >= 2
				end, -- only show tabs if there are more than one
				status.heirline.make_tablist({ -- component for each tab
					provider = status.provider.tabnr(),
					hl = function(self)
						return status.hl.get_attributes(status.heirline.tab_type(self, "tab"), true)
					end,
				}),
				{ -- close button for current tab
					provider = status.provider.close_button({
						kind = "TabClose",
						padding = { left = 1, right = 1 },
					}),
					hl = status.hl.get_attributes("tab_close", true),
					on_click = {
						callback = function()
							require("astrocore.buffer").close_tab()
						end,
						name = "heirline_tabline_close_tab_callback",
					},
				},
			},
		}

		opts.statuscolumn = { -- statuscolumn
			init = function(self)
				self.bufnr = vim.api.nvim_get_current_buf()
			end,
			status.component.foldcolumn(),
			status.component.numbercolumn(),
			status.component.signcolumn(),
		}
	end,
}
