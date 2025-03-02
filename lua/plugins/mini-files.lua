return {
  'echasnovski/mini.files',
  version = false,
  opts = {
    mappings = {
      close       = 'q',
      go_in       = '<CR>',
      go_out      = '-',
      mark_goto   = "'",
      mark_set    = 'm',
      reset       = '<BS>',
      reveal_cwd  = '@',
      show_help   = 'g?',
      synchronize = '=',
      trim_left   = '<',
      trim_right  = '>',
    },

    options = {
      use_as_default_explorer = false
    }
  },
  init = function()
    vim.keymap.set({ 'n' }, "<leader>ee", function()
      require('mini.files').open()
    end)
  end
}
