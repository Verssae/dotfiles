-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 맞춤법 검사에서 한글(CJK)은 제외 — 없으면 markdown에서 한글 전체에 밑줄이 쳐진다
vim.opt.spelllang = { "en", "cjk" }
