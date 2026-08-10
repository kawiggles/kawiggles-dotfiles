vim.g.mapleader = " "

vim.keymap.set('n', '<leader>ff', function()
    local root = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1])
    if root then
        require('telescope.builtin').find_files({ cwd = root })
    else
        require('telescope.builtin').find_files()
    end
end)
vim.keymap.set('n', '<leader>fg', function()
    local root = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1])
    if root then
        require('telescope.builtin').live_grep({ cwd = root })
    else
        require('telescope.builtin').live_grep()
    end
end)

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader><space>', 'i<Space><Esc>', {noremap = true})
vim.keymap.set('n', '<leader>i', function()
    local char = vim.fn.nr2char(vim.fn.getchar())
    vim.api.nvim_feedkeys('i' .. char .. '\27', 'n', false)
end, {noremap = true})
vim.keymap.set('n', '<leader>o', 'o<Esc>')
vim.keymap.set('n', '<leader>O', 'O<Esc>')
