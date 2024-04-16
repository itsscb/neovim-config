return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = 'html', -- Install the HTML parser
        highlight = {
          enable = true -- Enable treesitter-based syntax highlighting
        }
      }
    end
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('nvim-treesitter.configs').setup {
        context_commentstring = {
          enable = true
        }
      }
      local lspconfig = require('lspconfig')
      lspconfig.tailwindcss.setup{}
      local opts = { noremap = true }
      local keymap = vim.api.nvim_set_keymap

      keymap("i", "<C-space>", "<Plug>(ts-autotag-trigger)", opts)
      keymap("n", "<leader>/", "<Plug>(ts-context-commentstring)", opts)

    end
  }
}
