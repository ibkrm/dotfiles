" ----------------------------------------------------------------------------
" Obsidian Vimrc Configuration
" ----------------------------------------------------------------------------
" This file is for the 'Vimrc Support' community plugin in Obsidian.
" Not all Vim commands are supported.

" ----------------------------------------------------------------------------
" Key Mappings
" ----------------------------------------------------------------------------

" Quick escape from insert mode
imap jk <Esc>
imap kj <Esc>

" Clear search highlight
" Note: Obsidian's Vim mode might handle this differently. This is the standard Vim way.
nmap <Esc> :nohl

" Window navigation with Ctrl + hjkl
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Set leader key to Space
let mapleader = " "

" --- Leader Key Mappings ---
" These mappings use the leader key. For example, press 'Space' then 'w' to save.

" Save current file
nmap <leader>w :w

" Close current pane (split)
nmap <leader>q :q

" Split management
nmap <leader>sv :vsplit
nmap <leader>sh :split

" Tab/File navigation
" Use 'gt' and 'gT' to switch between tabs
nmap <S-L> gt
nmap <S-H> gT
