return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function ()
    require("toggleterm").setup({
      open_mapping = [[<C-t>]],
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      direction = "horizontal",
      float_opts = {
        border = "curved",
        winblend = 5,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })
    vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")
    vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>")
    vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>")
  end
}
