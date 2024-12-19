return {
   "folke/tokyonight.nvim",
   priority = 1000, -- Ensure it loads first
   config = function ()
      -- normal
      vim.cmd("colorscheme tokyonight-night")

      -- für light-mode
      -- vim.cmd("colorscheme onelight")

      -- für mehr Kontrast
      -- vim.cmd("colorscheme onedark_dark")
   end
}
