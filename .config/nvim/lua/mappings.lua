-- -- helper function for clean mappings
-- local function map(mode, lhs, rhs, opts)
--    local options = { noremap = true, silent = true }
--    if opts then
--       options = vim.tbl_extend("force", options, opts)
--    end
--    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end
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

--clipboard related
-- map('n', 'YY', 'ggVG"*y', opts)
map('n', 'YY', '%y*<CR>', opts)
map('v', '<leader>y', '"*y', opts)

map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>bb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fb', ':Telescope current_buffer_fuzzy_find<CR>', opts)
map('n', '<leader>t', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>zz', ':TZMinimalist<CR>', opts)
map('n', '<leader>za', ':TZAtaraxis<CR>', opts)

vim.keymap.set('n', ']]', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
