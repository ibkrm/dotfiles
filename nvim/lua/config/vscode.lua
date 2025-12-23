-- [[ VSCode Neovim Configuration ]]
-- This configuration is loaded when running inside VSCode with vscode-neovim extension
-- VSCode handles LSP, completion, syntax highlighting, and most UI features
-- We only configure keymaps that integrate with VSCode's API

-- Safely require the vscode module
local vscode_ok, vscode = pcall(require, 'vscode')
if not vscode_ok then
    vim.notify('VSCode module not found! Make sure vscode-neovim extension is installed and enabled.',
        vim.log.levels.ERROR)
    return
end

-- Notify that VSCode config is loaded (for debugging)
vim.notify('VSCode Neovim config loaded successfully!', vim.log.levels.INFO)

-- [[ File and Project Navigation ]]

-- File navigation using VSCode's fuzzy finder
vim.keymap.set('n', '<leader>sf', function()
    vscode.call('workbench.action.quickOpen')
end, { desc = '[S]earch [F]iles' })

-- Search in files using VSCode's search
vim.keymap.set('n', '<leader>sg', function()
    vscode.call('workbench.action.findInFiles')
end, { desc = '[S]earch by [G]rep' })

-- Show command palette
vim.keymap.set('n', '<leader>ss', function()
    vscode.call('workbench.action.showCommands')
end, { desc = '[S]earch [S]elect (Command Palette)' })

-- Symbol navigation
vim.keymap.set('n', '<leader>sd', function()
    vscode.call('workbench.action.showAllSymbols')
end, { desc = '[S]earch [D]ocument symbols' })

-- Recent files
vim.keymap.set('n', '<leader>sr', function()
    vscode.call('workbench.action.openRecent')
end, { desc = '[S]earch [R]ecent files' })


-- Find in current buffer
vim.keymap.set('n', '<leader>/', function()
    vscode.call('actions.find')
end, { desc = '[/] Find in current buffer' })

-- [[ LSP and Code Navigation ]]

-- Go to definition (use VSCode's implementation)
vim.keymap.set('n', 'gd', function()
    vscode.call('editor.action.revealDefinition')
end, { desc = '[G]oto [D]efinition' })

-- Go to definition in split
vim.keymap.set('n', 'grd', function()
    vscode.call('editor.action.revealDefinitionAside')
end, { desc = '[G]oto [D]efinition (split)' })

-- Go to type definition
vim.keymap.set('n', 'grt', function()
    vscode.call('editor.action.goToTypeDefinition')
end, { desc = '[G]oto [T]ype definition' })

-- Go to implementation
vim.keymap.set('n', 'gri', function()
    vscode.call('editor.action.goToImplementation')
end, { desc = '[G]oto [I]mplementation' })

-- Go to references
vim.keymap.set('n', 'grr', function()
    vscode.call('editor.action.goToReferences')
end, { desc = '[G]oto [R]eferences' })

-- Go to declaration
vim.keymap.set('n', 'grD', function()
    vscode.call('editor.action.goToDeclaration')
end, { desc = '[G]oto [D]eclaration' })

-- [[ Code Actions and Refactoring ]]

-- Rename symbol
vim.keymap.set('n', 'grn', function()
    vscode.call('editor.action.rename')
end, { desc = '[R]e[n]ame' })

-- Code actions
vim.keymap.set('n', 'gra', function()
    vscode.call('editor.action.quickFix')
end, { desc = '[G]oto Code [A]ction' })

vim.keymap.set('v', 'gra', function()
    vscode.call('editor.action.quickFix')
end, { desc = '[G]oto Code [A]ction' })

-- Format document
vim.keymap.set('n', '<leader>f', function()
    vscode.call('editor.action.formatDocument')
end, { desc = '[F]ormat document' })

-- Format selection
vim.keymap.set('v', '<leader>f', function()
    vscode.call('editor.action.formatSelection')
end, { desc = '[F]ormat selection' })

-- Organize imports
vim.keymap.set('n', '<leader>o', function()
    vscode.call('editor.action.organizeImports')
end, { desc = '[O]rganize imports' })

-- [[ Documentation and Help ]]

-- Show hover information
vim.keymap.set('n', 'K', function()
    vscode.call('editor.action.showHover')
end, { desc = 'Show hover information' })

-- Show signature help
vim.keymap.set('i', '<C-k>', function()
    vscode.call('editor.action.triggerParameterHints')
end, { desc = 'Signature help' })

-- [[ Diagnostics ]]

-- Show problems panel
vim.keymap.set('n', '<leader>xx', function()
    vscode.call('workbench.actions.view.problems')
end, { desc = 'Show problems' })

-- Go to next diagnostic
vim.keymap.set('n', ']d', function()
    vscode.call('editor.action.marker.next')
end, { desc = 'Next diagnostic' })

-- Go to previous diagnostic
vim.keymap.set('n', '[d', function()
    vscode.call('editor.action.marker.prev')
end, { desc = 'Previous diagnostic' })

-- [[ Editor Management ]]

-- Split editor right
vim.keymap.set('n', '<leader>v', function()
    vscode.call('workbench.action.splitEditorRight')
end, { desc = 'Split editor [V]ertically' })

-- Split editor down
vim.keymap.set('n', '<leader>s', function()
    vscode.call('workbench.action.splitEditorDown')
end, { desc = '[S]plit editor horizontally' })

-- Close editor
vim.keymap.set('n', '<leader>c', function()
    vscode.call('workbench.action.closeActiveEditor')
end, { desc = '[C]lose editor' })

-- [[ Sidebar and Panels ]]

-- Toggle sidebar
vim.keymap.set('n', '<leader>e', function()
    vscode.call('workbench.action.toggleSidebarVisibility')
end, { desc = 'Toggle [E]xplorer' })

-- Toggle terminal
vim.keymap.set('n', '<leader>tt', function()
    vscode.call('workbench.action.terminal.toggleTerminal')
end, { desc = '[T]oggle [T]erminal' })

-- [[ Git Integration ]]

-- Show source control
vim.keymap.set('n', '<leader>gg', function()
    vscode.call('workbench.view.scm')
end, { desc = '[G]it view' })

-- Stage current file
vim.keymap.set('n', '<leader>ga', function()
    vscode.call('git.stage')
end, { desc = '[G]it [A]dd file' })

-- Commit
vim.keymap.set('n', '<leader>gc', function()
    vscode.call('git.commit')
end, { desc = '[G]it [C]ommit' })

-- Show Git changes
vim.keymap.set('n', '<leader>gd', function()
    vscode.call('git.openChange')
end, { desc = '[G]it [D]iff' })

-- Next change
vim.keymap.set('n', ']c', function()
    vscode.call('workbench.action.editor.nextChange')
end, { desc = 'Next change' })

-- Previous change
vim.keymap.set('n', '[c', function()
    vscode.call('workbench.action.editor.previousChange')
end, { desc = 'Previous change' })


-- [[ Comments ]]

-- Toggle line comment
vim.keymap.set('n', 'gcc', function()
    vscode.call('editor.action.commentLine')
end, { desc = 'Toggle comment' })

vim.keymap.set('v', 'gc', function()
    vscode.call('editor.action.commentLine')
end, { desc = 'Toggle comment' })
