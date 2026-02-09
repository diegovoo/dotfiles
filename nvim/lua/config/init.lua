-- Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","
vim.opt.termguicolors = true 

-- build spec
local spec = {{
    import = "plugins"
}}

local ok, err = pcall(require, "plugins.custom")
if ok then
    spec = {{
        import = "plugins"
    }, {
        import = "plugins.custom"
    }}
end

require("lazy").setup({
    root = vim.fn.stdpath("data") .. "/lazy",
    spec = spec,
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
    defaults = {
        lazy = false,
        version = nil
    },
    install = {
        -- install missing plugins on startup
        missing = true,
        -- Updated colorscheme list to include monokai-pro
        colorscheme = {"monokai-pro", "habamax"}
    },
    checker = {
        -- automatically check for plugin updates
        enabled = true,
        -- get a notification when new updates are found
        notify = false,
        -- check for updates every day
        frequency = 86400
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        -- get a notification when changes are found
        notify = false
    },
    performance = {
        cache = {
            enabled = true
        }
    },
    state = vim.fn.stdpath("state") .. "/lazy/state.json" -- state info for checker and other things
})

local modules = {"config.autocmds", "config.options", "config.keymaps", "config.custom"}

for _, mod in ipairs(modules) do
    local ok, err = pcall(require, mod)
    -- config.custom may be empty. It's a optional module
    if not ok and not mod == "config/custom" then
        error(("Error loading %s...\n\n%s"):format(mod, err))
    end
end

-- Disable annoying deprecated message
vim.deprecate = function() end
