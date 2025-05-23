# Neovim + Tmux Fullstack & ML Setup

This setup provides a fully functional Neovim and tmux configuration tailored for:
- Fullstack development (React, TypeScript, HTML, CSS)
- Flutter development with `fvm`
- Python & ML workflows

---

## 🧱 Features

### Neovim
- Plugin manager: `packer.nvim`
- LSP support via `mason`, `lspconfig`
- Autocomplete with `nvim-cmp`
- Flutter tools integration
- Treesitter highlighting
- Telescope fuzzy finding
- File explorer with `NvimTree`
- Custom keybindings (see below)
- Theme: `tokyonight.nvim` + Nerd Font (FiraCode)

### Tmux
- Prefix: `Ctrl + Space`
- Grid layouts:
  - `Alt-Space-4` → 4x4 grid
  - `Alt-Space-3` → 1 top, 3x3 bottom
  - `Alt-Space-2` → 1 left, 1 right (top/bottom)
- Pane navigation: `Alt + ←/→/↑/↓`

---

## ⚙️ Setup Instructions

```bash
# 1. Clone this repository and cd into it
git clone https://github.com/praisegeek/dotfiles.git

# 2. Make install script executable and run it
chmod +x install.sh
./install.sh
````

This will:

* Install required packages (Neovim, tmux, node, etc.)
* Set up `packer.nvim` for plugin management
* Clone the full config to `~/.config/nvim` and `~/.config/tmux/tmux.conf` (tmux ^3.2)
* Setup Nerd Font recommendation

---

## 🔑 Key Bindings

### Neovim

| Action               | Keybinding                  |
| -------------------- | --------------------------- |
| Code Action          | `Ctrl + Space + ca`         |
| Go to Definition     | `gd`                        |
| Go to References     | `gi`                        |
| Find Files           | `Space + ff`                |
| New File (NvimTree)  | `fa`                        |
| Filter Search (Tree) | `fs`                        |
| Pane Navigation      | `Ctrl + Space + Arrow Keys` |

### Tmux

| Action              | Keybinding          |
| ------------------- | ------------------- |
| Grid Layout 4x4     | `Ctrl + Space + t4` |
| Grid Layout 1 + 3x3 | `Ctrl + Space + t3` |
| Grid Layout 1x2     | `Ctrl + Space + t2` |

---

## 🎨 Fonts & Theme
Uses `tokyonight.nvim` for a clean dev look. Make sure Nerd Fonts are installed for icons!

* **Font:** [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)
* **Theme:** `tokyonight.nvim` added by install script
* **Terminal:** Use a Nerd Font–compatible terminal like Alacritty, Kitty, or iTerm2.

---

## 🧪 Supported Languages

* Python (ML, data science)
* Dart/Flutter (via `fvm`)
* JavaScript/TypeScript (React, Next.js)
* HTML/CSS

```
