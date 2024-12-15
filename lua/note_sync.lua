local M = {}
local Job = require("plenary.job")

---@class opts
---@field notes_dir string

---@param command string
---@param args string[]
---@param should_sync boolean?
local run_in_cwd = function(command, args, should_sync)
  if should_sync == nil then
    should_sync = false
  end

  local job = Job:new({
    command = command,
    args = args,
    cwd = vim.uv.cwd()
  })

  if should_sync then
    job:sync()
  else
    job:start()
  end
end

---@param opts opts
function M.setup(opts)
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = vim.split(vim.fn.expand(opts.notes_dir .. "/**.md"), "\n"),
    callback = function()
      run_in_cwd("git", { "pull" }, true)
      vim.cmd [[silent! edit]]
    end
  })

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = vim.split(vim.fn.expand(opts.notes_dir .. "/**.md"), "\n"),
    callback = function(args)
      run_in_cwd("git", { "commit", "--all", "-m", "(Automatic) Updated " .. args.file }, true)
      run_in_cwd("git", { "push" })
    end
  })
end

return M
