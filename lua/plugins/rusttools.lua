return {
  'simrat39/rust-tools.nvim',
  ft = "rust",
  config = function()
    local rt = require("rust-tools")

    rt.setup({
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<Leader>lh", rt.hover_actions.hover_actions, { buffer = bufnr })
          vim.keymap.set("n", "<Leader>la", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
      },

      dap = {
        adapter = {
          type = "executable",
          command = "lldb-vscode",
          name = "rt_lldb",
        },
      },
    })
  end
}
