" Plugins
call plug#begin('~/.config/nvim/plugged')
 
" Themes
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'

" Status/tab bar
Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'

" Fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Syntax highlight
Plug 'sheerun/vim-polyglot'

" Python bundles
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" Misc.
"Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
 
call plug#end()

" General settings
let mapleader = ' '
filetype plugin indent on

set mouse=a
set number 
set relativenumber
set encoding=utf-8
set fileencoding=utf-8

set splitbelow
set splitright

set hidden
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set autoindent

set hlsearch
set incsearch
set ignorecase
set smartcase

set clipboard=unnamed

" Lightline
set laststatus=2
set noshowmode
set t_Co=256

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" Theme
syntax on
colorscheme onedark
set termguicolors
set background=dark

" NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Fzf
noremap <leader>f :Files<CR>
noremap <leader>b :Buffers<CR>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Easymotion
map / <Plug>(easymotion-sn)

" Multi cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'

" Ale
let g:ale_linters = {
\   'python': ['flake8'],
\}
let g:ale_fixers = {
\   'python': ['black'],
\}
let g:ale_fix_on_save=1

" Jedi
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = '<leader>g'
let g:jedi#goto_definitions_command = '<leader>d'
let g:jedi#documentation_command = 'K'
let g:jedi#usages_command = '<leader>n'
let g:jedi#rename_command = '<leader>r'
let g:jedi#show_call_signatures = '0'
let g:jedi#completions_command = '<C-Space>'
let g:jedi#smart_auto_mappings = 0

" Python syntax highlight
let python_highlight_all=1

" Auto close tag
let g:closetag_filenames = '*.html,*.js,*.jsx'
let g:closetag_emptyTags_caseSensitive = 1

" Terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

" Other keymaps
" Quit <ESC>
inoremap jk <Esc>
inoremap kj <Esc>

nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>/ :split<CR>
