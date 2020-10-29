
"==============================================================
"         Display Settings                                  {{{
"==============================================================

"""" Themes """"
colorscheme NeoSolarized
set background=dark
set termguicolors
hi Pmenu guibg='#00010a' guifg=white                    " popup menu colors
hi Comment gui=italic cterm=italic                      " italic comments
hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
hi NonText guifg=bg                                     " mask ~ on empty lines
hi clear CursorLineNr                                   " use the theme color for relative number
hi CursorLineNr gui=bold                                " make relative number bold
hi SpellBad guifg=NONE gui=bold,undercurl               " misspelled words
" colors for git (especially the gutter)
hi DiffAdd  guibg=#0f111a guifg=#43a047
hi DiffChange guibg=#0f111a guifg=#fdd835
hi DiffRemoved guibg=#0f111a guifg=#e53935
" coc multi cursor highlight color
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

" ColorScheme
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set t_Co=256

" true color support
let colorterm=$COLORTERM
if colorterm=='truecolor' || colorterm=='24bit' || colorterm==''
  if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
endif

" colorscheme pluginconfig -> colorscheme
set nocursorline

set display=lastline
set showmatch
set matchtime=1
set showcmd
set number
set relativenumber
set wrap
"set list
"set listchars=tab:>
set notitle
if !&scrolloff
  set scrolloff=5
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set pumheight=10

"set foldmethod=marker
set foldmethod=manual
set foldlevel=1
set foldlevelstart=99
set foldcolumn=0

" Cursor style
if has('nvim')
  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
else
  " insert mode - line
  let &t_SI .= WrapForTmux("\<Esc>[5 q")
  " common - block
  let &t_EI .= WrapForTmux("\<Esc>[1 q")
  if (v:version == 704 && has('patch687')) || v:version >= 705
    " replace mode - underline
    let &t_SR .= WrapForTmux("\<Esc>[3 q")
  endif
endif

if exists('&cursorlineopt')
  set cursorlineopt=number
endif

" }}}