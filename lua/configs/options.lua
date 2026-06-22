vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.colorcolumn = "120"
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 20
vim.opt.mouse = 'a'
vim.opt.linebreak = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.list = true
vim.opt.listchars = {
    -- tab = '»' ,
    trail = '·',
    nbsp = '␣'
}
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.showmode = false
vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Change the prefix (e.g., '●', '■', 'x')
        spacing = 4, -- Add spacing between code and virtual text
        severity_sort = true, -- Sort by severity
    },
})
