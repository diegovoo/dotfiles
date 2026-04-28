-- ============================================================================
-- MONOKAI THEME CONFIGURATION
-- ============================================================================
-- Using monokai-pro theme - similar to VSCode Monokai theme
-- This replaces the previous catppuccin theme
-- ============================================================================

return {
  "loctvl842/monokai-pro.nvim",
  name = "monokai-pro",
  lazy = false,
  priority = 1000,
  config = function()
    require("monokai-pro").setup({
      -- Available filters: classic, octagon, pro, machine, ristretto, spectrum
      filter = "classic",
      
      -- Enable italics for comments and keywords
      styles = {
        comment = { italic = true },
        keyword = { italic = true },
        type = { italic = false },
        storageclass = { italic = true },
        structure = { italic = false },
        parameter = { italic = true },
        annotation = { italic = true },
        tag_attribute = { italic = true },
      },

      -- Enable transparent background
      transparent_background = false,

      -- Dim inactive windows
      dim_inactive = false,

      -- Plugin integrations
      plugins = {
        bufferline = {
          underline_selected = false,
          underline_visible = false,
          underline_fill = false,
          bold = true,
        },
        indent_blankline = {
          context_highlight = "pro",
          context_start_underline = false,
        },
      },

      -- Override specific highlight groups if needed
      override = function(c)
        return {
          -- Make the cursor line more visible
          CursorLine = { bg = c.base.dimmed3 },
          -- Better visual selection
          Visual = { bg = c.base.dimmed2 },
        }
      end,
    })
    
    -- Apply the colorscheme
    vim.cmd([[colorscheme monokai-pro]])
  end,
}
