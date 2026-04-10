return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 10,                    -- Height of the terminal
        open_mapping = [[<c-\>]],     -- Ctrl+\ to toggle
        direction = 'horizontal',     -- Bottom split (horizontal)
        start_in_insert = true,       -- Start in insert mode
        shade_terminals = true,       -- Shade non-active terminals
        persist_size = true,          -- Remember size between sessions
      })
    end,
  },
}
