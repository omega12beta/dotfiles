"==============================================================
"          Base Configuration                               {{{
"==============================================================

let mapleader = "\<Space>"
let maplocalleader = "\\"

if !empty(&viminfo)
  if has('nvim')
    set viminfo='50,<1000,s100,\"1000,!,n$HOME/.vim/info/nviminfo
  else
    set viminfo='50,<1000,s100,\"1000,!,n$HOME/.vim/info/viminfo
  endif
endif
set shellslash
"set lazyredraw
set complete+=k
set completeopt=menuone
if (v:version == 704 && has('patch775')) || v:version >= 705
  set completeopt+=noselect,noinsert
endif
set history=500
set timeout timeoutlen=500 ttimeoutlen=10

set tabstop=4 shiftwidth=4 softtabstop=0
set expandtab


set backspace=indent,eol,start
set formatoptions+=m
set binary noeol
set nofixeol
"set formatoptions+=j " Delete comment character when joining commented lines

" setting by vim-polyglot
" set iskeyword=48-57,192-255


set wildmenu
set wildmode=longest,list,full


set wrapscan
"set nowrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch


set splitbelow
set splitright

"set nobackup
set autoread
set noswapfile
set hidden
set backup
set backupdir     =$HOME/.vim/backup/
set backupext     =-vimbackup
set backupskip    =
set directory     =$HOME/.vim/swap/
set updatecount   =100
set undofile
set undodir       =$HOME/.vim/undo/
set nomodeline

if has('nvim') || (((exists('$DISPLAY') && executable('pbcopy'))
      \   || (exists('$DISPLAY') && executable('xclip'))
      \   || (exists('$DISPLAY') && executable('xsel')))
      \   && has('clipboard')
      \ )
  set clipboard&
  set clipboard^=unnamedplus,unnamed
endif

set vb t_vb=
set noerrorbells
set novisualbell

"set autochdir

" tags
if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif


" smart indent for long line
" if v:version >= 800
"   set breakindent
" endif


" }}