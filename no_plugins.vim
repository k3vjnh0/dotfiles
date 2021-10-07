" PLUGINS:
call plug#begin('~/.vim/plugged')

call plug#end()

"========================================================"
"========================================================"
"========================================================"

"       HOW TO DO 90% OF WHAT PLUGINS DO (WITH JUST VIM)

" FEATURES TO COVER:
" - Fuzzy File Search
" - Tag jumping
" - Autocomplete
" - File Browsing
" - Snippets
" - Build Integration (if we have time)

" {{{ BASIC SETUP
" BASIC SETUP:

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin indent on


" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list


" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
nnoremap ,main :-1read $HOME/.vim/.ifmain.py<CR>ji<TAB>

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)


" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back


"                    Download this file at:
"                github.com/mcantor/no_plugins

"========================================================"
" MY CONFIG:                                             "
"========================================================"

set laststatus=2
set backspace=indent,eol,start
set showcmd
set showmatch
set history=500
set number
set relativenumber
set hidden
set hlsearch
set ignorecase
set incsearch
set ruler
set noswapfile
set nobackup
set nowritebackup
set clipboard=unnamed,unnamedplus
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set scrolloff=8
set sidescrolloff=8
set encoding=utf-8
set fileencoding=utf-8
set smartcase
set smartindent

"" built-in completion
set omnifunc=syntaxcomplete#Complete
set completeopt=noinsert,menuone,noselect

"" enable folding 
set foldmethod=indent 
set foldlevel=99

"" window Splits
set splitbelow splitright

"" key mappings
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

onoremap L $
onoremap H ^

"" remap to indent
vnoremap > >gv
vnoremap < <gv
"" remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"" make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
"" change 2 split windows from vert to horiz or horiz to vert
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K
"" start terminals for R and Python sessions '\tr' or '\tp'
map <leader>ip :ter<CR>ipython<CR>
map <leader>tr :ter<CR>R<CR>
map <leader>tp :ter<CR>python3<CR>
map <leader>td :ter<CR>sqlite3<CR>
map <leader>tj :ter<CR>julia<CR>
map <leader>ts :ter<CR>scala<CR>
"" buffer nav
nnoremap <silent> <S-l> :bn<CR>
nnoremap <silent> <S-h> :bp<CR>
"" close buffer
nnoremap <silent> <space>c :bw<CR>
"" clean search (highlight)
nnoremap <silent> <space>h :noh<CR>
"" run script
nmap ,p :w<CR>:!python3 %<CR>
nmap ,t :w<CR>:!time python3 %<CR>
nmap ,cr :w<CR>:!cargo run<CR>
nmap ,cb :w<CR>:!cargo build<CR>
"" terminal emulation
nnoremap <silent> ,sh :ter<CR>

"" SQLite should use SQL highlights. See :help ft-sql for more info
autocmd BufNewFile,BufRead *.sqlite set syntax=sql 
