local Plug = vim.fn['plug#']

vim.call('plug#begin','~/.vim/plugged')
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'gruvbox-community/gruvbox'
    Plug 'preservim/nerdtree'
    Plug 'voldikss/vim-floaterm'
vim.call('plug#end')

--**UNCOMMENT BELOW FOR 'GRUVBOX' COLOR-SCHEME**
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[colorscheme gruvbox]])