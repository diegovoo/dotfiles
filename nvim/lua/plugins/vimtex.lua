return {
    "lervag/vimtex",
    lazy = false,
    init = function()

        vim.g.vimtex_compiler_latexmk = {
            executable = 'latexmk',
            out_dir = 'build',
            options = { '-pdf', '-interaction=nonstopmode', '-file-line-error', '-synctex=1' },
        }

        vim.g.vimtex_view_method = "zathura"
        -- Quickfix behavior: use mode 2 (shows quickfix but keeps focus), and
        -- do NOT open the quickfix window for warnings only.
        vim.g.vimtex_quickfix_mode = 2
        vim.g.vimtex_quickfix_open_on_warning = 0

        -- Leader mappings: use your `mapleader` (set in `lua/config/init.lua`) so
        -- `,l` compiles and `,v` opens viewer, etc.
        vim.api.nvim_set_keymap('n', '<leader>l', ':VimtexCompile<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>v', ':VimtexView<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>k', ':VimtexClean<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>t', ':VimtexTocOpen<CR>', { noremap = true, silent = true })

        -- Open quickfix (errors) automatically when compilation fails.
        vim.api.nvim_create_autocmd('User', {
            pattern = 'VimtexEventCompileFailed',
            callback = function()
                vim.cmd('VimtexErrors')
            end,
        })
    end
}
