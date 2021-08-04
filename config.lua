require "mappings"
require "telescopicjohnson"
require "bugger"
require "langs"
require "vanityhall"

lvim.format_on_save = true
lvim.lint_on_save = true

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

lvim.plugins = {
  "christoomey/vim-tmux-navigator",
  "tami5/sql.nvim",

  -- theme
  "marko-cerovac/material.nvim",
  "lukas-reineke/indent-blankline.nvim",

  -- motions
  "tpope/vim-repeat",
  "tpope/vim-surround",
  "easymotion/vim-easymotion",

  -- lsp
  "ray-x/lsp_signature.nvim",

  -- dap
  "rcarriga/nvim-dap-ui",
  "jbyuki/one-small-step-for-vimkind",
  "mfussenegger/nvim-dap-python",

  -- telescopicjohnson
  {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  "nvim-telescope/telescope-project.nvim",
  "nvim-telescope/telescope-z.nvim",
  "nvim-telescope/telescope-frecency.nvim",

  -- zen mode
  "stevearc/aerial.nvim",
  "folke/twilight.nvim",
  "wfxr/minimap.vim",

-- END plugins
}
