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
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP" },
      { "s",         group = "Surround" }
    })
  end
}
