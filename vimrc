execute pathogen#infect()
call pathogen#helptags()

if has ('autocmd')
  autocmd!
endif

if has ('syntax')
  syntax enable
endif

set nocompatible
syntax on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'mxw/vim-jsx'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'jacoborus/tender'
Plugin 'chrisktenderempson/base16-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'whatyouhide/vim-gotham'
Plugin 'mattn/emmet-vim'
Plugin 'flazz/vim-colorschemes'
Bundle 'justinj/vim-react-snippets'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'moll/vim-node'
call vundle#end()
filetype plugin indent on
set t_Co=256
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
" colorscheme Tomorrow-Night
" colorscheme gruvbox
" colorscheme railscasts
" colorscheme srcery
" colorscheme gotham256
colorscheme solarized
" Set fonts
set guifont=menlo\ for\ powerline:h22
set guioptions-=T
set guioptions-=r
set go-=L
set hidden

" Set colorscheme for macvim
if has ("gui_running")
  set background=dark
  " colorscheme gotham
  colorscheme srcery
  "colorscheme gruvbox
  "colorscheme railscast
  "colorscheme base16-default
  "colorscheme base16-chalk
  set guifont=meslo\ LG\ L\ DZ\ for\ powerline:h20
endif

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
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
command! H let @/=" "
fun! <SID>StripTrailingWhitespaces()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l,c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
autocmd FileType c,cpp,java,php,js,html autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
au BufNewFile,BufRead *.ejs set filetype=html
au BufRead,BufNewFile *.scss set filetype=scss.css
autocmd BufNewFile,BufReadPre *.js let b:syntastic_checkers = ['eslint']
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
"  syntax on
"endif

if filereadable(expand('~/.vimrc.bundles'))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
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

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Make it obvious where 80 characters is
set textwidth=90
set colorcolumn=+1

" Numbers
set number
set numberwidth=5


" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add
set spell

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_theme = 'gotham'
let g:airline_theme = 'gotham256'
let mapleader = ','
let g:mapleader = ','
nmap <leader>w :w!<cr>
nnoremap j gj
nnoremap k gk
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 75 :vertical resize 120<cr>
nmap <C-b> :NERDTreeToggle<cr>
nmap :sp :rightbelow sp<cr>
nmap :bp :BuffSurfBack<cr>
nmap :bn :BuffSurfForward<cr>
highlight Search cterm=underline
" NERDTree show hidden files
let NERDTreeShowHidden=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasiticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_lock_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_javascript_checkers = ['eslint', 'standard']
let g:jsx_ext_required=0
