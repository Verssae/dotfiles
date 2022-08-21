local keymap = vim.keymap

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Format Code
keymap.set('n', '<C-f>', ':Neoformat<CR>')

-- Undo
keymap.set('n', '<C-z>', ':undo<CR>')

-- Tabs + Bufferline
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', {})
