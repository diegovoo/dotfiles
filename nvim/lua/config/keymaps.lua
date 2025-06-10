local keymap = vim.keymap

-- Move around splits
keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to left split" })
keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to below split" })
keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to above split" })
keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to right split" })

-- Reload configuration without restart nvim
keymap.set("n", "<leader>r", ":so %<CR>", { desc = "Reload current config file" })

-- Telescopes
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files (Telescope)" })
keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep (Telescope)" })

-- NvimTree
keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>nr", ":NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

-- Terminal
function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    -- Exit terminal mode with <esc>
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts) -- Exit terminal mode
end

-- Apply terminal keybinds when opening a terminal
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()') -- Set terminal keymaps on open

-- Open terminal with <leader>tt
keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "Toggle terminal" })

-- Moves done tasks from vimwiki to a done tasks file (done tasks have this format [X])
keymap.set("n", "<leader>dt", "<CR>:silent !done_tasks.sh<CR>", { desc = "Move done vimwiki tasks" })

-- Alpha nvim
keymap.set("n", "<leader>al", ":Alpha<CR>", { desc = "Open Alpha dashboard" })

-- Prevent 'd' and 'dd' from copying deleted text
keymap.set("n", "d", '"_d', { noremap = true, silent = true, desc = "Delete without yanking" })
keymap.set("n", "dd", '"_dd', { noremap = true, silent = true, desc = "Delete line without yanking" })
keymap.set("v", "d", '"_d', { noremap = true, silent = true, desc = "Delete selection without yanking" })

-- Split view keybinds
keymap.set("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical split" }) -- Vertical split
keymap.set("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal split" })  -- Horizontal split

-- Clear search
keymap.set("n", "<leader>cs", ":noh<CR>", { noremap = true, silent = true, desc = "Clear search highlights" })

-- Formatting
keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true, desc = "Format buffer" })

-- Which-Key
keymap.set("n", "<leader>?", ":WhichKey<CR>", { noremap = true, silent = true, desc = "Show all keymaps" })