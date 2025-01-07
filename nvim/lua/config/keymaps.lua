-- File: config/keymaps.lua
-- Description: Key mapping configs

local keymap = vim.keymap

-- Move around splits
keymap.set("n", "<leader>wh", "<C-w>h", {})
keymap.set("n", "<leader>wj", "<C-w>j", {})
keymap.set("n", "<leader>wk", "<C-w>k", {})
keymap.set("n", "<leader>wl", "<C-w>l", {})

-- Reload configuration without restart nvim
keymap.set("n", "<leader>r", ":so %<CR>", {})

-- Telescope
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files, {})
keymap.set("n", "<leader>fg", builtin.live_grep, {})
keymap.set("n", "<leader>fb", builtin.buffers, {})
keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- NvimTree
keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", {}) -- open/close
keymap.set("n", "<leader>nr", ":NvimTreeRefresh<CR>", {}) -- refresh
keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", {}) -- search file

-- Terminal
function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    -- Exit terminal mode with <esc>
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts) 
end

-- Apply terminal keybinds when opening a terminal
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Open terminal with <leader>tt
keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", {})

-- Moves done tasks from vimwiki to a done tasks file (done tasks have this format [X])
keymap.set("n", "<leader>dt", "<CR>:silent !done_tasks.sh<CR>")

-- Alpha nvim
keymap.set("n", "<leader>al", ":Alpha<CR>", {})

-- Prevent 'd' and 'dd' from copying deleted text
keymap.set("n", "d", '"_d', { noremap = true, silent = true })
keymap.set("n", "dd", '"_dd', { noremap = true, silent = true })
keymap.set("v", "d", '"_d', { noremap = true, silent = true })

-- Split view keybinds
keymap.set("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true }) -- Vertical split
keymap.set("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true })  -- Horizontal split

-- Clear search
keymap.set("n", "<leader>cs", ":noh<CR>", { noremap = true, silent = true })

-- Formatting
keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
