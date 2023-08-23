vim.g.mapleader = " "

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.spell = true

vim.g.mapleader = " "

function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

Map("n", "j", "gj")
Map("n", "k", "gk")
Map("n", "<up>", "gk")
Map("n", "<down>", "gj")

