require("indent_blankline").setup {
    filetype_exclude = {
    "help",
    "terminal",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "",
    -- "mason",
  },
    -- for example, context is off by default, use this to turn it on
    -- highlights current context indent line
    -- show_current_context = false,
    -- Applies the |hl-IndentBlanklineContextStart| highlight group to the first
    -- line of the current context.
    -- show_current_context_start = true,
  show_current_context = true,
  show_current_context_start = false,
}

