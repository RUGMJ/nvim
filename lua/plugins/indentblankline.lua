return {
  'lukas-reineke/indent-blankline.nvim',
  main = "ibl",
  opts = {
    scope = {
      enabled = false
    }
  },
  config = function(_, opts)
    require("ibl").setup(opts)

    require("snacks").toggle({
      name = "Indent Blankline",
      get = function()
        return require('ibl.config').get_config(-1).enabled
      end,
      set = function(state)
        require('ibl').update { enabled = state }
      end
    }):map("<leader>tub")
  end
}
