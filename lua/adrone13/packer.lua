-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	
	-- Color Scheme
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			-- vim.cmd('colorscheme rose-pine-main')
			-- vim.cmd('colorscheme rose-pine-moon')
			-- vim.cmd('colorscheme rose-pine-dawn')
			vim.cmd('colorscheme rose-pine-main')
		end
	})

	-- AST parser
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	-- Fast selection of bookmarked files
	use('theprimeagen/harpoon')
	-- Detailed change history
	use('mbbill/undotree')
	-- Git UI
	use('tpope/vim-fugitive')
	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			--- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
			
			

			-- LSP Support
			{'neovim/nvim-lspconfig'},

			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lua'},
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},


		}
	}
end)