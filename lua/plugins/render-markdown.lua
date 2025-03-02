return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        code = {
            disable_background = true,
            border = 'none'
        },

        checkbox = {
            custom = {
                { raw = "[ ]", rendered = "󰄱", highlight = "RenderMarkdownUnchecked" },
                { raw = "[x]", rendered = "", highlight = "RenderMarkdownChecked" },
                { raw = "[>]", rendered = "", highlight = "RenderMarkdownRightArrow" },
                { raw = "[~]", rendered = "󰰱", highlight = "RenderMarkdownTodo" },
                { raw = "[!]", rendered = "", highlight = "RenderMarkdownImportant" },
            }
        }
    },
}
