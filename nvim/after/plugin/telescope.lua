local builtin = require('telescope.builtin')

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  pickers ={
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "dropdown",
      mappings = {
        i = {
          ["<C-d>"] = "delete_buffer",
        },
      }
    },
    find_files = {
      sort_lastused = true,
      theme = "dropdown",
    },
    live_grep = {
      sort_lastused = true,
      theme = "dropdown",
    },
    help_tags = {
      sort_lastused = true,
      theme = "dropdown",
    },
    git_files = {
      sort_lastused = true,
      theme = "dropdown",
    },
    marks = {
      sort_lastused = true,
      theme = "dropdown",
    },
    git_commits = {
      theme = "dropdown",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('ui-select')

-- These will be global. 
-- Add to a 'on_attach' in lsp.lua and pass in bufnr to options for buffer specific
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
-- vim.keymap.set('n', '<leader>gg', builtin.builtin, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep >  ") });
end)
