" Plugins {{{
let s:rc = expand( "$HOME/.vimrc_plugins" )
if filereadable( s:rc )
  " note that NixOS is handling plugins differently
  " so, there is no .vimrc_plugins file for NixOS configuration
  execute ':source '.s:rc
endif
" }}}

" Basic {{{
syntax on
filetype plugin indent on
set nocompatible
set number
set relativenumber
set nowrap
set showmode
set textwidth=0
set colorcolumn=0
set smartcase
set smarttab
set smartindent
set autoindent
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set incsearch
set hlsearch
set ignorecase
set mouse=a
set history=1000
" set clipboard=unnamedplus,autoselect
set completeopt=menuone,menu,longest
set t_Co=256
set cmdheight=1
set encoding=utf-8
set fileencodings=utf-8
" set nospell
" set nobackup
" set noswapfile
" set noundofile
set hidden
set nocursorline
set laststatus=2
set backspace=indent,eol,start
set linespace=1
set showmatch
set foldmethod=marker
set foldenable
set foldlevelstart=10
set foldnestmax=10
set listchars=tab:•\ ,trail:•,extends:»,precedes:« 
set list
set showbreak=>>\ 
set lazyredraw
" set diffopt+=iwhite
if exists('g:loaded_fugitive')
  set statusline+=%{fugitive#statusline()}
endif
" }}}

" GUI {{{
if has( "gui_running" )
  set columns=153
  set lines=38
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  if has('win32')
    set guifont=DejaVu_Sans_Mono_for_Powerline:h11:cRUSSIAN
  elseif has('unix')
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
  endif
  set background=dark
  colorscheme PaperColor
  " let g:PaperColor_Dark_Override = { 'background' : '#1c1c1c', 'cursorline' : '#abcdef', 'matchparen' : '#3a3a3a', 'comment' : '#5f875f' }
  " let g:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }
else
  set background=dark
  colorscheme default
endif
" }}}

" CtrlP {{{
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_show_hidden = 1
let g:ctrlp_path_nolim = 1
noremap <leader>f<space> :CtrlP<cr>
noremap <leader>b<space> :CtrlPBuffer<cr>
noremap <leader>d<space> :CtrlPDir<cr>
noremap <leader>q<space> :CtrlPQuickfix<cr>
noremap <leader>t<space> :CtrlPTag<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'
if has('win32')
  set wildignore+=*\\.stack-work\\*,*\\packages\\*,*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
else
  set wildignore+=*/.stack-work/*,*/packages/*,*/tmp/*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
endif
set wildmode=longest,list,full
set wildmenu
" }}}

" Syntastic {{{
map <Leader>s :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
if exists('g:syntastic_always_populate_loc_list')
  set statusline+=%{SyntasticStatuslineFlag()}
endif
set statusline+=%*
" }}}

" Haskell {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" == ghc-mod ==

" map <silent> ts :GhcModSplitFunCase<CR>
map <silent> ti :GhcModTypeInsert<CR>
map <silent> tt :GhcModType<CR>
map <silent> tc :GhcModTypeClear<CR>

" == supertab ==

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

" == neco-ghc ==

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" == tabular ==

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a, :Tabularize /<-<CR>
vmap al :Tabularize /[\[\\|,]<CR>

" }}}

" Mapping {{{
:nnoremap <F5> :make<CR>
:nnoremap <leader><leader> :nohlsearch<CR>
" set scrolloff to toggle always placing cursor in the middle
:nnoremap <leader>zz :let &scrolloff=999-&scrolloff<CR>
" visual block movement
:vnoremap J :m '>+1<CR>gv=gv
:vnoremap K :m '<-2<CR>gv=gv
" highlight last inserted code
:nnoremap gV `[v`]
" buffer management
:nnoremap <C-h> :bp<CR>
:nnoremap <C-l> :bn<CR>
:nnoremap <C-j> :bd<CR>
":nnoremap <C-k> :tabnew<CR>
:nnoremap <C-n> :NERDTreeToggle<CR>
" " Auto-detect encoding
" :nnoremap <leader>x :FencAutoDetect<CR>
" }}}

" Configure airline {{{
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts=1
if has( "gui_running" )
  let g:airline_powerline_fonts = 1
  let g:airline_theme='papercolor'
else
  let g:airline_theme='papercolor'
endif
" }}}

" LaTeX {{{
"au BufEnter *.tex setl tw=79 tx ts=4 sw=4 fo+=n2a
au BufEnter *.tex setl tw=80
if has('unix')
  au BufEnter *.tex nnoremap <buffer> <F7> :silent !xdg-open '%:p:r.pdf' &<CR>
endif
" }}}

" Markdown {{{
au BufEnter *.md set tw=80
au BufEnter *.md set filetype=markdown
au BufEnter *.md set syntax=markdown
" }}}

" Xml {{{
" recognize Xml format
au BufEnter *.xml set filetype=xml
au BufEnter *.xml set syntax=xml
au BufReadPre *.xml setlocal foldmethod=indent
" }}}

" Elm {{{
" let g:elm_jump_to_error = 0
" let g:elm_make_output_file = "elm.js"
" let g:elm_make_show_warnings = 0
" let g:elm_syntastic_show_warnings = 0
" let g:elm_browser_command = ""
" let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 1
let g:elm_classic_highlighting = 0
" au BufEnter *.elm nnoremap <buffer> <leader> f :ElmFormat<CR>
" }}}
