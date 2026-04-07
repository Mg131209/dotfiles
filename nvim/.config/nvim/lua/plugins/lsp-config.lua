return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
    automatic_enable = true
  },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
     config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config = vim.lsp.config or {}
      vim.lsp.config.capabilities = capabilities

       vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
       vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
       vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action,{})

       vim.diagnostic.config({
        virtual_text = {
          source = "if_many",
          prefix = "●",
          spacing = 4,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
     end
  }
}
