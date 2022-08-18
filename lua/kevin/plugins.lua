-- PLUGINS Kevin Kinney

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Plugin List
-- Options for use
  -- commit - a sha hash for a specific commit to use
  -- opt = true puts it in the opt directory, not the start directory. Doesn't load until called
  -- cmd - the commands that trigger loading an opt plugin, lazy loading
  -- ft = table of file type extensions that will use the plugin
  -- run specifiy a command to run on install/sync, like a build step
return packer.startup(function(use)
  -- My Plugins
  -- use("/Users/kevinmkinney/workspace/kevin/kattis-nvim")

  -- The basics
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
	use "nvim-lua/popup.nvim" -- Useful lua functions used by lots of plugins

  -- Code formatters
  use "nvim-treesitter/nvim-treesitter" -- Highlighting
	use "windwp/nvim-autopairs" -- Auto pairs
	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })

  -- Functional
	use "akinsho/toggleterm.nvim"
  use "nvim-telescope/telescope.nvim"
  use({"kyazdani42/nvim-tree.lua", requires = {"kyazdani42/nvim-web-devicons", opt = true}})

	-- Colorschemes
	use("sainnhe/everforest") -- Best colorscheme :)
  use "nvim-lualine/lualine.nvim"

	-- cmp plugins
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"

	-- LSP
	use "neovim/nvim-lspconfig" -- enable LSP
	use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" }) -- a bunch of snippets to use


	-- Git
	use "lewis6991/gitsigns.nvim"
  use "akinsho/bufferline.nvim" 
	--use({ "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" })

  -- Future Plugins
	--use({ "jose-elias-alvarez/null-ls.nvim", commit = "ff40739e5be6581899b43385997e39eecdbf9465" }) -- for formatters and linters
	--use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	--use({ "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" })
	--use({ "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" })
	--use({ "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" })
	--use({ "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" })
	--use("folke/which-key.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
