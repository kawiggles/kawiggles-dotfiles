vim.g.mapleader = " "
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>ff', function()
    require('telescope.builtin').find_files()
end)
vim.keymap.set('n', '<leader>fg', function()
    require('telescope.builtin').live_grep()
end)
vim.keymap.set('n', '<leader>r', ':%s/<C-r><C-w>/')

--- These are for not having to enter insert mode for newlines and single characters
vim.keymap.set('n', '<leader><space>', 'i<Space><Esc>', {noremap = true})
vim.keymap.set('n', '<leader>i', function()
    local char = vim.fn.nr2char(vim.fn.getchar())
    vim.api.nvim_feedkeys('i' .. char .. '\27', 'n', false)
end, {noremap = true})
vim.keymap.set('n', '<leader>o', 'o<Esc>')
vim.keymap.set('n', '<leader>O', 'O<Esc>')
