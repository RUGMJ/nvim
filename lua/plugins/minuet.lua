return {
  {
    'milanglacier/minuet-ai.nvim',

    opts = {
      cmp = {
        enable_auto_complete = false
      },

      blink = {
        enable_auto_complete = true
      },

      provider = 'openai_compatible',
      provider_options = {
        openai_compatible = {
          max_tokens = 512,
          model = 'gemini-1.5-flash',
          stream = true,
          api_key = 'VOID_API_KEY',
          name = "Void",
          end_point = "https://api.voidai.xyz/v1/chat/completions",
          optional = {
          },
        },
      }
    }
  },
  { 'nvim-lua/plenary.nvim' },
  { 'Saghen/blink.cmp' },
}
