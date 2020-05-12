set encoding=utf8

"""" START Plugin Configuration

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Utility
" Minimal file-manager
Plug 'tpope/vim-vinegar'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Ctrl+p style file, mru, etc matching
Plug 'ctrlpvim/ctrlp.vim'

" Find todos, notes
Plug 'gilsondev/searchtasks.vim'

" change chars around stuff
Plug 'tpope/vim-surround'

" Use dot to repeat whatever you did last
Plug 'tpope/vim-repeat'

" jump to chars or words
" Usage: <Leader><Leader>s<char>
Plug 'easymotion/vim-easymotion'

" Highlight indentation
" Is switched always on by config below
Plug 'nathanaelkane/vim-indent-guides'

" Code minimap
" <Leader>mm
Plug 'severin-lemaignan/vim-minimap'

" Display git-changes in gutter
Plug 'airblade/vim-gitgutter'

" Comment lines
" gcc - add block comment
Plug 'joom/vim-commentary'

" Also insert closing brackets when inserting opening bracket
" <alt>p - toggle on/off
Plug 'chun-yang/auto-pairs'

" Allow matching html-tags with %
Plug 'tmhedberg/matchit'

" Multi Clipboard of previous yanks
Plug 'maxbrunsfeld/vim-yankstack'

" Respect editorconfig
Plug 'editorconfig/editorconfig-vim'

" Color brackets
Plug 'kien/rainbow_parentheses.vim'

" Expand increasing regions of text
" + - increase region
" _ - shrink region
Plug 'terryma/vim-expand-region'

" Markdown / Writing
Plug 'tpope/vim-markdown'

" Javascript Support
" Usage:
"   - <Tab> to expand snippet
"   - <c-j> jump forward
"   - <c-k> jump backward
Plug 'sheerun/vim-polyglot'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'w0rp/ale'

" Formatter
" <Leader>p
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

" Theme / Interface
Plug 'ajh17/Spacegray.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'j-tom/vim-old-hope'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'whatyouhide/vim-gotham'

" Initialize Plug system
call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

"""" END Plugin Configuration

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""
set nowrap

" OSX stupid backspace fix
set backspace=indent,eol,start

" Set font
if has('gui_running')
  set guifont=Input\ Mono:h14
  set linespace=3
endif

" Show linenumbers
set number

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Set linebreak line
set colorcolumn=120

" Search behaviour
" Ignore case when searching
set ignorecase
" Except when the search query contains a capital letter
set smartcase

" Custom ALE linters
:let g:ale_linters = {
\ 'javascript': ['eslint']
\}

" Custom ALE fixers
:let g:ale_fixers = {
\	'javascript': ['prettier']
\}

let g:ale_fix_on_save = 1

" Always display the status line
set laststatus=2

" Enable highlighting of the current line
set cursorline

" Theme and Styling
syntax on

set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
" colorscheme gotham

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" Fzf Configuration
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Have JSX in JS
let g:jsx_ext_required = 0

" Ignore files in gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Configure prettier
" max line length that prettier will wrap on

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

let g:prettier#config#print_width = 120

" number of spaces per indentation level

" single quotes over double quotes
let g:prettier#config#single_quote = 'true'

" none|es5|all
let g:prettier#config#trailing_comma = 'es5'

" toggle indent guides
let g:indent_guides_enable_on_vim_startup = 1

" Rainbow Parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""

" shortcuts
nnoremap Y y$

" Mapping selecting Mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Shortcuts
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>O :CtrlP<CR>
nnoremap <Leader>w :w<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
