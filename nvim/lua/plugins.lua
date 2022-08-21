local status, packer = pcall(require, "packer")
if not status then
  print "Packer is not installed"
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "nvim-lua/plenary.nvim"
  use "Mofiqul/vscode.nvim"
  use "nvim-lualine/lualine.nvim" -- Statusline
  use "akinsho/bufferline.nvim"

  use "neovim/nvim-lspconfig" -- Configurations for Nvim LSP
  use "onsails/lspkind-nvim" -- vscode-like pictograms
  use "hrsh7th/cmp-buffer" -- nvim-cmp source for buffer words
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's built-in LSP
  use "hrsh7th/nvim-cmp" -- Completion

  use "github/copilot.vim"

  use "L3MON4D3/LuaSnip" -- Snippet Engine
  use "glepnir/lspsaga.nvim" -- LSP UIs
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
  }
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"
  use "lewis6991/gitsigns.nvim"
  use "jose-elias-alvarez/null-ls.nvim"

  use "sbdchd/neoformat"

  use "norcalli/nvim-colorizer.lua"
  use "numToStr/Comment.nvim"
end)
