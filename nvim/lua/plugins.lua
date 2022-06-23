local fn = vim.fn
local Plug = fn['plug#']

local plugged_path = fn.stdpath('data') .. "/plugged"

vim.call('plug#begin', plugged_path)
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter'
    --Plug 'ray-x/go.nvim'
    Plug 'gruvbox-community/gruvbox'
vim.call('plug#end')

-- setting up golang
-- require("go").setup()

--**UNCOMMENT BELOW FOR 'GRUVBOX' COLOR-SCHEME**
vim.cmd([[colorscheme gruvbox]])
