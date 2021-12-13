-- helper function for clean mappings
local function map(mode, lhs, rhs, opts)
   local options = { noremap = true, silent = true }
   if opts then
      options = vim.tbl_extend("force", options, opts)
   end
   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

map('n', 'H', '0')
map('n', 'L', '$')  
map('n', '<bs>', '<c-^>`"zz')

map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>bb', ':Telescope buffers<CR>')
map('n', '<leader>fb', ':Telescope current_buffer_fuzzy_find<CR>')
map('n', '<leader>t', ':NvimTreeToggle<CR>')

