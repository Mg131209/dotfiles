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
          -- defaults = {
          --   vimgrep_arguments = {
          --     "rg",
          --     "--color=never",
          --     "--no-heading",
          --     "--with-filename",
          --     "--line-number",
          --     "--column",
          --     "--smart-case",
          --     "--hidden",
          --     "--no-ignore",
          --   },
          --   file_ignore_patterns = { "%.git/" },
          -- },
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
