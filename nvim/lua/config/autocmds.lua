local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General settings

-- Auto format on save using the attached (optionally filtered) language servere clients
-- https://neovim.io/doc/user/lsp.html#vim.lsp.buf.format()
autocmd("BufWritePre", {
    pattern = "",
    command = ":silent lua vim.lsp.buf.format()"
})

-- Line wrapping and spell checking on the pattern type files
autocmd("Filetype", {
    pattern = {"gitcommit", "markdown", "text"},
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = false
    end
})

-- Upload vimwiki to git when a .md file is closed
autocmd("BufWritePost", {
    pattern = "*.md",
    callback = function()
        vim.fn.system("~/.local/bin/vimwiki-to-git.sh &")
    end
})
