
require("bufferline").setup{
    options = {
          -- numbers = function(opts)
          --   return string.format('%s', opts.ordinal)
          -- end,
        offsets = {{filetype = "NvimTree", text = "", text_align = "center"}},
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = true,
        always_show_bufferline = false,
    },
    highlights = {
        buffer_selected = {
            bold = false,
            italic = false,
        },
    }
}

