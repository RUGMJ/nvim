return {
  'Wansmer/treesj',
  keys = { '<space>j' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    local treesj = require("treesj")

    treesj.setup {
      use_default_keymaps = false
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>j', treesj.toggle, { desc = "Toggle split / join block" })
  end
}
