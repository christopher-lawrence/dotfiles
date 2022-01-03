" Windows: change this file to _vimrc

" Package Manager

set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins: {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Fugitive - Git pluging
Plugin 'tpope/vim-fugitive'

" NERDTree - Folder browser
Plugin 'scrooloose/nerdtree'

" NERDTree git plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

" CtrlP - Fuzzy search for files, buffers, MRU, etc
Plugin 'ctrlpvim/ctrlp.vim'

" Set this to 1 to use ultisnips for snippet handling
let s:using_snippets = 0

" OmniSharp
Plugin 'OmniSharp/omnisharp-vim'

" OmniSharp Debugger
Plugin 'puremourning/vimspector'

" Mappings, code-actions available flag and statusline integration
Plugin 'nickspoons/vim-sharpenup'

" Linting/error highlighting
Plugin 'dense-analysis/ale'

" Vim  integration, used as OmniSharp selector
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Autocompletion
Plugin 'prabirshrestha/asyncomplete.vim'

" Colorscheme
Plugin 'gruvbox-community/gruvbox'
" Plugin 'joshdick/onedark.vim'
" Plugin 'nanotech/jellybeans.vim' 
Plugin 'arcticicestudio/nord-vim'
"
" Statusline
Plugin 'itchyny/lightline.vim'
" Plugin 'shinchu/lightline-gruvbox.vim'
Plugin 'maximbaz/lightline-ale'

" GitGutter
Plugin 'airblade/vim-gitgutter'

" Spelling for Pascal/camel/etc cases
Plugin 'kamykn/spelunker.vim'

" Auto formatter
" Plugin 'Chiel92/vim-autoformat'

" Editor Config
" https://github.com/editorconfig/editorconfig-vim
Plugin 'editorconfig/editorconfig-vim'

" Snippet support
if s:using_snippets
  Plugin 'sirver/ultisnips'
endif

call vundle#end()            " required
" }}}

" Settings: {{{
filetype indent plugin on
if !exists('g:syntax_on') | syntax enable | endif
set encoding=utf-8
scriptencoding utf-8

let mapleader = "\<SPACE>"

set completeopt=menuone,noinsert,noselect,popuphidden
set completepopup=highlight:Pmenu,border:off

set backspace=indent,eol,start
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=-1
set tabstop=4
" set textwidth=80
set title
set smarttab

set hidden
" set nofixendofline
set nostartofline
set splitbelow
set splitright

set hlsearch
set number
set ruler
" set noruler
set noshowmode
set signcolumn=yes

set mouse=a
set updatetime=1000

" This seems to fix issues with Ctrl-P
set mmp=5000

" Default is 4000ms. This should allow GitGutter to update more frequently
set updatetime=250

" lightline fix
set laststatus=2
" }}}

" CtrlP: {{{
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'results:100' " overcome limit imposed by max height
" }}}

" Colors: {{{
augroup ColorschemePreferences
  autocmd!
  " These preferences clear some gruvbox background colours, allowing transparency
  autocmd ColorScheme * highlight Normal     ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight Todo       ctermbg=NONE guibg=NONE
 " Link ALE sign highlights to similar equivalents without background colours
  autocmd ColorScheme * highlight link ALEErrorSign   WarningMsg
  autocmd ColorScheme * highlight link ALEWarningSign ModeMsg
  autocmd ColorScheme * highlight link ALEInfoSign    Identifier
augroup END

" This can cause weird color issues
" Use truecolor in the terminal, when it is supported
" if has('termguicolors')
" set termguicolors
" endif

" set background=dark
set bg=dark
" colorscheme gruvbox
colorscheme nord
" }}}

" ALE: {{{
let g:ale_sign_error = '!'
let g:ale_sign_warning = '•'
let g:ale_sign_info = '·'
let g:ale_sign_style_error = '·'
let g:ale_sign_style_warning = '·'

let g:ale_linters = { 'cs': ['OmniSharp'] }

nmap <silent> <leader>aj :ALENextWrap<cr>
nmap <silent> <leader>ak :ALEPreviousWrap<cr>
" }}}

" Asyncomplete: {{{
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
" }}}

" Autoformat: {{{
let g:formatterpath = ['/usr/local/Cellar/astyle/3.1/bin']
let g:formatdef_cs_format = '"astyle --mode=cs --style=kr --indent-namespaces -pcH".(&expandtab ? "s".shiftwidth() : "t")'
let g:formatters_cs = ['cs_format']
" }}}

" Sharpenup: {{{
" All sharpenup mappings will begin with `<Space>os`, e.g. `<Space>osgd` for
" :OmniSharpGotoDefinition
let g:sharpenup_map_prefix = '<leader>os'

let g:sharpenup_statusline_opts = { 'Text': '%s (%p/%P)' }
let g:sharpenup_statusline_opts.Highlight = 0

augroup OmniSharpIntegrations
  autocmd!
  autocmd User OmniSharpProjectUpdated,OmniSharpReady call lightline#update()
augroup END
" }}}

" Vimspector: {{{
" let g:vimspector_enable_mappings = 'HUMAN'
map <F5> :call vimspector#Continue()<CR>
map <F9> :call vimspector#ToggleBreakpoint()<CR>
" }}}

" Lightline: {{{
"\ 'colorscheme': 'jellybeans',
"\ 'colorscheme': 'gruvbox',
"\ 'colorscheme': 'nord',
let g:lightline = {
\ 'colorscheme': 'nord',
\ 'active': {
\   'left': [
\     ['mode', 'paste'],
\     ['readonly', 'filename', 'tagbar', 'modified', 'gitbranch']
\   ],
\   'right': [
\     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
\     ['lineinfo'], ['percent'],
\     ['fileformat', 'fileencoding', 'filetype', 'sharpenup' ]
\   ],
\ },
\ 'inactive': {
\   'right': [['lineinfo'], ['percent'], ['sharpenup']],
\   'left': [
\     ['mode', 'paste'],
\     ['readonly', 'filename', 'tagbar', 'modified']
\   ],
\ },
\ 'component': {
\   'sharpenup': sharpenup#statusline#Build(),
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead',
\ },
\ 'component_expand': {
\   'linter_checking': 'lightline#ale#checking',
\   'linter_infos': 'lightline#ale#infos',
\   'linter_warnings': 'lightline#ale#warnings',
\   'linter_errors': 'lightline#ale#errors',
\   'linter_ok': 'lightline#ale#ok'
\  },
\ 'component_type': {
\   'linter_checking': 'right',
\   'linter_infos': 'right',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error',
\   'linter_ok': 'right'
\  }
\}

" Use unicode chars for ale indicators in the statusline
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
" }}}

" OmniSharp: {{{
let g:OmniSharp_popup_position = 'peek'
if has('nvim')
  let g:OmniSharp_popup_options = {
  \ 'winhl': 'Normal:NormalFloat'
  \}
else
  let g:OmniSharp_popup_options = {
  \ 'highlight': 'Normal',
  \ 'padding': [0, 0, 0, 0],
  \ 'border': [1]
  \}
endif
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

if s:using_snippets
  let g:OmniSharp_want_snippet = 1
endif

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}
" Use FZF for symbol lookup
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_selector_findusages = 'fzf'
" }}}

" AsyncAutocomplete: {{{
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" }}}

" FZF: {{{
nnoremap <leader>ffs :Ag<CR>
" }}}

" NERDTree: {{{
nnoremap <silent> <leader>ntt :NERDTreeToggle<CR>
nnoremap <silent> <leader>ntn :NERDTree
nnoremap <silent> <leader>ntf :NERDTreeFind<CR>
let NERDTreeMinimumUI = 1
let NERDTreeDirArrows = 1
" }}}

" (fugative) Git: {{{
nnoremap <silent> <leader>g :Git<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
" }}}

" GitGutter: {{{
let g:gitgutter_log=1
" }}}

" Spelunker: {{{
autocmd ColorScheme *
    \ highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e |
    \ highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE
" }}}

" END HERE }}}
"

" Misc: {{{
syntax enable
"set autochdir " -- This setting affects NERDTree-git-plugin
" set macligatures
" Clear hlsearch
:command C let @/=""
" Change cursor based on mode -- tmux running in iTerm2 on macos *only*!
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\" " insert
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\" " replace
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\" " normal
" These speed up the transition of the cursor
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast
" }}}

" Build: {{{
" Add scripts to runtime path
" TODO - fix this?
" set rtp^=~/.scripts
" TODO - can this run in a separate tmux pane?
" nnoremap <F6> :!~/.scripts/api-build.sh<CR>
" }}}

" Buffers: {{{
map <A-TAB> :bnext<CR>
map <A-S-TAB> :bp<CR>
" This will close the current buffer without closing the 'vsplit'
nmap <silent> <leader><F2> :bnext\|:bd #<CR>
" I'd prefer it to close the buffer and window associated with it
map <F2> :bd<CR>
" }}}

" Tabs: {{{
" Consoles do not support the use of TAB
" map <C-S-TAB> :tabprev<CR>
" map <C-TAB> :tabnext<CR>
noremap <silent> <F4> :tabclose<CR>
noremap <silent> <C-t> :tabnew<CR>
noremap <silent> th :tabfirst<CR>
noremap <silent> tj :tabnext<CR>
noremap <silent> tk :tabprev<CR>
noremap <silent> tl :tablast<CR>
noremap <silent> tt :tabedit<Space>
noremap <silent> tn :tabnew<Space>
noremap <silent> tm :tabm<Space> 
noremap <silent> td :tabclose<CR>
" Go to last active tab 
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
" }}}

" Theme: {{{
" set guifont=Lucida\ Console:h11
set guifont=FiraCodeNerdFontComplete-Regular:h14
" colorscheme jellybeans
" colorscheme industry
" }}}
 

" Default to Documents folder
cd ~/src/Levitate-API

set nowrap

