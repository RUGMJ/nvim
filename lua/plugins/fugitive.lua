return {
  'tpope/vim-fugitive',
  config = function()
    function nmap(keys, action)
      vim.keymap.set('n', '<leader>g' .. keys, function()
          vim.cmd.Git(action)
        end,
        { desc = "Git " .. action })
    end

    nmap("p", "pull")
    nmap("P", "push")
    nmap("d", "diff")
    nmap("l", "log")
    nmap("b", "blame")
    nmap("a", "add .")
    nmap("c", "commit")

    vim.keymap.set('n', '<leader>gs', function()
        vim.cmd.Git()
      end,
      { desc = "Git status" })
  end
}
