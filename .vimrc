syntax enable
filetype plugin indent on
set autoindent
filetype plugin on
set nocp
set modelines=0

set mouse=a
set wrap

set matchpairs+=<:>

set number

set hlsearch

filetype plugin indent on

" PLUGIN STUFF
"

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'itchyny/lightline.vim'

Plugin 'PotatoesMaster/i3-vim-syntax'

Bundle 'edkolev/tmuxline.vim'

Plugin 'ap/vim-css-color'

Plugin 'vim-python/python-syntax'

Plugin 'frazrepo/vim-rainbow'

Plugin 'preservim/nerdtree'

Plugin 'valloric/youcompleteme'

Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'sheerun/vim-polyglot'

Plugin 'dracula/vim',{'name':'dracula'}


" All of your Plugins must be added before the following line
call vundle#end() " required

set t_Co=256

let g:lightline = {
      \ 'colorscheme': 'OldHope'
      \ }

set laststatus=2
set noshowmode

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

map <C-n> :NERDTreeToggle<CR>

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

autocmd BufNewFile,BufRead config set syntax=dosini


" C++ Highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_class_dec1_highlight = 1
let g:cpp_member_variable_highlight = 1

let g:polyglot_disable = ['c/c++', 'c++11']

