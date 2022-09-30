-- Format Code
vim.keymap.set('n', '<C-f>', ':Neoformat<CR>')

-- Tabs + Bufferline
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', {})
-- vim.keymap.set(vn', '<C-w>', ':bdelete<CR>')
