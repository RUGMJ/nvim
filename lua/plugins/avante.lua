return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  build = 'make',
  opts = {
    provider = 'void',
    vendors = {
      ['void'] = {
        __inherited_from = 'openai',
        model = 'gpt-4o',
        api_key_name = 'VOID_API_KEY',
        endpoint = 'https://api.voidai.xyz/v1',
      }
    },

    behaviour = {
      auto_apply_diff_after_generation = true,
    },

    hints = {
      enabled = false
    },

    windows = {
      sidebar_header = {
        enabled = false
      },
    }
  },
  config = function(_, opts)
    require('avante').setup(opts)

    local prefill_edit_window = function(request)
      require('avante.api').edit()
      local code_bufnr = vim.api.nvim_get_current_buf()
      local code_winid = vim.api.nvim_get_current_win()
      if code_bufnr == nil or code_winid == nil then
        return
      end
      vim.api.nvim_buf_set_lines(code_bufnr, 0, -1, false, { request })
      vim.api.nvim_win_set_cursor(code_winid, { 1, #request + 1 })
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-s>', true, true, true), 'v', true)
    end

    require('which-key').add {
      { '<leader>a', group = 'Avante' }, -- NOTE: add for avante.nvim
      {
        mode = { 'n', 'v' },
        {
          '<leader>ag',
          function()
            require('avante.api').ask { question = 'Correct the text to standard English, but keep any code blocks inside intact.' }
          end,
          desc = 'Grammar Correction(ask)',
        },
        {
          '<leader>ak',
          function()
            require('avante.api').ask { question = 'Extract the main keywords from the following text' }
          end,
          desc = 'Keywords(ask)',
        },
        {
          '<leader>al',
          function()
            require('avante.api').ask { question = [[
  You must identify any readability issues in the code snippet.
  Some readability issues to consider:
  - Unclear naming
  - Unclear purpose
  - Redundant or obvious comments
  - Lack of comments
  - Long or complex one liners
  - Too much nesting
  - Long variable names
  - Inconsistent naming and code style.
  - Code repetition
  You may identify additional problems. The user submits a small section of code from a larger file.
  Only list lines with readability issues, in the format <line_num>|<issue and proposed solution>
  If there's no issues with code respond with only: <OK>
]] }
          end,
          desc = 'Code Readability Analysis(ask)',
        },
        {
          '<leader>ao',
          function()
            require('avante.api').ask { question = 'Optimize the following code' }
          end,
          desc = 'Optimize Code(ask)',
        },
        {
          '<leader>am',
          function()
            require('avante.api').ask { question = 'Summarize the following text' }
          end,
          desc = 'Summarize text(ask)',
        },
        {
          '<leader>ax',
          function()
            require('avante.api').ask { question = 'Explain the following code' }
          end,
          desc = 'Explain Code(ask)',
        },
        {
          '<leader>ac',
          function()
            require('avante.api').ask { question = 'Complete the following codes written in ' .. vim.bo.filetype }
          end,
          desc = 'Complete Code(ask)',
        },
        {
          '<leader>ad',
          function()
            require('avante.api').ask { question = 'Add docstring to the following codes' }
          end,
          desc = 'Docstring(ask)',
        },
        {
          '<leader>ab',
          function()
            require('avante.api').ask { question = 'Fix the bugs inside the following codes if any' }
          end,
          desc = 'Fix Bugs(ask)',
        },
        {
          '<leader>au',
          function()
            require('avante.api').ask { question = 'Implement tests for the following code' }
          end,
          desc = 'Add Tests(ask)',
        },
      },
    }

    require('which-key').add {
      { '<leader>a', group = 'Avante' }, -- NOTE: add for avante.nvim
      {
        mode = { 'v' },
        {
          '<leader>aG',
          function()
            prefill_edit_window('Correct the text to standard English, but keep any code blocks inside intact.')
          end,
          desc = 'Grammar Correction',
        },
        {
          '<leader>aK',
          function()
            prefill_edit_window('Extract the main keywords from the following text')
          end,
          desc = 'Keywords',
        },
        {
          '<leader>aO',
          function()
            prefill_edit_window('Optimize the following code')
          end,
          desc = 'Optimize Code(edit)',
        },
        {
          '<leader>aC',
          function()
            prefill_edit_window('Complete the following codes written in ' .. vim.bo.filetype)
          end,
          desc = 'Complete Code(edit)',
        },
        {
          '<leader>aD',
          function()
            prefill_edit_window('Add docstring to the following codes')
          end,
          desc = 'Docstring(edit)',
        },
        {
          '<leader>aB',
          function()
            prefill_edit_window('Fix the bugs inside the following codes if any')
          end,
          desc = 'Fix Bugs(edit)',
        },
        {
          '<leader>aU',
          function()
            prefill_edit_window('Implement tests for the following code')
          end,
          desc = 'Add Tests(edit)',
        },
      },
    }
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',

    'nvim-telescope/telescope.nvim',
    'echasnovski/mini.icons',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
