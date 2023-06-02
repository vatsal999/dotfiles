local opt = vim.opt
local g = vim.g

--opt.cmdheight = 0 -- try this, may be unstable
opt.errorbells = false
opt.splitbelow = true
opt.splitright = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.updatetime = 500

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.showmode = false
opt.hidden = true
opt.clipboard = "unnamedplus" -- Sync with system clipboard

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.wrap = false
opt.hlsearch = false
opt.incsearch = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true -- Don't ignore case with capitals
opt.expandtab = true


opt.termguicolors = true
opt.completeopt = "menu,menuone,noselect"

-- disable some builtin vim plugins
local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end

local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  g["loaded_" .. provider .. "_provider"] = 0
end
