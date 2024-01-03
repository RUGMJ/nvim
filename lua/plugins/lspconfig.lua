return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

    'folke/neodev.nvim',
  },
}
