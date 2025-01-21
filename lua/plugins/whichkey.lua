return {
  'folke/which-key.nvim',
  config = function()
    vim.keymap.set({ 'n', 'v' }, '<leader>', '<Nop>', { silent = true })

    local wk = require("which-key")

    wk.setup({
      triggers = {
        { "<auto>", mode = "nixsotc" },
        { "s",      mode = { "n", "x" } }
      }
    })

    wk.add({
      { "<leader>f",  group = "Find" },
      { "<leader>g",  group = "Git" },
      { "<leader>gh", group = "Hunk" },
      { "<leader>l",  group = "LSP" },
      { "<leader>t",  group = "Toggle" },
      { "<leader>tg", group = "Git" },
      { "<leader>tl", group = "LSP" },
      { "<leader>tu", group = "Ui" },
      { "s",          group = "Surround" }
    })
  end
}
