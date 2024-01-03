return {
  'folke/which-key.nvim',
  opts = {},
  config = function()
    require("which-key").register({
      g = { name = "Git" },
      f = { name = "Find" },
      l = { name = "LSP" },
    }, { prefix = "<leader>" })
  end
}
