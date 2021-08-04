
lvim.colorscheme = "material"
vim.g.material_style = "deep ocean"
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true

lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

require("twilight").setup {
  dimming = {
    alpha = 0.25, -- amount of dimming
    color = { "Normal", "#ffffff" },
  },
  context = 10, -- amount of lines we will try to show around the current line
  expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
  "function",
  "method",
  "table",
  "if_statement",
},
exclude = {}, -- exclude these filetypes
  }

  vim.g.minimap_width = 10
  vim.g.minimap_auto_start = 0
  vim.g.minimap_auto_start_win_enter = 1
