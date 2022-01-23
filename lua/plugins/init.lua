local present, packer = pcall(require, "plugins.packerInit")

if not present then
	return false
end

local use = packer.use

return packer.startup(function()
	use("nvim-lua/plenary.nvim")

	use({
		"wbthomason/packer.nvim",
		event = "VimEnter",
	})

	use("kyazdani42/nvim-web-devicons")

	use("tpope/vim-fugitive")

	use({
		"joshdick/onedark.vim",
		after = "packer.nvim",
		config = function()
			require("colors").init("onedark")
		end,
	})

	use({
		"feline-nvim/feline.nvim",
		config = function()
			require("plugins.configs.statusline")
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.configs.others").blankline()
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("plugins.configs.others").colorizer()
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require("plugins.configs.treesitter")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.configs.gitsigns")
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
		end,
	})

	use("williamboman/nvim-lsp-installer")

	use({
		"jose-elias-alvarez/null-ls.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("plugins.configs.null-ls").setup()
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.configs.cmp")
		end,
	})

	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")

	use("rafamadriz/friendly-snippets")
	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("plugins.configs.others").luasnip()
		end,
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		config = function()
			require("plugins.configs.nvimtree")
		end,
		setup = function()
			require("core.mappings").nvimtree()
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plugins.configs.telescope")
		end,
		setup = function()
			require("core.mappings").telescope()
		end,
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.configs.others").autopairs()
		end,
	})
end)
