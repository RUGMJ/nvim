return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        }
      },
      sections = {
        { section = "keys", gap = 1, padding = 1 },

        {
          title = "Contribution Graph",
          icon = " ",
          cmd = "gh contribs -x",
          section = "terminal"
        },

        {
          title = "Notifications",
          cmd = "gh notify -s -n5",
          icon = " ",
          section = "terminal",
          key = "N",
          action = function()
            vim.ui.open("https://github.com/notifications")
          end,
        },

        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              icon = " ",
              title = "Projects",
              section = "projects",
              enabled = not in_git
            },
            {
              title = "Open Issues",
              cmd = "gh issue list -L 3",
              icon = " ",
              height = 7,
              action = ":!gh issue list --web",
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 3",
              height = 7,
              action = ":!gh pr list --web",
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "hub --no-pager diff --stat -B -M -C",
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        -- { section = "startup" },
      },
    }
  }
}
