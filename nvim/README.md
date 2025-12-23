# Kickstart.nvim - Modular Configuration

This is a modular version of kickstart.nvim that works seamlessly in both **regular Neovim** and **VSCode with the vscode-neovim extension**.

## 📁 Project Structure

```
kickstart.nvim/
├── init.lua                    # Main entry point (minimal routing logic)
├── lua/
│   ├── core/                   # Shared configuration (works everywhere)
│   │   ├── options.lua         # Vim options (numbers, clipboard, etc.)
│   │   ├── keymaps.lua         # Basic keymaps (jk/kj, window nav, etc.)
│   │   └── autocmds.lua        # Autocommands (highlight on yank, etc.)
│   │
│   ├── config/                 # Environment-specific configuration
│   │   ├── neovim.lua          # Full Neovim setup (plugins, LSP, etc.)
│   │   └── vscode.lua          # VSCode integration (keymaps using VSCode API)
│   │
│   ├── custom/                 # Your custom plugins
│   │   └── plugins/
│   │       └── init.lua
│   │
│   └── kickstart/              # Optional kickstart plugins
│       ├── health.lua
│       └── plugins/
│           ├── debug.lua
│           ├── lint.lua
│           ├── autopairs.lua
│           └── ...
```

## 🚀 How It Works

### Entry Point: `init.lua`

The main `init.lua` file is now **~150 lines** (down from 1000+) and simply:
1. Sets leader keys
2. Detects if running in VSCode (`vim.g.vscode`)
3. Loads shared core configuration
4. Loads environment-specific configuration

### Shared Core Modules

These modules work in **both** Neovim and VSCode:

- **`core/options.lua`** - Vim settings (line numbers, clipboard, search behavior, splits, etc.)
- **`core/keymaps.lua`** - Basic keymaps (escape alternatives, window navigation, terminal mode)
- **`core/autocmds.lua`** - Autocommands (highlight on yank, etc.)

### Environment-Specific Configurations

#### Regular Neovim: `config/neovim.lua`

Loaded when running in regular Neovim. Includes:
- **Plugin Manager**: lazy.nvim bootstrap and setup
- **Plugins**:
  - `telescope.nvim` - Fuzzy finder
  - `nvim-lspconfig` - LSP configuration
  - `mason.nvim` - LSP installer
  - `blink.cmp` - Autocompletion
  - `conform.nvim` - Formatting
  - `gitsigns.nvim` - Git integration
  - `which-key.nvim` - Keybind helper
  - `tokyonight.nvim` - Colorscheme
  - `mini.nvim` - Mini plugins (statusline, surround, etc.)
  - `nvim-treesitter` - Syntax highlighting
  - And more!

#### VSCode: `config/vscode.lua`

Loaded when running with vscode-neovim extension. Provides keymaps that integrate with VSCode's API:

**File & Project Navigation:**
- `<leader>sf` - Quick Open (file finder)
- `<leader>sg` - Find in Files
- `<leader>ss` - Command Palette
- `<leader>sd` - Show All Symbols
- `<leader>sr` - Recent Files

**LSP & Code Navigation:**
- `gd` - Go to Definition
- `grd` - Go to Definition (split)
- `grt` - Go to Type Definition
- `gri` - Go to Implementation
- `grr` - Go to References
- `grD` - Go to Declaration

**Code Actions:**
- `grn` - Rename Symbol
- `gra` - Code Action
- `<leader>f` - Format Document
- `<leader>o` - Organize Imports

**Diagnostics:**
- `]d` / `[d` - Next/Previous Diagnostic
- `<leader>xx` - Show Problems Panel

**Git Integration:**
- `<leader>gg` - Git View
- `<leader>ga` - Git Add
- `<leader>gc` - Git Commit
- `<leader>gd` - Git Diff
- `]c` / `[c` - Next/Previous Change

**Comments:**
- `gcc` - Toggle Line Comment
- `gc` (visual) - Toggle Comment

## 🛠️ Setup Instructions

### For Regular Neovim

1. Clone or copy this configuration:
   ```bash
   git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim
   ```

2. Start Neovim:
   ```bash
   nvim
   ```

3. Lazy.nvim will automatically install all plugins on first launch

4. Run health check:
   ```vim
   :checkhealth
   ```

### For VSCode Neovim

1. Install the [vscode-neovim extension](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)

2. In VSCode settings (`settings.json`), configure the path:
   ```json
   {
     "vscode-neovim.neovimInitVimPaths.darwin": "/path/to/kickstart.nvim/init.lua",
     "vscode-neovim.neovimInitVimPaths.linux": "/path/to/kickstart.nvim/init.lua",
     "vscode-neovim.neovimInitVimPaths.win32": "C:\\path\\to\\kickstart.nvim\\init.lua"
   }
   ```

3. Reload VSCode - your keymaps will now work!

## ✏️ Customization Guide

### Modify Shared Settings

Edit files in `lua/core/`:
- **Options**: `lua/core/options.lua` - Change vim settings
- **Keymaps**: `lua/core/keymaps.lua` - Add/modify basic keymaps
- **Autocmds**: `lua/core/autocmds.lua` - Add autocommands

### Customize Neovim Plugins

Edit `lua/config/neovim.lua`:
- Add/remove plugins in the `require('lazy').setup({})` table
- Modify LSP servers in the `servers` table
- Change colorscheme
- Configure plugin options

### Customize VSCode Keymaps

Edit `lua/config/vscode.lua`:
- Add new keymaps using `vscode.call('command.name')`
- Find VSCode command IDs in Command Palette (F1 → "Developer: Show Commands")

### Add Your Own Plugins

Option 1: Edit `lua/custom/plugins/init.lua`
```lua
return {
  { 'author/plugin-name', opts = {} },
  -- Add more plugins here
}
```

Option 2: Create separate files in `lua/custom/plugins/`
```lua
-- lua/custom/plugins/my-plugin.lua
return {
  'author/my-plugin',
  config = function()
    require('my-plugin').setup({})
  end,
}
```

Then in `neovim.lua`, add to the lazy.setup:
```lua
{ import = 'custom.plugins' }
```

## 🔍 Why Modular?

### Benefits

✅ **Separation of Concerns**: Each file has a single, clear purpose  
✅ **Easier Maintenance**: Changes to VSCode config don't affect Neovim plugins  
✅ **Better Organization**: Find what you need quickly  
✅ **No Duplication**: Shared settings live in one place  
✅ **VSCode Compatible**: Works seamlessly with vscode-neovim  
✅ **Scalable**: Easy to add new modules as your config grows  

### Compared to Single-File Config

| Aspect | Single File | Modular |
|--------|-------------|---------|
| **Size** | 1000+ lines | ~150 line entry + modules |
| **Navigation** | Lots of scrolling | Jump to specific file |
| **VSCode Support** | Lots of `if vscode` checks | Separate file |
| **Maintenance** | Change one thing, read everything | Edit only what you need |
| **Learning** | Read 1000 lines top-to-bottom | Read modularly as needed |

## 📚 File Descriptions

| File | Lines | Purpose |
|------|-------|---------|
| `init.lua` | ~150 | Entry point, routing logic |
| `lua/core/options.lua` | ~75 | Vim options |
| `lua/core/keymaps.lua` | ~40 | Basic keymaps |
| `lua/core/autocmds.lua` | ~12 | Autocommands |
| `lua/config/neovim.lua` | ~800 | Full Neovim plugin config |
| `lua/config/vscode.lua` | ~200 | VSCode integration |

## 🎯 Common Tasks

### Update Plugins (Neovim)
```vim
:Lazy update
```

### Add a New LSP Server

Edit `lua/config/neovim.lua`, find the `servers` table:
```lua
local servers = {
  lua_ls = { ... },
  -- Add your server here
  ts_ls = {},
  pyright = {},
  rust_analyzer = {},
}
```

### Change Colorscheme

Edit `lua/config/neovim.lua`, find the tokyonight plugin:
```lua
{ 'folke/tokyonight.nvim',
  config = function()
    vim.cmd.colorscheme 'tokyonight-night'  -- Change this
  end,
}
```

### Add VSCode Keybind

Edit `lua/config/vscode.lua`:
```lua
vim.keymap.set('n', '<leader>new', function()
  vscode.call('workbench.action.commandId')
end, { desc = 'Description' })
```

## 🐛 Troubleshooting

### Neovim not loading plugins
```vim
:checkhealth lazy
```

### VSCode not recognizing keymaps
1. Check VSCode settings point to correct `init.lua`
2. Reload VSCode window
3. Check Neovim extension output panel for errors

### Syntax errors
```bash
nvim --headless -c "lua require('config.neovim')" -c "qall"
```

## 📖 Further Reading

- [Neovim Documentation](https://neovim.io/doc/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [vscode-neovim](https://github.com/vscode-neovim/vscode-neovim)
- [LSP Configuration](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

---

**Happy Vimming!** 🎉
