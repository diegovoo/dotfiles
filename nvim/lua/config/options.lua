-- ============================================================================
-- NEOVIM OPTIONS CONFIGURATION
-- ============================================================================
-- Description: Core Neovim settings and behaviors
-- This file sets up the fundamental editing experience
-- ============================================================================

local cmd = vim.cmd
local opt = vim.opt

-- Global variables
local g = vim.g
local s = vim.s
local indent = 4  -- Default indentation width (4 spaces)


vim.g.loaded_ftplugin = 1
vim.cmd("filetype indent on")

-- ============================================================================
-- CLIPBOARD SETTINGS
-- ============================================================================
-- Use system clipboard for all yank/paste operations
-- This syncs Neovim clipboard with your OS clipboard
opt.clipboard:append("unnamedplus")

-- ============================================================================
-- ENCODING & TEXT
-- ============================================================================
opt.spell = false  -- Disable spell checking by default
opt.backspace = { "eol", "start", "indent" }  -- Allow backspace over everything
opt.fileencoding = "utf-8"  -- File encoding
opt.encoding = "utf-8"      -- Internal encoding
opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }  -- Matching pairs for % command
opt.syntax = "enable"  -- Enable syntax highlighting

-- ============================================================================
-- INDENTATION
-- ============================================================================
-- Configure how code indentation works
opt.autoindent = true    -- Copy indent from current line when starting new line
opt.expandtab = true     -- Use spaces instead of tabs
opt.shiftwidth = indent  -- Number of spaces for each indentation level (4)
opt.smartindent = true   -- Smart auto-indenting for C-like programs
opt.softtabstop = indent -- Number of spaces for <Tab> key (4)
opt.tabstop = indent     -- Number of spaces a <Tab> counts for (4)
opt.shiftround = false   -- Don't round indent to multiple of shiftwidth

-- ============================================================================
-- SEARCH SETTINGS
-- ============================================================================
-- Configure search behavior
-- opt.hlsearch = true   -- Highlight all search matches (disabled - use :noh)
opt.ignorecase = true    -- Ignore case when searching
opt.smartcase = true     -- Override ignorecase if search contains uppercase
opt.wildmenu = true      -- Enhanced command-line completion
-- opt.wildignore = opt.wildignore + {"*/node_modules/*", "*/.git/*", "*/vendor/*"}

-- ============================================================================
-- USER INTERFACE
-- ============================================================================
-- Configure how Neovim looks and behaves
opt.cursorline = true     -- Highlight the current line (easier to find cursor)
opt.laststatus = 2        -- Always show status line
opt.lazyredraw = true     -- Don't redraw screen during macros (performance)
opt.list = true           -- Show invisible characters

-- Visible characters for tabs, trailing spaces, etc.
opt.listchars = {
  tab = "┊ ",      -- Show tabs as vertical dotted line
  trail = "·",     -- Show trailing spaces as dots
  extends = "»",   -- Show when line extends beyond screen
  precedes = "«",  -- Show when line precedes screen
  nbsp = "×"       -- Show non-breaking spaces
}

-- Hide command line when not in use (optional)
-- opt.cmdheight = 0

-- Mouse and line numbers
opt.mouse = "a"           -- Enable mouse in all modes (like VSCode)
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Show relative line numbers (useful for jumps)
opt.scrolloff = 10        -- Keep 10 lines visible above/below cursor
opt.sidescrolloff = 3     -- Keep 3 columns visible left/right of cursor
opt.signcolumn = "yes"    -- Always show sign column (prevents text shifting)
opt.splitbelow = true     -- New horizontal splits open below
opt.splitright = true     -- New vertical splits open to the right
opt.wrap = false          -- Don't wrap long lines (scroll horizontally)

-- ============================================================================
-- BACKUP & SWAP FILES
-- ============================================================================
-- Disable backup files (use version control instead)
opt.backup = false        -- Don't create backup files
opt.swapfile = false      -- Don't create swap files
opt.writebackup = false   -- Don't create backup before overwriting

-- ============================================================================
-- AUTOCOMPLETE
-- ============================================================================
-- Configure completion menu behavior
opt.completeopt = { "menu", "menuone", "noselect" }  -- Completion options
opt.shortmess = opt.shortmess + { c = true }         -- Don't show completion messages

-- Don't show mode in command line (shown in status line instead)
opt.showmode = false

-- ============================================================================
-- PERFORMANCE
-- ============================================================================
opt.history = 100         -- Remember 100 commands in history
opt.redrawtime = 1500     -- Max time for syntax highlight redraw
opt.timeoutlen = 250      -- Time to wait for key sequence (ms) - affects which-key
opt.ttimeoutlen = 10      -- Time to wait for key code sequence (ms)
opt.updatetime = 100      -- Faster update time (default 4000ms)

-- ============================================================================
-- THEME & COLORS
-- ============================================================================
opt.termguicolors = true  -- Enable 24-bit RGB colors (required for modern themes)

-- ============================================================================
-- PERSISTENT UNDO
-- ============================================================================
-- Keep undo history even after closing files (VSCode-like behavior)
-- This means you can undo changes even after reopening a file!
local undodir = vim.fn.stdpath("data") .. "/undo"
opt.undofile = true       -- Enable persistent undo
opt.undodir = undodir     -- Directory to store undo files
opt.undolevels = 1000     -- Maximum number of changes that can be undone
opt.undoreload = 10000    -- Maximum lines to save for undo on buffer reload

-- ============================================================================
-- CODE FOLDING
-- ============================================================================
opt.foldmethod = "marker" -- Use markers for folding (like {{{ and }}})
opt.foldlevel = 99

-- Disable builtin plugins
local disabled_built_ins = { "2html_plugin", "getscript", "getscriptPlugin", "gzip", "logipat", "netrw", "netrwPlugin",
  "netrwSettings", "netrwFileHandlers", "matchit", "tar", "tarPlugin", "rrhelper",
  "spellfile_plugin", "vimball", "vimballPlugin", "zip", "zipPlugin", "tutor", "rplugin",
  "synmenu", "optwin", "compiler", "bugreport", "ftplugin" }

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

-- Colorscheme
cmd.colorscheme("catppuccin")
