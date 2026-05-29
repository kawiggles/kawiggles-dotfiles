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
        config = function()
            vim.treesitter.language.register('c', 'c')
            vim.treesitter.language.register('cpp', 'cpp')
            vim.treesitter.language.register('c_sharp', 'c_sharp')
            vim.treesitter.language.register('haskell', 'haskell')
            vim.treesitter.language.register('python', 'python')
        end,
    },

    { 'catppuccin/nvim', name = 'catppuccin' },

    { "EdenEast/nightfox.nvim", name = 'nightfox' },

    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.background = 'dark'
            vim.g.gruvbox_material_background = 'hard'
        end
    },

    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' },
        },
    },

    {
        'kevinhwang91/nvim-ufo',
        dependencies = { 'kevinhwang91/promise-async' },
        event = 'BufReadPost',
        opts = {
            provider_selector = function(bufnr, filetype, buftype)
                return { 'treesitter', 'indent' }
            end,
        },
        init = function()
            vim.o.foldcolumn = '1'
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
        end,
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        ---@module 'ibl'
        ---@type ibl.config
        opts = {},
    },

    { 'sindrets/diffview.nvim' },

    {
        'David-Kunz/gen.nvim',
        opts = {
            model = 'qwen3.6:35-a3b',
            quit_map = 'q',
            accept_map = '<c-cr>',
            host = 'localhost',
            port = '11343',
            display_mode = 'horizontal-split',
            show_model = 'true',
            command = function(options)
                local body = {model = options.model, stream = true}
                return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
            end,
        },
    }

}
