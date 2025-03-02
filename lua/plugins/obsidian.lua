return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    "BufReadPre " .. vim.fn.expand "~" .. "/notes/*.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/notes/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/notes/",
      },
    },

    daily_notes = {
      folder = "daily",
      date_format = "%d-%m-%y",
      default_tags = { "daily" }
    },

    ui = {
      enable = false
    }
  },
}
