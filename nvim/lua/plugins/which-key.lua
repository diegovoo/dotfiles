-- ============================================================================
-- WHICH-KEY CONFIGURATION
-- ============================================================================
-- Which-key displays a popup with possible key bindings of the command you
-- started typing. It helps you remember keybindings and discover new ones.
--
-- Usage: Press your leader key (,) and wait - a popup will show all options
--        Or press <leader>? to see all keymaps
-- ============================================================================

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300  -- Time to wait for key sequence (ms)
  end,
  config = function()
    local wk = require("which-key")
    
    wk.setup({
      -- Window appearance
      preset = "modern",  -- "classic", "modern", or "helix"
      
      -- Icons configuration
      icons = {
        breadcrumb = "»",  -- Symbol in command line area
        separator = "➜",   -- Symbol between key and description
        group = "+",       -- Symbol prepended to group
      },
      
      -- Window layout
      layout = {
        height = { min = 4, max = 25 },  -- Min/max height of the popup
        width = { min = 20, max = 50 },  -- Min/max width of the popup
        spacing = 3,                      -- Spacing between columns
      },
      
      -- Sorting
      sort = { "local", "order", "group", "alphanum", "mod" },
      
      -- Show help message on the command line
      show_help = true,
      
      -- Show the count of keys pressed
      show_keys = true,
    })

    -- ========================================================================
    -- KEY GROUP DEFINITIONS
    -- ========================================================================
    -- These define the categories shown when you press leader
    -- Each group has a name and icon for better organization
    
    wk.add({
      -- ====== TOP-LEVEL GROUPS ======
      { "<leader>f", group = "🔍 Find/Telescope", desc = "Find files, text, and more" },
      { "<leader>w", group = "🪟 Window/Splits", desc = "Window and split management" },
      { "<leader>b", group = "📑 Buffers/Tabs", desc = "Buffer (tab) navigation" },
      { "<leader>s", group = "✂️ Split", desc = "Create and manage splits" },
      { "<leader>l", group = "📝 LSP/Code", desc = "Language server features" },
      { "<leader>g", group = "📦 Git", desc = "Git operations" },
      { "<leader>t", group = "💻 Terminal", desc = "Terminal operations" },
      { "<leader>n", group = "📁 File Explorer", icon = "📁" },
      
      -- ====== STANDALONE KEYS ======
      { "<leader>?", desc = "❓ Show all keymaps", icon = "❓" },
      { "<leader>r", desc = "🔄 Reload config", icon = "🔄" },
      { "<leader>al", desc = "🏠 Dashboard", icon = "🏠" },
      { "<leader>cs", desc = "🚫 Clear search", icon = "🚫" },
      { "<leader>dt", desc = "✅ Done tasks", icon = "✅" },
      
      -- ====== BUFFER/TAB NUMBERS ======
      { "<leader>1", desc = "Tab 1" },
      { "<leader>2", desc = "Tab 2" },
      { "<leader>3", desc = "Tab 3" },
      { "<leader>4", desc = "Tab 4" },
      { "<leader>5", desc = "Tab 5" },
      
      -- ====== CUT (actual yank+delete) ======
      { "<leader>d", desc = "✂️ Cut (yank+delete)", icon = "✂️" },
    })
  end,
}