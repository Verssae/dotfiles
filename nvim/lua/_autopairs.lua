local status, autopairs = pcall(require, "nvim-ts-autopair")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})
