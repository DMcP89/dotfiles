-- Set nocompatible
vim.o.compatible = false

-- Colors
vim.cmd('syntax enable')
vim.cmd('colorscheme slate')

-- UI
vim.o.number = false -- line numbers
vim.o.relativenumber = true -- relative line numbers
vim.o.showcmd = true -- show command in bottom bar
vim.o.cursorline = true -- highlight current line
vim.o.wildmenu = true -- visual autocomplete for command menu
vim.o.lazyredraw = true -- redraw only when we need to.
vim.o.showmatch = true -- highlight matching [{()}]
vim.o.incsearch = true -- search as characters are entered
vim.o.hlsearch = true -- highlight matches
vim.o.expandtab = true -- expand tabs into spaces
vim.o.tabstop = 4 -- tabs equal 4 spaces
vim.o.shiftwidth = 4 -- >> or << commands shift lines 4 spaces

vim.cmd('filetype indent on') -- load filetype-specific indent files

