return {
  'echasnovski/mini.surround',
  version = false,
  config = function()
    vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')
    require("mini.surround").setup({
      mappings = {
        add = 'gsa',
        delete = 'gsd',
        find = 'gsf',
        find_left = 'gsF',
        highlight = 'gsh',
        replace = 'gsr',
        update_n_lines = 'gsn',
      }
    })
  end
}
