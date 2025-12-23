" ----------------------------------------------------------------------------
" VIMRC Configuration
" ----------------------------------------------------------------------------
" Generated based on your nvim and zed configurations.

" ----------------------------------------------------------------------------
" Basic Settings
" ----------------------------------------------------------------------------
set nocompatible            " Use Vim settings, not Vi defaults
filetype plugin indent on   " Enable filetype detection, plugins, and indentation
syntax on                   " Enable syntax highlighting

" ----------------------------------------------------------------------------
" Appearance
" ----------------------------------------------------------------------------
set number                  " Show line numbers
set cursorline              " Highlight the current line
set showmode                " Show the current mode
set scrolloff=10              " Keep 10 lines of context around the cursor
set splitright              " Open new vertical splits to the right
set splitbelow              " Open new horizontal splits to the below

" Attempt to set a dark background. For a light theme, change to 'light'.
" This helps some colorschemes determine which colors to use.
set background=dark

" ----------------------------------------------------------------------------
" Behavior
" ----------------------------------------------------------------------------
set mouse=a                 " Enable mouse support in all modes
set clipboard=unnamedplus   " Use the system clipboard
set ignorecase              " Ignore case when searching
set smartcase               " Make search case-sensitive if it contains uppercase letters
set timeoutlen=300            " Faster timeout for key sequences
set undofile                " Persist undo history
set confirm                 " Ask for confirmation when closing an unsaved file

" ----------------------------------------------------------------------------
" Indentation
" ----------------------------------------------------------------------------
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab               " Use spaces instead of tabs

" ----------------------------------------------------------------------------
" Key Mappings
" ----------------------------------------------------------------------------

" Set the leader key to Space
let mapleader = " "

" Quick escape from insert mode
inoremap jk <Esc>
inoremap kj <Esc>

" Clear search highlight with <Esc>
nnoremap <Esc> :nohlsearch<CR>

" Window navigation with Ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Split creation
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

" File finder (requires a fuzzy finder plugin like fzf)
" To make this work, you need to install fzf and fzf.vim plugin.
" See: https://github.com/junegunn/fzf
nnoremap <leader>ff :FZF<CR>

" Save and close
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" ----------------------------------------------------------------------------
" Plugin Management (Example with vim-plug)
" ----------------------------------------------------------------------------
" To use plugins, you need a plugin manager. vim-plug is a popular choice.
" 1. Install vim-plug: https://github.com/junegunn/vim-plug
" 2. Add Plug 'user/repo' lines for your plugins
" 3. Run :PlugInstall in Vim

" Example:
" call plug#begin('~/.vim/plugged')
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" call plug#end()

" If you use a colorscheme, you would add it here, e.g.:
" Plug 'dracula/vim'
" ... and after call plug#end():
" colorscheme dracula
