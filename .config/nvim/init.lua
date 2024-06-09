-- Set nocompatible
vim.o.compatible = false
-- Plugins

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('tpope/vim-fugitive')
Plug('fatih/vim-go')
Plug('preservim/nerdtree')
Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })
Plug('ap/vim-buftabline')

vim.call('plug#end')

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

-- Buffer Management
vim.cmd('nnoremap <C-L> :bnext<CR>')
vim.cmd('nnoremap <C-H> :bprev<CR>')
vim.cmd('nnoremap <C-x> :bd<CR>')

-- Toggle serach highlight
vim.cmd('nnoremap <Leader>h :nohlsearch<CR>')

-- Folding Settings
vim.o.foldenable = true   --enable folding
vim.o.foldlevelstart = 10   --open most folds by default
vim.o.foldnestmax = 10      -- 10 nested fold max
vim.ofoldmethod = indent
-- space open/closes folds
vim.cmd('nnoremap <space> za')

-- Search and Replace
vim.cmd('nnoremap <Leader>R :%s/<C-r><C-w>//g<Left><Left>')

 
-- Auto close brackets
vim.cmd('inoremap { {}<Esc>ha')
vim.cmd('inoremap ( ()<Esc>ha')
vim.cmd('inoremap [ []<Esc>ha')
vim.cmd('inoremap " ""<Esc>ha')
vim.cmd("inoremap ' ''<Esc>ha")
vim.cmd('inoremap ` ``<Esc>ha')


-- disable arrow keys
vim.cmd('noremap <Up> <Nop>')
vim.cmd('noremap <Down> <Nop>')
vim.cmd('noremap <Left> <Nop>')
vim.cmd('noremap <Right> <Nop>')

-- Plugin keymappings

-- NERDTree
vim.cmd('autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif')
vim.cmd('map <C-n> :NERDTreeToggle<CR>')
vim.cmd('let NERDTreeMapOpenInTab="\r"')

-- FZF
vim.cmd('nnoremap <Leader>f :FZF<CR>')

-- Fugitive
vim.cmd('nnoremap <Leader>d :Gvdiffsplit')

-- vim-go
-- Go syntax highlighting
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_operators = 1

-- formatting and importing
vim.g.go_fmt_autosave = 1
vim.g.go_fmt_command = "goimports"

-- Status line types/signatures
vim.g.go_auto_type_info = 1

vim.cmd('autocmd FileType go nmap <leader>r  <Plug>(go-run)')
vim.cmd('autocmd FileType go nmap <leader>t  <Plug>(go-test)')
vim.cmd('autocmd FileType go nmap <leader>b  <Plug>(go-build)')

vim.cmd('au filetype go inoremap <buffer> . .<C-x><C-o>')

-- QOL Fixes
vim.o.completeopt=longest,menuone
vim.cmd("inoremap <expr> <CR> pumvisible() ? '<C-y>' : '<C-g>u<CR>'")

