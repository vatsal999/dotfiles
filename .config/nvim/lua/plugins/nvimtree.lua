require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_cursor       = true,
  update_cwd          = false,

  renderer = {
      indent_markers = {
          enable = true,
          inline_arrows = false,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            none = " ",
          },
        },
    icons = {
        show = {
            folder_arrow = false,
        },
        glyphs = {
           default = "",
           symlink = "",
           git = {
              deleted = "",
              ignored = "◌",
              renamed = "➜",
              staged = "✓",
              unmerged = "",
              unstaged = "✗",
              untracked = "★",
           },
           folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
       },
    },
}

  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = false,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    adaptive_size = true,
    hide_root_folder = false,
    side = 'left',
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "no"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
