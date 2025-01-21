return {
  "3rd/image.nvim",
  build = false,   -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
  enabled = false, -- still trying to get this to work with my workflow
  opts = {
    processor = "magick_cli",
    backend = "kitty",
    integrations = {
      markdown = {
        only_render_image_at_cursor = true
      }
    }
  }
}
