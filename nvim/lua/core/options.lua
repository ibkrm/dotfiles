-- [[ Setting options ]]
-- See `:help vim.o`

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- Make line numbers default
vim.o.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Options that work in both environments
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.timeoutlen = 300
vim.o.scrolloff = 10

-- Options that only work in regular Neovim
if not vim.g.vscode then
    vim.o.showmode = false
    vim.o.undofile = true
    vim.o.signcolumn = 'yes'
    vim.o.updatetime = 250
    vim.o.splitright = true
    vim.o.splitbelow = true
    vim.o.list = true
    vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
    vim.o.inccommand = 'split'
    vim.o.cursorline = true
    vim.o.confirm = true
end
