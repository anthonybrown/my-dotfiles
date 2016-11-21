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

if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif

syntax on
filetype off
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()
Plugin 'vundlevim/vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'mxw/vim-jsx'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'jacoborus/tender'
Plugin 'chrisktenderempson/base16-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
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
set nocompatible
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
colorscheme OceanicNext
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
  colorscheme OceanicNext
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
let jshint2_save = 1
command! H let @/=" "
fun! <sid>striptrailingwhitespaces()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l,c)
endfun
autocmd BufWritePre * :call <sid>striptrailingwhitespaces()
autocmd FileType c,cpp,java,php,js,html autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
au BufNewFile,BufRead *.ejs set filetype=html
au BufRead,BufNewFile *.scss set filetype=scss.css
autocmd BufNewFile,BufReadPre *.js let b:syntastic_checkers = ['eslint']
"autocmd FileType html,css,javascript.jsx EmmetInstall
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

filetype plugin indent on

" softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" display extra whitespace
"set list listchars=tab:»·,trail:·,nbsp:·

" make it obvious where 80 characters is
set textwidth=90
set colorcolumn=+1

" numbers
set number
set numberwidth=5
set spellfile=$home/.vim-spell-en.utf-8.add
set spell

" autocomplete with dictionary words when spell check is on
set complete+=kspell

" always use vertical diffs
set diffopt+=vertical
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
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 75 :vertical resize 120<cr>
nmap <C-b> :NERDTreeToggle<cr>
nmap :sp :rightbelow sp<cr>
nmap :bp :Buffsurfback<cr>
nmap :bn :Buffsurfforward<cr>
highlight search cterm=underline
" nerdtree show hidden files
let NERDTreeShowHidden=1
set statusline+=%#warningmsg#
set statusline+=%{syntasiticstatuslineflag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_lock_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['standard']
let g:jsx_ext_required=0
