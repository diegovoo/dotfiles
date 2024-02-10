let g:startify_bookmarks = [
            \ { 'n': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ { 'u': '~/OneDrive/UPM/' },
            \ ]

let g:ascii = []

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Recent Files']	  },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']         },
		  \ { 'type': 'dir',	   'header': ['   Current Directory'] },
          \ { 'type': 'sessions',  'header': ['   Sessions']          },
          \ ]

let g:startify_change_to_dir = 1
" 'Most Recent Files' number
let g:startify_files_number = 5 " Files shown in Recent Files
" Update session automatically as you exit vim
let g:startify_session_persistence= 1
let g:startify_custom_header = g:ascii

nnoremap <leader>st :Startify<CR>