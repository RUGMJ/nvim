return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    {
      'j-hui/fidget.nvim',
      opts = {
        notification = {
          window = {
            winblend = 0, -- makes catppuccin happy
          },
        }
      }
    },

    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    local on_attach = require("on_attach")

    local servers = {
      clangd = {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
      },

      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('blink.cmp').get_lsp_capabilities(nil, true)

    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
      ["jdtls"] = function() end

    }

    require 'lspconfig'.gdscript.setup {
      on_attach = on_attach
    }

    require 'lspconfig'.sourcekit.setup {
      on_attach = on_attach,
      cmd_env = { SOURCEKIT_TOOLCHAIN_PATH = vim.fn.expand("$THEOS/toolchain/linux/host") },
      cmd = { vim.fn.expand("$THEOS/toolchain/linux/host/bin/sourcekit-lsp") }
    }

    require 'lspconfig'.nushell.setup {
      on_attach = on_attach,
      cmd = { "/usr/bin/nu", "--lsp" }
    }
  end
}
