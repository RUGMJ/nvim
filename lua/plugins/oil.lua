return {
  'stevearc/oil.nvim',
  opts = {
    columns = {},

    buf_options = {
      buflisted = false
    },

    view_options = {
      show_hidden = true
    },

    skip_confirm_for_simple_edits = false,
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
