execute pathogen#infect()
call pathogen#helptags()

if has ('autocmd')
  autocmd!
endif

if has ('syntax')
  syntax enable
endif

if (has("termguicolors"))
 set termguicolors
endif

set nocompatible
syntax on
filetype off
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()
plugin 'vundlevim/vundle.vim'
plugin 'tpope/vim-fugitive'
plugin 'mxw/vim-jsx'
plugin 'marcweber/vim-addon-mw-utils'
plugin 'tomtom/tlib_vim'
plugin 'garbas/vim-snipmate'
plugin 'honza/vim-snippets'
plugin 'pangloss/vim-javascript'
plugin 'mustache/vim-mustache-handlebars'
plugin 'jacoborus/tender'
plugin 'chrisktenderempson/base16-vim'
plugin 'scrooloose/nerdcommenter'
plugin 'scrooloose/nerdtree'
plugin 'xuyuanp/nerdtree-git-plugin'
plugin 'vim-airline/vim-airline'
plugin 'vim-airline/vim-airline-themes'
plugin 'whatyouhide/vim-gotham'
plugin 'mattn/emmet-vim'
plugin 'flazz/vim-colorschemes'
bundle 'justinj/vim-react-snippets'
bundle 'cakebaker/scss-syntax.vim'
bundle 'moll/vim-node'
call vundle#end()
filetype plugin indent on
set t_co=256
set background=dark
set ff=unix
let g:solarized_termcolors=256
" color mango
" colorscheme jellybeans
" colorscheme kolor
" colorscheme seti
" colorscheme base
" colorscheme tender
" colorscheme base16-chalk
" colorscheme tomorrow-night
" colorscheme gruvbox
" colorscheme railscasts
" colorscheme srcery
" colorscheme gotham256
" colorscheme solarized
colorscheme oceanicnext
" set fonts
set guifont=menlo\ for\ powerline:h22
set guioptions-=t
set guioptions-=r
set go-=l
set hidden

" set colorscheme for macvim
if has ("gui_running")
  set background=dark
  " colorscheme gotham
  "colorscheme srcery
  colorscheme oceanicnext
  "colorscheme gruvbox
  "colorscheme railscast
  "colorscheme base16-default
  "colorscheme base16-chalk
  set guifont=meslo\ lg\ l\ dz\ for\ powerline:h20
endif

set backspace=2   " backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " always display the status line
set autowrite     " automatically :write before running commands
set title
set showmode
set clipboard=unnamed
set encoding=utf-8 nobomb
set binary
set viminfo+=!
set timeoutlen=1000
set ttimeoutlen=0
set visualbell
set noerrorbells
set mouse=a
set laststatus=2
set ttyfast
set ttymouse=xterm
set undofile
set undodir=~/.vim/_undo/
set wildmenu
set nostartofline
set wrapscan
set showmatch
set lazyredraw
set ruler
set virtualedit=block
set runtimepath^=~/.vim/bundle/node
set filetype=javascript.jsx
let g:mustache_abbreviations = 1
command! h let @/=" "
fun! <sid>striptrailingwhitespaces()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l,c)
endfun
autocmd bufwritepre * :call <sid>striptrailingwhitespaces()
autocmd filetype c,cpp,java,php,js,html autocmd bufwritepre <buffer> :%s/\s\+$//e
autocmd bufwritepre *.html :%s/\s\+$//e
au bufnewfile,bufread *.ejs set filetype=html
au bufread,bufnewfile *.scss set filetype=scss.css
autocmd bufnewfile,bufreadpre *.js let b:syntastic_checkers = ['eslint']
" switch syntax highlighting on, when the terminal has colors
" also switch on highlighting the last used search pattern.
"if (&t_co > 2 || has("gui_running")) && !exists("syntax_on")
"  syntax on
"endif

if filereadable(expand('~/.vimrc.bundles'))
  source ~/.vimrc.bundles
endif

" load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcex
  autocmd!

  " when editing a file, always jump to the last known cursor position.
  " don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd bufreadpost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " set syntax highlighting for specific file types
  autocmd bufread,bufnewfile appraisals set filetype=ruby
  autocmd bufread,bufnewfile *.md set filetype=markdown
  autocmd bufread,bufnewfile .{jscs,jshint,eslint}rc set filetype=json
augroup end

" when the type of shell script is /bin/sh, assume a posix-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" use one space, not two, after punctuation.
set nojoinspaces

" use the silver searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag in ctrlp for listing files. lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that ctrlp doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":ag")
    command -nargs=+ -complete=file -bar ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :ag<space>
  endif
endif

" make it obvious where 80 characters is
set textwidth=90
set colorcolumn=+1

" numbers
set number
set numberwidth=5


" get off my lawn
nnoremap <left> :echoe "use h"<cr>
nnoremap <right> :echoe "use l"<cr>
nnoremap <up> :echoe "use k"<cr>
nnoremap <down> :echoe "use j"<cr>


" treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" quicker window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}

" set spellfile to location that is guaranteed to exist, can be symlinked to
" dropbox or kept in git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$home/.vim-spell-en.utf-8.add
set spell

" autocomplete with dictionary words when spell check is on
set complete+=kspell

" always use vertical diffs
set diffopt+=vertical

" local config
if filereadable($home . "/.vimrc.local")
  source ~/.vimrc.local
endif

" airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:powerline_symbols = 'fancy'
let g:airline_theme = 'gotham'
let g:airline_theme = 'gotham256'
let mapleader = ','
let g:mapleader = ','
nmap <leader>w :w!<cr>
nnoremap j gj
nnoremap k gk
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <c-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 75 :vertical resize 120<cr>
nmap <c-b> :nerdtreetoggle<cr>
nmap :sp :rightbelow sp<cr>
nmap :bp :buffsurfback<cr>
nmap :bn :buffsurfforward<cr>
highlight search cterm=underline
" nerdtree show hidden files
let nerdtreeshowhidden=1
set statusline+=%#warningmsg#
set statusline+=%{syntasiticstatuslineflag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_lock_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_javascript_checkers = ['eslint', 'standard']
let g:jsx_ext_required=0
