---@type ChadrcConfig
local M = {}

M.ui = { theme = 'onedark' }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = true

return M