return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    config = function ()
      require("mason").setup()

      require("mason-lspconfig").setup({
        -- Liste der zu installierenden Language Server
        -- Siehe https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
        ensure_installed = {
          -- JSON - braucht Node.JS!
          "jsonls",

          -- Python - braucht Python!
          "pylsp",

          -- TypeScript/JavaScript - braucht Node.JS
          "ts_ls",
        },
      })


      local capabilities = require('cmp_nvim_lsp').default_capabilities()


      -- Language Server Konfiguration
      -- Weitere siehe https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

      require("lspconfig").jsonls.setup({})
      require("lspconfig").pylsp.setup({})

      -- TypeScript/JavaScript - siehe nächster Absatz!!
       require("typescript-tools").setup({})
    end
  }
}
