return {
  "mfussenegger/nvim-jdtls",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        local jdtls = require("jdtls");

        local installed_path = require("mason-registry").get_package("jdtls"):get_install_path() .. "/jdtls"
        local on_attach = require("on_attach")
        local config = {
          cmd = { installed_path },
          on_attach = on_attach
        }
        jdtls.start_or_attach(config)
      end
    })
  end
}
