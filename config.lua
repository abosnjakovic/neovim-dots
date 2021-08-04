require "mappings"
-- require "dap"

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

lvim.builtin.dap.active = true
lvim.builtin.dap.on_config_done = function(dap)

    -- CPP
    dap.adapters.lldb = {
      type = 'executable',
      command = '/usr/bin/lldb-vscode',
      name = "lldb"
    }

    dap.configurations.cpp = {
        {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = "${workspaceFolder}/build/binary_name",
            cwd = "${workspaceFolder}/build",
            stopOnEntry = false,
            args = {},
            runInTerminal = false,
        },
    }
    dap.configurations.c = dap.configurations.cpp

    -- py
    dap.adapters.python = {
      type = 'executable',
      command = 'python',
      args = {'-m', 'debugpy.adapter'}
    }
    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        pythonPath = function() return '/usr/local/bin/python' end,
      },
    }

    -- dapui
    require("dapui").setup({
      icons = { expanded = "▾", collapsed = "▸" },
      mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
      },
      sidebar = {
        open_on_start = true,
        -- You can change the order of elements in the sidebar
        elements = {
          -- Provide as ID strings or tables with "id" and "size" keys
          {
            id = "scopes",
            size = 0.25, -- Can be float or integer > 1
          },
          { id = "breakpoints", size = 0.25 },
          { id = "stacks", size = 0.25 },
          { id = "watches", size = 00.25 },
        },
        width = 40,
        position = "left", -- Can be "left" or "right"
      },
      tray = {
        open_on_start = true,
        elements = { "repl" },
        height = 10,
        position = "bottom", -- Can be "bottom" or "top"
      },
      floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
      },
      windows = { indent = 1 },
    })
end

lvim.builtin.which_key.mappings["d"] = {
  name = "Debug",
  t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
  b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
  c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
  d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
  g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
  i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
  o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
  u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
  r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
  s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
  q = { "<cmd>lua require'dap'.stop()<cr>", "Quit" },
}
