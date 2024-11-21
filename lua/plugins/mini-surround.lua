return {
  'echasnovski/mini.surround',
  version = false,
  config = function()
    vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')
    require("mini.surround").setup({})
  end
}
