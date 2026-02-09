-- ============================================================================
-- KEYMAPS CONFIGURATION
-- ============================================================================
-- Description: All custom keybindings for Neovim
-- Leader key: , (comma) - defined in config/init.lua
-- ============================================================================

local keymap = vim.keymap

-- ============================================================================
-- WINDOW/SPLIT NAVIGATION
-- ============================================================================
-- Move between splits using <leader>w + direction
keymap.set("n", "<leader>wh", "<C-w>h", { desc = "← Move to left split" })
keymap.set("n", "<leader>wj", "<C-w>j", { desc = "↓ Move to below split" })
keymap.set("n", "<leader>wk", "<C-w>k", { desc = "↑ Move to above split" })
keymap.set("n", "<leader>wl", "<C-w>l", { desc = "→ Move to right split" })

-- ============================================================================
-- CONFIGURATION RELOAD
-- ============================================================================
-- Reload current config file without restarting Neovim
keymap.set("n", "<leader>r", ":so %<CR>", { desc = "🔄 Reload current config file" })

-- ============================================================================
-- TELESCOPE (Fuzzy Finder)
-- ============================================================================
-- Telescope is a highly extendable fuzzy finder
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files, { desc = "🔍 Find files" })
keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "🔍 Live grep (search in files)" })
keymap.set("n", "<leader>fb", builtin.buffers, { desc = "🔍 Find open buffers" })
keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "🔍 Find help tags" })
keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "🔍 Recent files" })

-- ============================================================================
-- FILE EXPLORER (NvimTree)
-- ============================================================================
-- Toggle file tree with <leader>n or Ctrl+T (VSCode-like)
keymap.set("n", "<leader>n", ":NvimTreeFocus<CR>", { desc = "📁 Focus file explorer" })
keymap.set("n", "<leader>nr", ":NvimTreeRefresh<CR>", { desc = "📁 Refresh file explorer" })
keymap.set("n", "<C-t>", ":NvimTreeToggle<CR>", { desc = "📁 Toggle file explorer (Ctrl+T)" })

-- ============================================================================
-- TERMINAL
-- ============================================================================
function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    -- Exit terminal mode with <esc> - returns to normal mode
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
end

-- Auto-apply terminal keybindings when opening a terminal
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Toggle terminal with <leader>tt
keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "💻 Toggle terminal" })

-- ============================================================================
-- VIMWIKI TASKS
-- ============================================================================
-- Move completed tasks (marked with [X]) to done file
keymap.set("n", "<leader>dt", "<CR>:silent !done_tasks.sh<CR>", { desc = "✅ Move done vimwiki tasks" })

-- ============================================================================
-- DASHBOARD
-- ============================================================================
-- Open Alpha dashboard (startup screen)
keymap.set("n", "<leader>al", ":Alpha<CR>", { desc = "🏠 Open Alpha dashboard" })

-- ============================================================================
-- DELETE WITHOUT YANKING (VSCode-like behavior)
-- ============================================================================
-- These mappings use the "black hole" register ("_) so deleted text
-- doesn't overwrite your clipboard. Your clipboard stays unchanged!
-- This mimics VSCode behavior where delete ≠ cut
keymap.set("n", "d", '"_d', { noremap = true, silent = true, desc = "Delete without yanking" })
keymap.set("n", "dd", '"_dd', { noremap = true, silent = true, desc = "Delete line without yanking" })
keymap.set("n", "D", '"_D', { noremap = true, silent = true, desc = "Delete to end of line without yanking" })
keymap.set("v", "d", '"_d', { noremap = true, silent = true, desc = "Delete selection without yanking" })
keymap.set("n", "x", '"_x', { noremap = true, silent = true, desc = "Delete char without yanking" })
keymap.set("n", "X", '"_X', { noremap = true, silent = true, desc = "Delete char before without yanking" })
keymap.set("v", "x", '"_x', { noremap = true, silent = true, desc = "Delete selection without yanking" })

-- Change operations also don't yank (c, cc, C)
keymap.set("n", "c", '"_c', { noremap = true, silent = true, desc = "Change without yanking" })
keymap.set("n", "cc", '"_cc', { noremap = true, silent = true, desc = "Change line without yanking" })
keymap.set("n", "C", '"_C', { noremap = true, silent = true, desc = "Change to end without yanking" })
keymap.set("v", "c", '"_c', { noremap = true, silent = true, desc = "Change selection without yanking" })

-- Use <leader>d if you DO want to cut (delete + yank)
keymap.set("n", "<leader>d", "d", { noremap = true, silent = true, desc = "✂️ Cut (delete + yank)" })
keymap.set("v", "<leader>d", "d", { noremap = true, silent = true, desc = "✂️ Cut selection (delete + yank)" })

-- ============================================================================
-- SPLIT MANAGEMENT
-- ============================================================================
keymap.set("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true, desc = "│ Vertical split" })
keymap.set("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true, desc = "─ Horizontal split" })
keymap.set("n", "<leader>sc", ":close<CR>", { noremap = true, silent = true, desc = "✖ Close current split" })
keymap.set("n", "<leader>so", ":only<CR>", { noremap = true, silent = true, desc = "◉ Close other splits" })

-- ============================================================================
-- SEARCH
-- ============================================================================
-- Clear search highlighting
keymap.set("n", "<leader>cs", ":noh<CR>", { noremap = true, silent = true, desc = "🚫 Clear search highlights" })
keymap.set("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true, desc = "Clear search highlights" })

-- ============================================================================
-- LSP / CODE FORMATTING
-- ============================================================================
keymap.set("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true, desc = "📝 Format buffer (LSP)" })

-- ============================================================================
-- BUFFER/TAB NAVIGATION (Multiple tabs like VSCode)
-- ============================================================================
-- Navigate between buffers (tabs)
keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "→ Next tab" })
keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true, desc = "← Previous tab" })
keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true, desc = "← Previous buffer" })
keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "→ Next buffer" })
keymap.set("n", "<leader>bc", ":bdelete<CR>", { noremap = true, silent = true, desc = "✖ Close current buffer" })
keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true, desc = "✖ Close other buffers" })

-- Go to specific buffer by number (like Ctrl+1, Ctrl+2 in VSCode)
keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true, desc = "Go to buffer 1" })
keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true, desc = "Go to buffer 2" })
keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true, desc = "Go to buffer 3" })
keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true, desc = "Go to buffer 4" })
keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true, desc = "Go to buffer 5" })

-- ============================================================================
-- WHICH-KEY HELP
-- ============================================================================
-- Show all available keymaps
keymap.set("n", "<leader>?", ":WhichKey<CR>", { noremap = true, silent = true, desc = "❓ Show all keymaps" })
