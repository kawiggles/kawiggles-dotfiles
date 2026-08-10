return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local luasnip = require('luasnip')
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
            })
        end,
    },

	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
	},

	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		---@module 'ibl'
		---@type ibl.config
		opts = {},
	},

	{
	   "mason-org/mason.nvim",
	   opts = {
		   ui = {
			   icons = {
				   package_installed = "✓",
				   package_pending = "➜",
				   package_uninstalled = "✗",
			   },
		   },
	   },
	},

	{ 
		'sainnhe/everforest',
		config = function()
			vim.g.everforest_enable_italic = true
			vim.cmd.colorscheme('everforest')
		end
	},

	{
		'sphamba/smear-cursor.nvim',
		opts = {},
	},
}
