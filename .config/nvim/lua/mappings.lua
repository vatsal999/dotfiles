local opts = {noremap = true, silent = true}
local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "

map('n', 'H', '0', opts)
map('n', 'L', '$', opts)
map('n', '<bs>', '<c-^>`"zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)
map('n', '<C-d>', '<C-d>zz', opts)

-- indent
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- do not yank with x
map('n', 'x', '"_x', opts)

-- center search results
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)

--clipboard related
-- map('n', 'YY', 'ggVG"*y', opts)
map('n', '<leader>yy', ':%y*<CR>', opts)
map('v', '<leader>y', '"*y', opts)

-- buffers
map('n', '<TAB>', ':bnext<CR>', opts)
map('n', '<S-Tab>', ':bprevious<CR>', opts)
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>bb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fb', ':Telescope current_buffer_fuzzy_find<CR>', opts)
map('n', '<leader>t', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>zz', ':TZMinimalist<CR>', opts)
map('n', '<leader>za', ':TZAtaraxis<CR>', opts)

vim.keymap.set('n', ']]', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- LSP specific mappings in lspconfig.lua
