-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
-- start plugins section

-- packer can manage itself
  use("wbthomason/packer.nvim")

-- lua functions used by many plugins
  use("nvim-lua/plenary.nvim")

-- color scheme
  use("bluz71/vim-nightfly-guicolors") 

-- tux and split window navigation
  use("christoomey/vim-tmux-navigator")

-- maximizes and restores current window
  use("szw/vim-maximizer")

-- essentials
  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")

-- commenting
  use("numToStr/Comment.nvim")

-- file explorer
  use("nvim-tree/nvim-tree.lua")

-- icons
  use("kyazdani42/nvim-web-devicons")

-- status line
  use("nvim-lualine/lualine.nvim")

-- telescope fuzzy finder
  use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
  use({"nvim-telescope/telescope.nvim", branch = "0.1.x"})

-- autocomplete
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")

-- snippets
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

-- managing and installing lsp servers
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

-- configuring lsp servers
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use({ "glepnir/lspsaga.nvim", branch = "main" })
  use("onsails/lspkind.nvim")

-- treesitter
  use({
      "nvim-treesitter/nvim-treesitter",
      run = function ()
          require("nvim-treesitter.install").update({ with_sync = true })
      end,
  })

-- auto closing
  use("windwp/nvim-autopairs")

-- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

-- nvim-markdown-preview
  use("davidgranstrom/nvim-markdown-preview")

-- end plugins section

  if packer_bootstrap then
    require("packer").sync()
  end
end)
