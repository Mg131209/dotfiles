return {
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
          'nvim-lua/plenary.nvim',
          { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      },
      config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<leader><leader>', builtin.find_files,{})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      end
    },
    {
      "nvim-telescope/telescope-ui-select.nvim",
      config = function()
              -- This is your opts table
       require("telescope").setup {
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {
                -- even more opts
              }

            }
          }
        }
        require("telescope").load_extension("ui-select")
end
    }

  }
