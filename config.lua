require "mappings"
require "telescopicjohnson"
require "bugger"

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "material"
vim.g.material_style = "deep ocean"
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true


lvim.plugins = {
  "christoomey/vim-tmux-navigator",

  -- theme
  "marko-cerovac/material.nvim",


  -- motions
  "tpope/vim-repeat",
  "tpope/vim-surround",
  "easymotion/vim-easymotion",

  -- lsp
  "ray-x/lsp_signature.nvim",

  -- DAP
  "rcarriga/nvim-dap-ui",
  "jbyuki/one-small-step-for-vimkind",
  "mfussenegger/nvim-dap-python",

  {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  "nvim-telescope/telescope-project.nvim",

  -- zen mode
  "stevearc/aerial.nvim",
  { "folke/twilight.nvim",
  config = function()
    lvim.builtin.which_key.mappings["z"] = { ":Twilight<cr>", "Zen"}

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
end},

-- END plugins
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }


