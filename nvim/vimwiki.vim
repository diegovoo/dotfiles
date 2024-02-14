let g:vimwiki_list = [{'path': '~/OneDrive/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Makes md links as [foo](foo.md) instead of [foo](foo)
let g:vimwiki_markdown_link_ext = 1

autocmd BufWritePost *.md silent !~/scripts/vimwiki-to-git.sh &

nnoremap <leader>wcc :call CreateClassWiki()<CR>

function! CreateClassWiki() abort
    execute "w!"
    let l:year = input("What year is this course from (1-4): ")
    let l:course = input("What is the course's name: ")
	let l:course_true_name = input("What name would you like to display for the course: ")
	let l:current_file = expand("%")
    call system('~/scripts/vimwiki-autoclass.sh ' . l:year . ' ' . l:course . ' ' . l:course_true_name . ' ' . l:current_file)
    execute "e!"
endfunction

nnoremap <leader>dt :silent !done_tasks.sh<CR>
