-- File: config/keymaps.lua
-- Description: Key mapping configs

-- Move around splits
vim.keymap.set("n", "<leader>wh", "<C-w>h", {})
vim.keymap.set("n", "<leader>wj", "<C-w>j", {})
vim.keymap.set("n", "<leader>wk", "<C-w>k", {})
vim.keymap.set("n", "<leader>wl", "<C-w>l", {})

-- Reload configuration without restart nvim
vim.keymap.set("n", "<leader>r", ":so %<CR>", {})

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- NvimTree
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", {}) -- open/close
vim.keymap.set("n", "<leader>nr", ":NvimTreeRefresh<CR>", {}) -- refresh
vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", {}) -- search file

-- Terminal
function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    -- Exit terminal mode with <esc>
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts) 
end

-- Apply terminal keybinds when opening a terminal
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Open terminal with <leader>tt
vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", {})

-- Moves done tasks from vimwiki to a done tasks file (done tasks have this format [X])
vim.keymap.set("n", "<leader>dt", "<CR>:silent !done_tasks.sh<CR>")

-- Alpha nvim
vim.keymap.set("n", "<leader>al", ":Alpha<CR>", {})

-- Prevent 'd' and 'dd' from copying deleted text
vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true })
vim.keymap.set("v", "d", '"_d', { noremap = true, silent = true })
