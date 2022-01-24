
require("bufferline").setup{
    options = {
          numbers = function(opts)
            return string.format('%s', opts.ordinal)
          end,
        offsets = {{filetype = "NvimTree", text = "Files", text_align = "center"}},
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = true,
    },
    highlights = {
        buffer_selected = {
            gui = "bold"
        },
    }
}

