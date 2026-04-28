-- ============================================================================
-- BUFFERLINE CONFIGURATION
-- ============================================================================
-- Bufferline provides VSCode-like tabs at the top of the editor.
-- Each open file is shown as a tab that you can click or navigate to.
-- ============================================================================

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",  -- File icons
  },
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        -- Mode: "buffers" shows open files, "tabs" shows vim tabs
        mode = "buffers",
        
        -- Style preset (similar to VSCode)
        style_preset = require("bufferline").style_preset.default,
        
        -- Use nvim's built-in LSP for diagnostics indicators
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        
        -- Show diagnostics indicators (errors, warnings)
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        
        -- Offset for nvim-tree (file explorer)
        offsets = {
          {
            filetype = "NvimTree",
            text = "📁 File Explorer",
            text_align = "center",
            separator = true,
            highlight = "Directory",
          },
        },
        
        -- Tab appearance
        separator_style = "thin",  -- "slant", "thick", "thin", or { '|', '|' }
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        
        -- Show buffer numbers for quick navigation
        numbers = function(opts)
          return string.format('%s', opts.ordinal)
        end,
        
        -- Enforce regular tabs max length
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        
        -- Color icons
        color_icons = true,
        
        -- Persist hidden buffers
        persist_buffer_sort = true,
        
        -- Always show tabs (even with one buffer)
        always_show_bufferline = true,
        
        -- Hover effects
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' }
        },
        
        -- Custom filter to hide certain buffers
        custom_filter = function(buf_number, buf_numbers)
          -- Hide quickfix buffers
          if vim.bo[buf_number].filetype ~= "qf" then
            return true
          end
        end,
      },
      
      -- Highlights (will be overridden by theme if supported)
      highlights = {
        fill = {
          bg = { attribute = "bg", highlight = "Normal" },
        },
        background = {
          italic = false,
        },
        buffer_selected = {
          bold = true,
          italic = false,
        },
      },
    })
  end,
}
