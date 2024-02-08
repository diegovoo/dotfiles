" General Settings
set number
set relativenumber
set autoindent
set tabstop=4
set smarttab
set softtabstop=4
set mouse=a
set noshowmode
set clipboard=unnamedplus
" set completeopt-=preview " For No Previews
let mapleader = ","

" Vim-Plug Setup
call plug#begin()

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Color scheme
" Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Icons
" Plug 'jiangmiao/auto-pairs' "auto completes [] and ()
Plug 'vimwiki/vimwiki' " note taking
Plug 'mhinz/vim-startify' " statup page
" Plug 'github/copilot.vim'
Plug 'elixir-editors/vim-elixir' " elixir lang plug

call plug#end()

" NERDTree Settings
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Color Scheme
colorscheme wombat256mod

" Airline Settings
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#whitespace#enabled = 0

" Vimwiki Settings
let g:vimwiki_list = [{'path': '~/OneDrive/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufWritePost *.md silent !~/scripts/vimwiki-to-git.sh &

" Startify Settings
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

" Function calls and other mappings
nnoremap <leader>dt :silent !done_tasks.sh<CR>
nnoremap <leader>st :Startify<CR>
nnoremap ya :%y<CR>
