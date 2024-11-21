return {
  'catppuccin/nvim',
  name = "catppuccin",
  config = function()
    require("catppuccin").setup {
      integrations = {
      }
    }
    vim.cmd.colorscheme("catppuccin")
  end
}
