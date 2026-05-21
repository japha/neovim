require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install {'c', 'cpp', 'lua', 'toml', 'python'}
vim.api.nvim_create_autocmd('FileType', {
    pattern = { '<filetype>' },
    callback = function() vim.treesitter.start() end,
})


