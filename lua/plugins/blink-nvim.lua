return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'milanglacier/minuet-ai.nvim',
  },

  version = '*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'enter',
      ['<C-Y>'] = { 'select_and_accept' },
    },

    cmdline = {
      keymap = {
        preset = 'default'
      }
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'minuet' },

      per_filetype = {
        ["vim"] = { 'cmdline' } -- Enables completion in the command line window (`q:`)
      },

      providers = {
        minuet = {
          name = 'minuet',
          module = 'minuet.blink',
          score_offset = 8,
        },
      },
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
      trigger = {
        prefetch_on_insert = false,
      }
    }
  },

  opts_extend = { "sources.default" }
}
