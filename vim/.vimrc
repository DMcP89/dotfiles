" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'preservim/nerdtree'
Plugin 'ap/vim-buftabline'
Plugin 'pylint.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'junegunn/fzf'

Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" Configs

" NerdTree
" Close vim if only window left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open NerdTree with Crtl-N
map <C-n> :NERDTreeToggle<CR>
" Open files in new tab
let NERDTreeMapOpenInTab='\r'

" FZF
nnoremap <Leader>f :FZF<CR>

" Colors
colorscheme badwolf 
syntax enable

" UI
""set number 		" line numbers
set rnu             " relative line numbers
set showcmd 		" show command in bottom bar
set cursorline 		" highlight current line
filetype indent on 	" load filetype-specific indent files
set wildmenu 		" visual autocomplete for command menu
set lazyredraw 		" redraw only when we need to.
set showmatch  		" highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set expandtab 		" expand stabs into spaces
set ts=4                " tabs equal 4 spaces
set shiftwidth=4        " >> or << commands shift lines 4 spaces

" turn off search highlight
nnoremap <Leader>h :nohlsearch<CR>

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent
" space open/closes folds
nnoremap <space> za

" Buffer Navigation
set hidden
nnoremap <C-L> :bnext<CR>
nnoremap <C-H> :bprev<CR>
nnoremap <C-x> :bd<CR>

" Powerline
set laststatus=2

" Search and replace
nnoremap <Leader>s :%s/<C-r><C-w>//g<Left><Left>

" Save from insert mode
inoremap <F3> <c-o>:w<cr>


" Auto close brackets
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" fugitive mappings
nnoremap <Leader>d :Gvdiffsplit


" vim-go configs
" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)

au filetype go inoremap <buffer> . .<C-x><C-o>

" Auto complete QOL fixes
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
