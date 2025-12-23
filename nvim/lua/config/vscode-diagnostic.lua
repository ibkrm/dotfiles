-- VSCode Neovim Diagnostic Script
-- Run this in VSCode with: :luafile lua/config/vscode-diagnostic.lua

print("=== VSCode Neovim Diagnostic ===\n")

-- Check 1: Is VSCode detected?
print("1. VSCode Detection:")
print("   vim.g.vscode = " .. tostring(vim.g.vscode))
if vim.g.vscode then
    print("   ✓ Running in VSCode\n")
else
    print("   ✗ NOT running in VSCode\n")
    return
end

-- Check 2: Can we load the vscode module?
print("2. VSCode Module:")
local vscode_ok, vscode = pcall(require, 'vscode')
if vscode_ok then
    print("   ✓ VSCode module loaded successfully\n")
else
    print("   ✗ Failed to load VSCode module")
    print("   Error: " .. tostring(vscode) .. "\n")
    return
end

-- Check 3: Test a simple VSCode API call
print("3. VSCode API Test:")
local test_ok, test_err = pcall(function()
    vscode.call('workbench.action.quickOpen')
end)
if test_ok then
    print("   ✓ VSCode API call successful (Quick Open should have opened)\n")
else
    print("   ✗ VSCode API call failed")
    print("   Error: " .. tostring(test_err) .. "\n")
end

-- Check 4: Verify leader key
print("4. Leader Key:")
print("   mapleader = " .. (vim.g.mapleader or "not set"))
print("   maplocalleader = " .. (vim.g.maplocalleader or "not set") .. "\n")

-- Check 5: List some keymaps
print("5. Sample Keymaps (checking if they exist):")
local keymaps_to_check = {
    { mode = 'n', lhs = '<leader>sf', desc = 'Search Files' },
    { mode = 'n', lhs = 'gd',         desc = 'Go to Definition' },
    { mode = 'n', lhs = '<leader>f',  desc = 'Format' },
}

for _, km in ipairs(keymaps_to_check) do
    local maps = vim.api.nvim_get_keymap(km.mode)
    local found = false
    for _, map in ipairs(maps) do
        if map.lhs == km.lhs then
            found = true
            break
        end
    end
    if found then
        print("   ✓ " .. km.lhs .. " (" .. km.desc .. ")")
    else
        print("   ✗ " .. km.lhs .. " (" .. km.desc .. ") - NOT FOUND")
    end
end

print("\n6. Core Modules Loaded:")
local core_modules = { 'core.options', 'core.keymaps', 'core.autocmds' }
for _, mod in ipairs(core_modules) do
    local ok = pcall(require, mod)
    if ok then
        print("   ✓ " .. mod)
    else
        print("   ✗ " .. mod .. " - FAILED")
    end
end

print("\n7. Config Module:")
local config_ok = pcall(require, 'config.vscode')
if config_ok then
    print("   ✓ config.vscode loaded\n")
else
    print("   ✗ config.vscode FAILED to load\n")
end

print("=== Diagnostic Complete ===")
print("\nTo test a keymap manually, try:")
print("  :lua require('vscode').call('workbench.action.quickOpen')")
