"*****************************************************************************
"" Vim-Plug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
let curl_exists=expand('curl')

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
call plug#begin('~/.config/nvim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'

Plug 'itchyny/lightline.vim'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'dense-analysis/ale'
Plug 'davidhalter/jedi-vim'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-startify'
Plug 'tmhedberg/SimpylFold'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'

call plug#end()
"*****************************************************************************
"*****************************************************************************

"let mapleader=' '

set laststatus=2
set t_Co=256
set number
set relativenumber
set noswapfile
set clipboard=unnamed,unnamedplus
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" theme
syntax on
colorscheme onedark
set termguicolors

" enable folding 
set foldmethod=indent 
set foldlevel=99
nnoremap <space>z za

" window Splits
set splitbelow splitright
" remap splits navigation to just CTRL + hjkl
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

:imap ii <Esc>

" make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
" change 2 split windows from vert to horiz or horiz to vert
map <space>th <C-w>t<C-w>H
map <space>tk <C-w>t<C-w>K
" start terminals for R and Python sessions '\tr' or '\tp'
map <space>tr :new term://zsh<CR>iR<CR><C-\><C-n><C-w>k
map <space>tp :new term://zsh<CR>iipython3<CR><C-\><C-n><C-w>k
map <space>td :new term://zsh<CR>isqlite3<CR><C-\><C-n><C-w>k
map <space>tj :new term://zsh<CR>ijulia<CR><C-\><C-n><C-w>k
map <space>ts :new term://zsh<CR>iscala<CR><C-\><C-n><C-w>k

" buffer nav
noremap ,z :bp<CR>
noremap ,q :bp<CR>
noremap ,x :bn<CR>
noremap ,w :bn<CR>

" close buffer
noremap ,c :bd<CR>

" clean search (highlight)
nnoremap <silent> ,<space> :noh<cr>

" python alias (,p runs python on script. ,t times python script)
nmap ,p :w<CR>:!python3 %<CR>
nmap ,t :w<CR>:!time python3 %<CR>

" terminal emulation
nnoremap <silent> ,sh :terminal<CR>

" Easymotion
" s{char}{char} to move to {char}{char} over windows
nmap <space>f <Plug>(easymotion-overwin-f)
" Move to line over windows
nmap <space>l <Plug>(easymotion-overwin-line)
" Search n-chars
map / <Plug>(easymotion-sn)

" SQLite should use SQL highlights. See :help ft-sql for more info
autocmd BufNewFile,BufRead *.sqlite set syntax=sql 

" lightline
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" nerdtree
nnoremap <silent> <space>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
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

" startify
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   Recent']            },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" fzf.vim
" Customize fzf colors to match your color scheme
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

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Multi select
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'

" ale linting
let g:ale_sign_column_always=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_text_changed='always'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %s [%severity%]: [%...code...%]'
let g:ale_linters={'python': ['flake8'], 'r': ['lintr']}
let g:ale_fixers={'python': ['black']}
let g:ale_fix_on_save=1

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

let python_highlight_all = 1

" TMUX navigation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-k> :TmuxNavigateUp<Cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<Cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<Cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<Cr>
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
