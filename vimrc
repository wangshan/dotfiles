" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" General {{{
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  au BufReadPost *.hsc set syntax=haskell
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set nobackup
set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
set splitbelow
set splitright

autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

try
    set guifont=Monaco:h14
catch
    set guifont=consolas:h12
endtry

set fileformat=unix
set colorcolumn=80

" allow switching buffer without saving the current one
set hidden
set backupdir=.,$TEMP

" can save swap file for [no name]
set directory=.,$TEMP

" grey out text quoted by ~~
au BufRead,BufNewFile *.txt   syntax match StrikeoutMatch /\~\~.*\~\~/
hi def  StrikeoutColor   ctermbg=darkblue ctermfg=darkgrey    guibg=darkblue guifg=darkgrey
hi link StrikeoutMatch StrikeoutColor

au BufRead,BufNewFile *.txt   syntax match StaredMatch /__.*__/
hi def  StaredColor   ctermbg=black ctermfg=darkyellow    guibg=black guifg=darkyellow
hi link StaredMatch StaredColor

if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  filetype plugin on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" }}}


" Key Mapping {{{
map <F5> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" Yank(copy) to system clipboard
noremap <leader>y "+y

" ctrl + l in insert mode to split line
imap <C-l> <CR><Esc>O

" tags hot keys
"nnoremap <silent> <F12> :TlistToggle<CR>
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" comment hot keys
map ,# :s/^/#/<CR>:nohlsearch<CR>
map ,/ :s/^/\/\//<CR>:nohlsearch<CR>
map ,> :s/^/> /<CR>:nohlsearch<CR>
map ," :s/^/\"/<CR>:nohlsearch<CR>
map ,% :s/^/%/<CR>:nohlsearch<CR>
map ,! :s/^/!/<CR>:nohlsearch<CR>
map ,; :s/^/;/<CR>:nohlsearch<CR>
map ,- :s/^/--/<CR>:nohlsearch<CR>
map ,~ :s/^\(.*\)$/\~\~\1\~\~/<CR>:nohlsearch<CR>
map ,_ :s/^\(.*\)$/__\1__/<CR>:nohlsearch<CR>
map ,s :s/\~\~\(.*\)\~\~/\1/<CR>:nohlsearch<CR>
map ,x :s/__\(.*\)__/\1/<CR>:nohlsearch<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>
map <F7> ,/
map <F8> ,#
map <F9> ,c
map <F10> ,"
map <F11> ,~
map <F12> ,s

" press jj to go back to normal mode
inoremap jj <ESC>
inoremap jk <ESC><CR>

" add ; to end of line
inoremap kk <Esc>A;<Esc>

" }}}


" Plugins {{{

" Vundle {
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'https://github.com/kien/ctrlp.vim.git'
Bundle 'ack.vim'
Bundle 'a.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'https://github.com/tpope/vim-abolish.git'
Bundle 'scrooloose/nerdtree'
Bundle 'nanotech/jellybeans.vim'
Bundle 'godlygeek/tabular'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'rust-lang/rust.vim'
Bundle 'tpope/vim-surround'
Bundle 'mattn/emmet-vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/MatchTagAlways'
Bundle 'Raimondi/delimitMate'
Bundle 'isRuslan/vim-es6'
Bundle 'leafgarland/typescript-vim.git'

call vundle#end()
filetype plugin indent on

" }

" colorscheme {
try
    "set background=dark
    " if the colorscheme is managed by vundle, it must appear after Bundle..
    "colorscheme jellybeans
    ":highlight Comment ctermfg=darkgrey
catch
endtry
" }

" CtrlP {
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_working_path_mode='ra'
set wildignore+=*/tmp/*,*.d,*.o,*.hi,*.so,*.swp,*.zip,*.pdf,*.png,*.jpg,*.gif
let g:ctrlp_custom_ignore={
  \ 'dir':  '\v[\/](node_modules|bower_components|_temp|dist|compiled)|\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
" }

" NERDTree {
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
" }

" Fugitive {
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
nnoremap <silent> <leader>gg :GitGutterToggle<CR>
" }

" YCM {
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
nnoremap <leader>jD :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToImprecise<CR>
nnoremap <Leader>jt :YcmCompleter GetType<CR>
let g:ycm_key_invoke_completion='<C-k>'
let g:ycm_auto_trigger=0
" These are the tweaks I apply to YCM's config, you don't need them but they
" might help." YCM gives you popups and splits by default that some people
" might not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
set completeopt-=preview
if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
let g:typescript_indent_disable = 1
" }
                                                                     
" }}}


" MacVim specific settings
set go-=T

" syntax hightlight for cmake
au BufNewFile,BufRead CMakeLists.txt set filetype=cmake

" close auto complete window after selection
autocmd CompleteDone * pclose

