 return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- Autocomplete Quellen
    -- Siehe https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
    -- Buffer
    "hrsh7th/cmp-buffer",
    -- Pfade
    "hrsh7th/cmp-path",
    -- Language Server
    "hrsh7th/cmp-nvim-lsp",
    -- Command mode
    "hrsh7th/cmp-cmdline",
    -- Snippet completion
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-vsnip",
  },
  config = function ()
    -- Set up nvim-cmp.
      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
          { name = 'path' },
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
  end
}
