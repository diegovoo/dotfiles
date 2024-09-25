return {
  {
    "vimwiki/vimwiki",
    event = "BufEnter *.md",
    keys = { "<leader>ww" },
    init = function()
      -- Set up vimwiki options
      vim.g.vimwiki_list = {
        {
          path = '~/OneDrive/vimwiki/',  -- Set your wiki path here
          syntax = 'markdown',  -- You can change it to 'default' if you prefer Vimwiki syntax
          ext = 'md',          -- Markdown file extension
        }
      }
      -- Additional vimwiki options
      vim.g.vimwiki_global_ext = 0
      vim.g.vimwiki_markdown_link_ext = 1
    end
  }
}
