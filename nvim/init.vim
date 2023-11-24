" General Settings
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set noshowmode
set clipboard=unnamedplus
set completeopt-=preview " For No Previews

" Vim-Plug Setup
call plug#begin()

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'jiangmiao/auto-pairs' "auto completes [] and () and makes life a bit easier
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'

call plug#end()

" NERDTree Settings
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeShowHidden=1

" Color Scheme
colorscheme wombat256mod

" Airline Settings
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Airline Symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Autocomplete
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Vimwiki Settings
let g:vimwiki_list = [{'path': '~/OneDrive/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_key_mappings = { 'table_mappings': 0 } " autocomplete comes back
let mapleader = ","

" Startify Settings
let g:startify_bookmarks = [
            \ { 'n': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ { 'u': '~/OneDrive/UPM/' },
            \ '~/.config/vim/plugged/',
            \ '~/AppData/Local/coc/ultisnips',
            \ '~/.config/vim/Vim/vim82/',
            \ ]

let g:ascii = [
 \ '                                         ▟▙            ',
 \ '                                         ▝▘            ',
 \ ' ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
 \ ' ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
 \ ' ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
 \ ' ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
 \ ' ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
 \ '',
 \]

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Recent Files']	  },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']         },
		  \ { 'type': 'dir',	   'header': ['   Current Directory'] },
          \ { 'type': 'sessions',  'header': ['   Sessions']          },
          \ ]

let g:startify_change_to_dir = 1
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header = g:ascii + startify#fortune#boxed()
" 'Most Recent Files' number
let g:startify_files_number = 5 " Files shown in Recent Files
" Update session automatically as you exit vim
let g:startify_session_persistence= 1

" End of Configuration

