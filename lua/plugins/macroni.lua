return {
  'jesseleite/nvim-macroni',
  enabled = false, -- Doesnt have the functionality I want yet
  config = function()
    require "macroni".setup {
      macros = {
        test = "f,a<CR><Esc>"
      }
    }

    vim.keymap.set({ "n", "v" }, "<leader>m", require('telescope').extensions.macroni.saved_macros)
  end
}
