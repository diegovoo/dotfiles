-- Makes md links as [foo](foo.md) instead of [foo](foo)
vim.g.vimwiki_markdown_link_ext = 1

-- Autocommand for BufWritePost
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.md',
  command = 'silent !~/scripts/vimwiki-to-git.sh &'
})

-- Normal mode mapping for <leader>wcc
vim.api.nvim_set_keymap('n', '<leader>wcc', ':lua CreateClassWiki()<CR>', { noremap = true, silent = true })

-- Normal mode mapping for <leader>dt
vim.api.nvim_set_keymap('n', '<leader>dt', ':silent !done_tasks.sh<CR>', { noremap = true, silent = true })

-- Define the CreateClassWiki function in Lua
function CreateClassWiki()
  vim.cmd('w!')
  local year = vim.fn.input("What year is this course from (1-4): ")
  local course = vim.fn.input("What is the course's name: ")
  local course_true_name = vim.fn.input("What name would you like to display for the course: ")
  local current_file = vim.fn.expand("%")
  vim.fn.system('~/scripts/vimwiki-autoclass.sh ' .. year .. ' ' .. course .. ' ' .. course_true_name .. ' ' .. current_file)
  vim.cmd('e!')
end

