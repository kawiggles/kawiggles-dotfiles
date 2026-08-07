local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(require('plugins'))
require('lsp')
require('keymaps')
require('theme')

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.colorcolumn = "100"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "gitcommit" },
    callback = function ()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_us"
    end,
})
