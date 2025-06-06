return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = require("configs.conform"),
	},

	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("configs.nvimtree")
		end,
	},
	{
		"stevearc/dressing.nvim",
		lazy = false,
		opts = {},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"html-lsp",
				"css-lsp",
				"prettier",
				"gopls",
				"pyright",
				"marksman",
				"tinymist",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"html",
				"css",
				"go",
				"python",
				"markdown",
				"typst",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
}
