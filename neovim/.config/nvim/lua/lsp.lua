vim.lsp.config['clangd'] = {
    cmd = { 'clangd', '--compile-commands-dir=build' },
    filetypes = { 'c', 'cpp' },
    root_markers = { 'CMakeLists.txt', 'compile_commands.json', '.git' },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

vim.lsp.config['hls'] = {
    cmd = { 'haskell-language-server-wrapper', '--lsp' },
    filetypes = { 'haskell', 'lhaskell' },
    root_markers = { '*.cabel', 'cabal.project', '.git' },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

vim.lsp.config['luals'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true)
            }
        }
    }
}

vim.lsp.config['pyright'] = {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    root_markers = { 'toml', '.git' },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

vim.lsp.config['tsserver'] = {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact'
    },
    root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
    single_file_support = true,
}

vim.lsp.config['gopls'] = {
    cmd = { 'gopls' },
    filetypes = { 'go' },
    root_markers = { 'go.work', 'go.mod', '.git' },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

vim.lsp.config['rust-analyzer'] = {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml', 'Cargo.lock', '.git' },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

vim.lsp.enable('clangd')
vim.lsp.enable('hls')
vim.lsp.enable('luals')
vim.lsp.enable('pyright')
vim.lsp.enable('tsserver')
vim.lsp.enable('gopls')
vim.lsp.enable('rust-analyzer')
