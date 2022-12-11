require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = "auto" ,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {"NvimTree"}, -- filetypes to diable lualine on
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  -- extensions = {'nvim-tree'},
}
