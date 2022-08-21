require "base"
require "plugins"
require "theme"
require "maps"

require "auto_completion"
require "_lspconfig"
require "_null-ls"
require "_git"
require "_telescope"
require "_treesitter"
require "_autopairs"
require "_autotag"
require "_comment"

-- Sync clipboard with system clipboard
local has = function(x)
	return vim.fn.has(x) == 1
end
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
	require "macos"
end
if is_win then
	require "windows"
end
