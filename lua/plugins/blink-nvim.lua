return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',

  version = '*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'enter',
      ['<C-Y>'] = { 'select_and_accept' },
      cmdline = {
        preset = 'default'
      }
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      per_filetype = {
        ["vim"] = { 'cmdline' } -- Enables completion in the command line window (`q:`)
      }
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      }
    }
  },

  opts_extend = { "sources.default" }
}
