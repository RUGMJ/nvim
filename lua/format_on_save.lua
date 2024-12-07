local M = {}

function M.setup()
  local format_on_save_enabled = true

  require("snacks").toggle({
    name = "Format On Save",
    get = function()
      return format_on_save_enabled
    end,
    set = function(state)
      format_on_save_enabled = state
    end
  }):map("<leader>lF")

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach-format", { clear = true }),
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if client == nil then
        return
      end

      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          if not format_on_save_enabled then
            return
          end
          if not client.supports_method("textDocument/formatting") then
            return
          end

          vim.lsp.buf.format()
        end,
      })
    end
  })
end

return M
