"*****************************************************************************
"" Vim-Plug core
"*****************************************************************************
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
"*****************************************************************************
"" Plug install packages
"*****************************************************************************
call plug#begin('~/.config/nvim/plugged')

Plug 'rafi/awesome-vim-colorschemes'
Plug 'LunarVim/onedarker.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim', {'as': 'dracula'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'                 " TS syntax

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/tagbar'
Plug 'puremourning/vimspector'                      " Debugging
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'               " <C-hjkl>

call plug#end()
"*****************************************************************************
"*****************************************************************************

let g:mapleader = ','

filetype plugin indent on

inoremap jk <Esc>
onoremap L $
onoremap H ^

set mouse=a
set number
set relativenumber
set hidden
set hlsearch
set ignorecase
set ruler
set noswapfile
set nobackup
set nowritebackup
set clipboard+=unnamedplus
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smartcase
set scrolloff=8
set encoding=utf-8
set fileencoding=utf-8
set signcolumn=auto
set completeopt=menuone,noselect

"" theme
set background=dark
set termguicolors
syntax enable
colorscheme dracula_pro

packadd! dracula_pro
let g:dracula_colorterm = 0

"" window Splits
set splitbelow splitright

"" remap to indent
vnoremap > >gv
vnoremap < <gv

"" make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
"" change 2 split windows from vert to horiz or horiz to vert
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K
"" start terminals for R and Python sessions '\tr' or '\tp'
map <leader>ip :new term://zsh<CR>iipython<CR><C-\><C-n><C-w>k
map <leader>tr :new term://zsh<CR>iR<CR><C-\><C-n><C-w>k
map <leader>tp :new term://zsh<CR>ipython3<CR><C-\><C-n><C-w>k
map <leader>td :new term://zsh<CR>isqlite3<CR><C-\><C-n><C-w>k
map <leader>tj :new term://zsh<CR>ijulia<CR><C-\><C-n><C-w>k
map <leader>ts :new term://zsh<CR>iscala<CR><C-\><C-n><C-w>k
map <leader>sh :new term://zsh<CR>i

"" buffer nav
nnoremap <silent> <S-l> :bn<CR>
nnoremap <silent> <S-h> :bp<CR>

"" close buffer
nnoremap <silent> <leader>c :bw<CR>

"" clean search (highlight)
nnoremap <silent> <leader><space> :noh<CR>

"" python alias (,p runs python on script. ,t times python script)
nmap ,p :w<CR>:!python3 %<CR>
nmap ,t :w<CR>:!time python3 %<CR>
nmap ,n :w<CR>:!node %<CR>

"" Easymotion
"" s{char}{char} to move to {char}{char} over windows
nmap <space>f <Plug>(easymotion-overwin-f)
"" Move to line over windows
nmap <space>l <Plug>(easymotion-overwin-line)
"" Search n-chars
map / <Plug>(easymotion-sn)

"" SQLite should use SQL highlights. See :help ft-sql for more info
autocmd BufNewFile,BufRead *.sqlite set syntax=sql

"" airline_theme
"let g:airline_theme='codedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ale#enabled = 1

"" nerdtree
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

"" tagbar
nmap <leader>ta :TagbarToggle<CR>
let g:tagbar_ctags_bin = "/opt/homebrew/bin/ctags"

"" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

"" Multi select
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'

"" python syntax highlight
let python_highlight_all = 1

"" configure yats to highlight host specific keywords
let g:yats_host_keyword = 1

"" TMUX navigation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-k> :TmuxNavigateUp<Cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<Cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<Cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<Cr>
"" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

"" Configuration
nnoremap <silent> <leader><leader>e :edit ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader><leader>r :so ~/.config/nvim/init.vim<CR>

"" ALE
let g:ale_linters = {}
let g:ale_fixers = {
     \   'python': ['black'],
     \   'javascript': ['eslint'],
     \}
let g:ale_fix_on_save = 1
:call extend(g:ale_linters, {
    \'python': ['flake8'], 'javascript': ['eslint'] })

""--- COC-NVIM ---""
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
"set encoding=utf-8

" TextEdit might fail if hidden is not set.
"set hidden

" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup

" Give more space for displaying messages.
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"if has("nvim-0.5.0") || has("patch-8.1.1564")
"  " Recently vim can merge signcolumn and number column into one
"  set signcolumn=number
"else
"  set signcolumn=yes
"endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
