return require('packer').startup(function()
	-- Package manager
	use 'wbthomason/packer.nvim'

	-- Misc
	use 'christoomey/vim-tmux-navigator'
	use 'editorconfig/editorconfig-vim'
	use 'andweeb/presence.nvim'

	-- Telescope stuff
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'kyazdani42/nvim-web-devicons'

	-- Colour stuff
	use 'ap/vim-css-color'
	use { 'folke/tokyonight.nvim', branch = 'main' }
	use 'nvim-lualine/lualine.nvim' -- Requires nvim-web-devicons which we already have above :)

	-- Lsp stuff :)
	use 'L3MON4D3/LuaSnip'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/nvim-cmp'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'neovim/nvim-lspconfig'
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/nvim-treesitter-context'
	use 'saadparwaiz1/cmp_luasnip'
	use 'scrooloose/nerdcommenter' -- Smart commenting
	use 'steelsojka/pears.nvim' -- Auto bracket closing
end)
