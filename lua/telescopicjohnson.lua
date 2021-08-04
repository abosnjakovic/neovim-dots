
-- telescope fzf native
-- require('telescope').setup {
--   extensions = {
--     fzf = {
--       fuzzy = true,                    -- false will only do exact matching
--       override_generic_sorter = false, -- override the generic sorter
--       override_file_sorter = true,     -- override the file sorter
--       case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
--     }
--   }
-- }
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
-- require('telescope').load_extension('fzf')


-- Telescope Global remapping
local actions = require("telescope.actions")
require("telescope").setup {
  defaults = {
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
    }
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {
          ["<C-w>"] = "delete_buffer"
        },
        n = {
          ["<C-w>"] = "delete_buffer"
        }
      }
    }
  },
  extensions = {
      fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = false, -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
      },
      project = {
          base_dirs = {
              '~/Repositories',
              {'~/.config', max_depth = 4},
          },
          hidden_files = true -- default: false
          
      }
  }
}
require('telescope').load_extension('fzf')
require'telescope'.load_extension('project')
