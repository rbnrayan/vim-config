" set leader key to comma
let g:mapleader = ","

language en_US.utf-8
syntax enable
filetype plugin on
setlocal scrolloff=1
set termguicolors
set mouse=a
set nocompatible
set encoding=utf-8
set hidden
set pumheight=10
set ruler
set cmdheight=1
set iskeyword+=-
set splitbelow
set splitright
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set autoindent
set number relativenumber
set showtabline=2
set laststatus=0
set nobackup
set nowritebackup
set updatetime=300
set timeoutlen=500
set formatoptions-=cro
set clipboard=unnamed
set clipboard+=unnamedplus
set nohlsearch
set wildmenu
set backspace=indent,eol,start
set cursorline
set nowrap
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set list
set listchars=
set listchars=eol:¬
set listchars+=tab:·\
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«

augroup python
  autocmd!

  autocmd FileType python setlocal noexpandtab tabstop=2 shiftwidth=2
augroup end
