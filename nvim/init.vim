" Windows: change this file to _vimrc

" Plugins: {{{
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(expand('~/.config/nvim/plugged'))

" Plugins UI: {{{

Plug 'arcticicestudio/nord-vim'

" }}}

" Plugins Functionality: {{{
"
Plug 'tpope/vim-fugitive'                           " Fugitive - Git pluging
Plug 'tpope/vim-rhubarb'                            " Enables GBrowse in Fugitive
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Vim  integration, used as OmniSharp selector
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'                        " Statusline
Plug 'kamykn/spelunker.vim'                         " Spelling for Pascal/camel/etc cases

" Editor Config
Plug 'editorconfig/editorconfig-vim'                " https://github.com/editorconfig/editorconfig-vim
" }}}

" Plugins Workspace: {{{
"
if filereadable(".vimrc.plugins")
    so .vimrc.plugins
endif
"}}}

" Initialize plugin system
call plug#end()

" }}}

" Settings: {{{

let mapleader = "\<SPACE>"

set expandtab
set shiftround
set shiftwidth=4
set softtabstop=-1
set tabstop=4
set textwidth=100
set title
set smarttab
set hidden
set nostartofline
set splitbelow
set splitright
set incsearch ignorecase smartcase hlsearch             " Highlight search
set number relativenumber                               " Line numbers -- hybrid
set ruler                                               " Position in file -- bottom right
set signcolumn=yes

" Enable mouse for all modes
set mouse=a

" Default is 4000ms. This should allow GitGutter to update more frequently
set updatetime=250

" lightline fix
set laststatus=2

" Spell file to git repository
set spellfile=~/.config/vim/spell/en.utf-8.add

" This is supposed to allow for system clipboard
" set clipboard=unnamedplus
" }}}

" Lightline: {{{
"\ 'colorscheme': 'jellybeans',
"\ 'colorscheme': 'gruvbox',
let g:lightline = {
\ 'colorscheme': 'nord',
\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
\ 'active': {
\   'left': [
\     ['mode', 'paste'],
\     ['gitbranch', 'filename', 'modified'],
\     ['readonly', 'tagbar']
\   ],
\   'right': [
\     ['lineinfo'], ['percent'],
\     ['fileformat', 'fileencoding', 'filetype' ]
\   ],
\ },
\ 'inactive': {
\   'right': [['lineinfo'], ['percent'], ['sharpenup']],
\   'left': [
\     ['mode', 'paste'],
\     ['readonly', 'filename', 'tagbar', 'modified']
\   ],
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead',
\ },
\}

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" This is the default extra key bindings
 let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
" }}}

" (fugitive) Git: {{{
nnoremap <silent> <leader>g :G<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
" Select buffer 3 -- on the right -- during merge conflic / diff view
nmap <leader>gj :diffget //3<CR>
" Select buffer 2 -- on the left -- during merge conflic / diff view
nmap <leader>gf :diffget //2<CR>
" }}}

" Spelunker: {{{
autocmd ColorScheme *
\ highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e |
\ highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE
" }}}

" END HERE }}}
"

" Misc: {{{
" set autochdir " -- This setting affects NERDTree-git-plugin
" set macligatures
" Clear hlsearch
:command C let @/=""

" Change cursor based on mode -- tmux running on macos *only*!
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\" " insert
" let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\" " replace
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\" " normal

" These speed up the transition of the cursor
" set ttimeout
" set ttimeoutlen=1
" set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
" set ttyfast
" }}}

" Buffers: {{{
map <A-TAB> :bnext<CR>
map <A-S-TAB> :bp<CR>
nmap <silent> <leader><F2> :bnext\|:bd #<CR>                        " This will close the current buffer without closing the 'vsplit'
map <F2> :bd<CR>                                                    " I'd prefer it to close the buffer and window associated with it
" }}}

" Tabs: {{{
" Consoles do not support the use of TAB
" map <C-S-TAB> :tabprev<CR>
" map <C-TAB> :tabnext<CR>
noremap <silent> <C-k> :tabnext<CR>
noremap <silent> <C-j> :tabprev<CR>
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

noremap <leader><Left> :-tabmove<cr>
noremap <leader><Right> :+tabmove<cr>
" Go to last active tab 
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
" }}}

nmap <leader>r :so ~/.vimrc<CR>     " reload vimrc

" Load custom vim settings
if filereadable(".vimrc.custom")
    so .vimrc.custom
endif

" Theme: {{{
" Load the theme _after_ loading custom vimrcs. Other extensions could be effecting color
" NOTE: For terminal/tmux vim the terminal font will be what is used!
set guifont=FiraCodeNerdFontComplete:h14
colorscheme nord
" }}}

