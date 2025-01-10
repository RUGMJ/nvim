return {
  'lewis6991/gitsigns.nvim',
  ---@module "gitsigns"
  ---@class Gitsigns.Config
  opts = {
    on_attach = function(bufnr)
      local gs = require('gitsigns')

      vim.keymap.set('n', '<leader>ghp', gs.preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })
      vim.keymap.set('n', '<leader>ghP', gs.preview_hunk_inline, { buffer = bufnr, desc = 'Preview git hunk inline' })
      vim.keymap.set('n', '<leader>ghs', gs.stage_hunk, { buffer = bufnr, desc = 'Stage git hunk' })
      vim.keymap.set('n', '<leader>ghr', gs.reset_hunk, { buffer = bufnr, desc = 'Reset git hunk' })
      vim.keymap.set('n', '<leader>ghu', gs.undo_stage_hunk, { buffer = bufnr, desc = 'Undo stage git hunk' })

      require("snacks").toggle({
        name = "Current Line Blame",
        get = function()
          return require('gitsigns.config').config.current_line_blame
        end,
        set = function(state)
          gs.toggle_current_line_blame(state)
        end
      }):map("<leader>tgb")

      vim.keymap.set('v', '<leader>ghs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
        { buffer = bufnr, desc = 'Stage git hunk' })

      vim.keymap.set('v', '<leader>ghr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
        { buffer = bufnr, desc = 'Reset git hunk' })

      vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

      vim.keymap.set({ 'n', 'v' }, ']h', function()
        if vim.wo.diff then return ']h' end
        vim.schedule(function() gs.nav_hunk('next') end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
      vim.keymap.set({ 'n', 'v' }, '[h', function()
        if vim.wo.diff then return '[h' end
        vim.schedule(function() gs.nav_hunk('prev') end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
    end,
  },
}
