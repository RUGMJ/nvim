return {
  'codethread/qmk.nvim',
  config = function()
    require('qmk').setup({
      name = 'LAYOUT_split_3x5_2',
      layout = {
        'x x x x x _ x x x x x',
        'x x x x x _ x x x x x',
        'x x x x x _ x x x x x',
        '_ _ _ x x _ x x _ _ _'
      }
    })
  end
}
