local fn = vim.fn

-- Load lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- require("lazy").setup(plugins, opts)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end


return lazy.setup({
"nvim-lua/popup.nvim",
"nvim-lua/plenary.nvim",
"windwp/nvim-autopairs",
"akinsho/toggleterm.nvim",
"nvim-lualine/lualine.nvim",
"ThePrimeagen/harpoon",
"nvim-telescope/telescope.nvim",
"nvim-telescope/telescope-media-files.nvim",
"jvgrootveld/telescope-zoxide",
"unblevable/quick-scope",
"justinmk/vim-sneak",
"folke/which-key.nvim",
"kylechui/nvim-surround",
"kyazdani42/nvim-tree.lua",
"hrsh7th/nvim-cmp", -- The completion plugin
"hrsh7th/cmp-buffer", -- buffer completions
"hrsh7th/cmp-path", -- path completions
"hrsh7th/cmp-cmdline", -- cmdline completions
"saadparwaiz1/cmp_luasnip", -- snippet completions
"hrsh7th/cmp-nvim-lsp",
"hrsh7th/cmp-nvim-lua",
"L3MON4D3/LuaSnip", --snippet engine
"rafamadriz/friendly-snippets", -- a bunch of snippets to use
"neovim/nvim-lspconfig", -- enable LSP
"williamboman/nvim-lsp-installer", -- simple to use language server installer
"nvim-treesitter/nvim-treesitter",
"p00f/nvim-ts-rainbow",
"nvim-treesitter/playground",
"stevearc/aerial.nvim",
"aerial",
"numToStr/Comment.nvim", -- Easily comment stuff
"JoosepAlviste/nvim-ts-context-commentstring",
"iamcco/markdown-preview.nvim",
"jakewvincent/mkdnflow.nvim",
"vim-python/python-syntax",
"ap/vim-css-color",
"RRethy/nvim-base16"
})


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
--   if PACKER_BOOTSTRAP then
--     require("packer").sync()
--   end
-- end)

-- Automatically install packer
-- local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
-- if fn.empty(fn.glob(install_path)) > 0 then
--   PACKER_BOOTSTRAP = fn.system {
--     "git",
--     "clone",
--     "--depth",
--     "1",
--     "https://github.com/wbthomason/packer.nvim",
--     install_path,
--   }
--   print "Installing packer close and reopen Neovim..."
--   vim.cmd [[packadd packer.nvim]]
-- end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
-- local status_ok, packer = pcall(require, "packer")
-- if not status_ok then
--   return
-- end
--
--packer = require('packer')

-- Have packer use a popup window
-- packer.init {
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end,
--   },
-- }

-- Install your plugins here
-- return packer.startup(function(use)
--   -- My plugins here
--   use "wbthomason/packer.nvim" -- Have packer manage itself
--   use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
--   use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
--   use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
--   use "akinsho/toggleterm.nvim"
-- 
--   -- A better status line
--   use {
--     'nvim-lualine/lualine.nvim',
--     requires = { 'kyazdani42/nvim-web-devicons', opt = true }
--   }
-- 
--   -- Movement and lookup
--   use 'ThePrimeagen/harpoon'
--   use "nvim-telescope/telescope.nvim"
--   use 'nvim-telescope/telescope-media-files.nvim'
--   use 'jvgrootveld/telescope-zoxide'
--   use 'unblevable/quick-scope'
--   use 'justinmk/vim-sneak'
--   use "folke/which-key.nvim"
--   use({
--       "kylechui/nvim-surround",
--       tag = "*", -- Use for stability; omit to use `main` branch for the latest features
--       config = function()
--           require("nvim-surround").setup({
--               -- Configuration here, or leave empty to use defaults
--           })
--       end
--   })
-- 
--   -- File exploration
--   use {
--     'kyazdani42/nvim-tree.lua',
--     requires = {
--       'kyazdani42/nvim-web-devicons', -- optional, for file icons
--     },
--     tag = 'nightly' -- optional, updated every week. (see issue #1193)
--   }
-- 
--   -- CMP plugins
--   use "hrsh7th/nvim-cmp" -- The completion plugin
--   use "hrsh7th/cmp-buffer" -- buffer completions
--   use "hrsh7th/cmp-path" -- path completions
--   use "hrsh7th/cmp-cmdline" -- cmdline completions
--   use "saadparwaiz1/cmp_luasnip" -- snippet completions
--   use "hrsh7th/cmp-nvim-lsp"
--   use "hrsh7th/cmp-nvim-lua"
--   --
--   --  -- snippets
--   --
--   use "L3MON4D3/LuaSnip" --snippet engine
--   use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
-- 
-- 
--   -- LSP
--   use "neovim/nvim-lspconfig" -- enable LSP
--   use "williamboman/nvim-lsp-installer" -- simple to use language server installer
-- 
--   -- Treesitter
--   use {
--     "nvim-treesitter/nvim-treesitter",
--     run = ":TSUpdate",
--   }
--   use "p00f/nvim-ts-rainbow"
--   use "nvim-treesitter/playground"
--   use {
--     "stevearc/aerial.nvim",
--     config = function() require("aerial").setup() end
--   }
-- 
--     -- Commentingj
--   use "numToStr/Comment.nvim" -- Easily comment stuff
--   use 'JoosepAlviste/nvim-ts-context-commentstring'
-- 
-- 
--   -- Productivity --
--   use({
--       "iamcco/markdown-preview.nvim",
--       run = function() vim.fn["mkdp#util#install"]() end,
--   })
--   use({'jakewvincent/mkdnflow.nvim',
--        config = function()
--           require('mkdnflow').setup({
--               -- Config goes here; leave blank for defaults
--           })
--        end
--   })
-- 
--   -- Syntax Highlighting and Colors --
--   use 'vim-python/python-syntax'
--   use 'ap/vim-css-color'
--   use 'RRethy/nvim-base16'
-- 
--   -- Misc
-- 
--   -- Automatically set up your configuration after cloning packer.nvim
--   -- Put this at the end after all plugins
--   if PACKER_BOOTSTRAP then
--     require("packer").sync()
--   end
-- end)
