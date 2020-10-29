"==============================================================
"          Initial Configuration                            {{{
"==============================================================
" ==================== general config ======================== "{{{
set termguicolors                                       " Opaque Background
set mouse=a                                             " enable mouse scrolling
set clipboard+=unnamedplus                              " use system clipboard by default
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent     " tab width
set expandtab smarttab                                  " tab key actions
set incsearch ignorecase smartcase hlsearch             " highlight text while searching
set list listchars=trail:»,tab:»-                       " use tab to navigate in list mode
set fillchars+=vert:\▏                                  " requires a patched nerd font (try FiraCode)
set wrap breakindent                                    " wrap long lines to the width set by tw
set encoding=utf-8                                      " text encoding
set number                                              " enable numbers on the left
set relativenumber                                      " current line is 0
set title                                               " tab title as file name
set noshowmode                                          " dont show current mode below statusline
set noshowcmd                                           " to get rid of display of last command
set conceallevel=2                                      " set this so we wont break indentation plugin
set splitright                                          " open vertical split to the right
set splitbelow                                          " open horizontal split to the bottom
set tw=90                                               " auto wrap lines that are longer than that
set emoji                                               " enable emojis
set history=1000                                        " history limit
set backspace=indent,eol,start                          " sensible backspacing
set undofile                                            " enable persistent undo
set undodir=/tmp                                        " undo temp file directory
set inccommand=nosplit                                  " visual feedback while substituting
set showtabline=2                                       " always show tabline
set grepprg=rg\ --vimgrep                               " use rg as default grepper
set nocompatible
filetype plugin indent on
syntax on
" performance tweaks
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1
" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros
set magic " Set magic on, for regex
" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500
"" Appearance {{{
set number " show line numbers
set wrap " turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=↪
set autoindent " automatically set indent of new line
set ttyfast " faster redrawing
set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
set laststatus=2 " show the status line all the time
set so=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set wildmode=list:longest " complete files like a shell
set title " set terminal title
set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink
set updatetime=300
" Tab control
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
" code folding settings
set foldmethod=syntax " fold based on indent
set foldlevelstart=99
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1
"" Extra Syntax Stuff
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2
" Auto commands
autocmd FileType c,cpp,java,python,javascript autocmd BufWritePre <buffer> %s/\s\+$//e
" Transparent Background (For i3 and compton)
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE
" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
"" Abbreviations
" Some aliases for typoists
command W w
command Q q
command WQ wq
command Wq wq
command Qa qa
command QA qa
command Wa wa
command WA wa
command E e
abbr W! w!
abbr Q! q!
abbr Qall! qall!
abbr Wq wq
abbr Wa wa
abbr wQ wq
abbr WQ wq
abbr W w
abbr Q q
abbr Qall qall
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
abbr attribtue attribute
abbr attribuet attribute
set autoread " detect when a file is changed
set textwidth=120
" required by coc
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes

augroup vimrc
  autocmd!
augroup END