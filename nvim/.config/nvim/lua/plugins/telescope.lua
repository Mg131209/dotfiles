return {
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
          'nvim-lua/plenary.nvim',
          { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      },
      config = function()
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
