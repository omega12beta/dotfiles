""" Because I'm Dumb """
"" <M-m>=<Alt-m> <C-m>=<Ctrl-m> """

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/zsh
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" set leader key
let mapleader=","
let maplocalleader= "\\"

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
" switch cursor to line when in insert mode, and block when not
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
\,sm:block-blinkwait175-blinkoff150-blinkon175

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

" enable 24 bit color support if supported
if (has("termguicolors"))
    if (!(has("nvim")))
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    set termguicolors
endif

set nocompatible
filetype plugin indent on
syntax on

" copy indent from current line when starting a new line
set autoindent

" Give more space for displaying messages.
set cmdheight=2

" syntax highlighting
syntax enable

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"" Abbreviations
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
set history=1000 " change history to 1000
set textwidth=120

if (has('nvim'))
    " show results of substition as they're happening
    " but don't open a split
    set inccommand=nosplit
endif

set backspace=indent,eol,start " make backspace behave in a sane manner
set clipboard=unnamed

if has('mouse')
    set mouse=a
endif

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
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set wildmode=list:longest " complete files like a shell
set title " set terminal title
set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink
set updatetime=300
set signcolumn=yes
set shortmess+=c

""" Other Configurations
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
set number
set title

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

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Startify then NERDTree, on startup
autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                \ |   NERDTree
                \ |   wincmd w
                \ | endif

" Start Plugin Block
call plug#begin('~/.vim/plugged')

" Start Screen
Plug 'mhinz/vim-startify'
" Neat UI
" Plug 'Shougo/denite.nvim', { 'do': function('DoRemote') }
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
"Syntastic
    Plug 'scrooloose/syntastic'
" Completion
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-marketplace' 
" Fuzzy Search Files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Gtags Stuff   
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
" Tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Search Definitions
Plug 'pechorin/any-jump.vim'
" Search
Plug 'ctrlpvim/ctrlp.vim'
" Spelling Part2 (Well I guess its out of order now)
Plug 'reedes/vim-lexical'
" Easier Nav
Plug 'easymotion/vim-easymotion'
" Tagbar
Plug 'majutsushi/tagbar'
" Yank replaces Copy in vim so make it easier
Plug 'vim-scripts/YankRing.vim'
" Can you even spell bro
Plug 'tpope/vim-abolish'
" Multi Cursor Support
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'SirVer/ultisnips'
" Split OneLine Code - MultiLine Code
Plug 'AndrewRadev/splitjoin.vim'
" VimWiki Notes
Plug 'vimwiki/vimwiki'
" Language Support/Syntax/Formatting
Plug 'sheerun/vim-polyglot'
" Buffer Nav
Plug 'jeetsukumaran/vim-buffergator'
" Solarized Theme
Plug 'overcache/NeoSolarized'
" Prettier for Vim
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Better ()
Plug 'frazrepo/vim-rainbow'
" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'
" auto-close plugin
Plug 'rstacruz/vim-closer'
" Search Man Pages
Plug 'vim-utils/vim-man'
" Distraction free
Plug 'reedes/vim-colors-pencil'
Plug 'junegunn/goyo.vim'
"Its my goddamn computer
Plug 'vim-scripts/sudo.vim'
" Session Manager
Plug 'tpope/vim-obsession'
" Easy Scratchpad
Plug 'mtth/scratch.vim'
" Semantic Manager, Style Manager
Plug 'reedes/vim-wordy'
" Spelling
Plug 'dpelle/vim-languagetool'
" Syntax for i3-config
Plug 'potatoesmaster/i3-vim-syntax'
" I'm not 100% sure
Plug 'shougo/neco-syntax'
" Linting and Make Framework 
Plug 'neomake/neomake'
" Autocomplete Menu
Plug 'vim-scripts/AutoComplPop'
" UNIX Integration
Plug 'tpope/vim-eunuch'
" Please don't load til end
Plug 'ryanoasis/vim-devicons'

call plug#end()

"""""""""""""""""""""
"" Plugin Settings ""
"""""""""""""""""""""

" Startify Settings "
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction
let g:startify_lists = [
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']}
        \]

" NerdTree Settings "
    "" NERDTree configuration
    "  <leader>n - Toggle NERDTree on/off
    "  <leader>f - Opens current file location in NERDTree
    nmap <leader>n :NERDTreeToggle<CR>
    nmap <leader>f :NERDTreeFind<CR>
    let g:NERDTreeChDirMode=2
    let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
    let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
    let g:NERDTreeShowBookmarks=1
    let g:nerdtree_tabs_focus_on_files=1
    let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
    let g:NERDTreeWinSize = 31
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
    let NERDTreeQuitOnOpen = 1
    let NERDTreeAutoDeleteBuffer = 1
    let NERDTreeShowHidden = 1
    let NERDTreeSortHiddenFirst = 1
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1

" NerdTreeGit Settings "
    let g:NERDTreeGitStatusShowIgnored = 1  "enables ignored highlighting
    let g:NERDTreeGitStatusNodeColorization = 1  "enables colorization
    let g:NERDTreeGitStatusWithFlags = 1  "enables flags, (may be default), required for colorization

" NerdCommenter Settings"
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1
    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'
    " Set a language to use its alternate delimiters by default
    let g:NERDAltDelims_java = 1
    " Add your own custom formats or override the defaults
    let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1
    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1
    " Enable NERDCommenterToggle to check all selected lines is commented or not 
    let g:NERDToggleCheckAllLines = 1
    " NerdCommenter {{{
    let g:NERDSpaceDelims = 1                  " Leave space after comment delimiter
    let g:NERDCreateDefaultMappings = 0        " Disable default mappings
    let g:NERDCustomDelimiters = {'python': {'left': '#'}}  " Fix python spacing
    " Mappings (for both normal and visual mode)
    map <Leader>cc <Plug>NERDCommenterComment
    map <Leader>cu <Plug>NERDCommenterUncomment
    map <Leader>ce <Plug>NERDCommenterToEOL
    map <Leader>ac <Plug>NERDCommenterAppend

" Syntastic Settings "
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

" COC Settings "
    let g:coc_global_extensions = [
          \ 'coc-emoji',
          \ 'coc-tsserver',
          \ 'coc-html',
          \ 'coc-css',
          \ 'coc-json',
          \ 'coc-eslint',
          \ 'coc-tslint-plugin',
          \ 'coc-prettier',
          \ 'coc-stylelint',
          \ 'coc-pyls',
          \ 'coc-java',
          \ 'coc-rls',
          \ 'coc-solargraph',
          \ 'coc-yaml',
          \ 'coc-highlight',
          \ 'coc-emmet',
          \ 'coc-vimlsp',
          \ 'coc-snippets',
          \ 'coc-imselect',
          \ 'coc-yank',
          \ 'coc-pairs',
          \ 'coc-git',
          \ 'coc-go',
          \ 'coc-lists',
          \ 'coc-diagnostic',
          \ 'coc-gitignore',
          \ 'coc-project',
          \ 'coc-post',
          \ 'coc-clock',
          \ 'coc-marketplace',
          \ 'coc-smartf',
          \ 'coc-jest',
          \ 'coc-calc',
          \ 'coc-webpack',
          \ 'coc-explorer',
          \ 'coc-spell-checker',
          \ 'coc-cspell-dicts',
          \ 'coc-actions',
          \ 'https://github.com/xabikos/vscode-react',
          \ 'https://github.com/xabikos/vscode-javascript'
          \]
" COC {{{
  " Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
augroup COC
  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()
  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " Use `[d` and `]d` to navigate diagnostics
  nmap <silent> [d <Plug>(coc-diagnostic-prev)
  nmap <silent> ]d <Plug>(coc-diagnostic-next)
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  " Show documentation in preview window with alt-K
  nnoremap <silent> <M-k> :call <SID>show_documentation()<CR>
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)
  " Remap for format selected region
  vmap <leader>ft  <Plug>(coc-format-selected)
  nmap <leader>ft  <Plug>(coc-format-selected)
  augroup COC_mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    " Correct highlighting of comments in coc-settings.json.
    autocmd FileType json syntax match Comment +\/\/.\+$+
  augroup end
  " Remap for do codeAction of selected region, ex: `<leader>aap` for current
  " paragraph
  vmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)
  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)
  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')
  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)
  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <leader>d  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>
augroup end

" FZF Settings "
    map <C-p> :FZF<CR>
    nnoremap <silent> <leader>f :Files<CR>
    nmap <leader>b :Buffers<CR>
    nmap <leader>c :Commands<CR>
    nmap <leader>t :BTags<CR>
    nmap <leader>/ :Rg<CR>
    nmap <leader>gc :Commits<CR>
    nmap <leader>gs :GFiles?<CR>
    nmap <leader>sh :History/<CR>
    nmap <F1> <plug>(fzf-maps-n)
    imap <F1> <plug>(fzf-maps-i)
    vmap <F1> <plug>(fzf-maps-x)
    let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" GTags Settings "
    " enable gtags module
    let g:gutentags_modules = ['ctags', 'gtags_cscope']
    " generate datebases in my cache directory, prevent gtags files polluting my project
    let g:gutentags_cache_dir = expand('~/.cache/tags')
    " change focus to quickfix window after search (optional).
    let g:gutentags_plus_switch = 1
    "Keys (to change if needed)
    let g:gutentags_plus_nomap = 1
    set tags=./.tags;,.tags
    let g:gutentags_project_root = ['.root', '.git', '.svn', '.hg', '.project']
    let g:gutentags_ctags_tagfile = '.tags'
    let g:gutentags_ctags_extra_args = ['--output-format=e-ctags']
    let g:gutentags_ctags_exclude = ['*.json', '*.js', '*.ts', '*.jsx', '*.css', '*.less', '*.sass', '*.go', '*.dart', 'node_modules', 'dist', 'vendor']
    noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
    noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
    noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
    noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
    noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
    noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
    noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
    noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
    noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
    noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>

" Airline Settings "
    let g:airline#extensions#ale#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:airline_theme='solarized'
    let g:airline_solarized_bg='dark'
    let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
    let g:airline_section_warning = ''
    let g:airline_extensions = ['branch', 'hunks', 'coc', 'tabline']
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
    let g:airline_skip_empty_sections = 1
    let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
    let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
    " Configure error/warning section to use coc.nvim
    let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
    let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
    " t[number] => switch to the file showed in the top tabs
    " t[ t] => prev tab/next tab
    nmap <leader>t1 <Plug>AirlineSelectTab1
    nmap <leader>t2 <Plug>AirlineSelectTab2
    nmap <leader>t3 <Plug>AirlineSelectTab3
    nmap <leader>t4 <Plug>AirlineSelectTab4
    nmap <leader>t5 <Plug>AirlineSelectTab5
    nmap <leader>t6 <Plug>AirlineSelectTab6
    nmap <leader>t7 <Plug>AirlineSelectTab7
    nmap <leader>t8 <Plug>AirlineSelectTab8
    nmap <leader>t9 <Plug>AirlineSelectTab9
    nmap <leader>t[ <Plug>AirlineSelectPrevTab
    nmap <leader>t] <Plug>AirlineSelectNextTab

" Fugitive Settings "
    map <C-g>s :Gstatus<CR>
    map <C-g>b :Gblame<CR>
    map <C-g>c :Gcommit
    map <C-g>h :Git checkout 
    map <C-g>r :Gread<CR>
    map <C-g>w :Gwrite<CR>
    map <C-g>d :Gdiff<CR>
    map <C-g>p :Gpush<CR>
    map <C-g>g :Gpull<CR>

" GitGutter Settings "
    nmap ghs <Plug>(GitGutterStageHunk)
    nmap ghu <Plug>(GitGutterUndoHunk)
    let g:gitgutter_grep = 'ag'
    autocmd BufWritePost * GitGutter
    let g:gitgutter_map_keys = 0           " Disable default mappings
    " Custom Maps
    nnoremap <silent> <Leader>gg :GitGutterSignsToggle<CR>
    nmap ]h <Plug>(GitGutterNextHunk)<bar>zvzz
    nmap [h <Plug>(GitGutterPrevHunk)<bar>zvzz
    nmap <Leader>hp <Plug>(GitGutterPreviewHunk)

" Any-Jump Settings "
    " Normal mode: Jump to definition under cursore
    nnoremap <leader>j :AnyJump<CR>
    " Visual mode: jump to selected text in visual mode
    xnoremap <leader>j :AnyJumpVisual<CR>
    " Normal mode: open previous opened file (after jump)
    nnoremap <leader>ab :AnyJumpBack<CR>
    " Normal mode: open last closed search window again
    nnoremap <leader>al :AnyJumpLastResults<CR>
    " Show line numbers in search rusults
    let g:any_jump_list_numbers = 0
    " Auto search references
    let g:any_jump_references_enabled = 1
    " Auto group results by filename
    let g:any_jump_grouping_enabled = 0
    " Amount of preview lines for each search result
    let g:any_jump_preview_lines_count = 5
    " Max search results, other results can be opened via [a]
    let g:any_jump_max_search_results = 10
    " Prefered search engine: rg or ag
    let g:any_jump_search_prefered_engine = 'ag'
    " Search results list styles:
    let g:any_jump_results_ui_style = 'filename_first'
    " Remove comments line from search results (default: 1)
    let g:any_jump_remove_comments_from_results = 1
    " Custom ignore files
    " default is: ['*.tmp', '*.temp']
    let g:any_jump_ignored_files = ['*.tmp', '*.temp']

" CtrlP Settings "
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

" Lexical Settings "
    let g:lexical#spell_key = '<leader>s'
    let g:lexical#thesaurus_key = '<leader>t'
    let g:lexical#dictionary_key = '<leader>k'
    let g:lexical#dictionary = ['/usr/share/lexicon/spellcheck',]
    augroup lexical
      autocmd!
      autocmd FileType markdown,mkd call lexical#init()
      autocmd FileType textile call lexical#init()
      autocmd FileType text call lexical#init({ 'spell': 0 })
    augroup END

" EasyMotion Settings "
    " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)
    " s{char}{char} to move to {char}{char}
    nmap s <Plug>(easymotion-overwin-f2)
    " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)
    " Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)

" Tagbar Settings "
nmap <leader>tt :TagbarToggle<CR>

" Prettier Settings "
let g:prettier#autoformat = 1
nmap <Leader>py <Plug>(Prettier)

" Rainbow () Settings "
    let g:rainbow_active = 1

" Devicons Settings "
    let g:webdevicons_enable = 1
    let g:webdevicons_enable_nerdtree = 1
    let g:webdevicons_enable_unite = 1
    let g:webdevicons_enable_vimfiler = 1
    let g:webdevicons_enable_airline_tabline = 1
    let g:webdevicons_enable_airline_statusline = 1
    let g:webdevicons_enable_ctrlp = 1
    let g:webdevicons_enable_flagship_statusline = 1
    let g:WebDevIconsUnicodeDecorateFileNodes = 1
    let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
    let g:webdevicons_conceal_nerdtree_brackets = 1
    let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
    let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
    let g:webdevicons_enable_denite = 1
    let g:WebDevIconsUnicodeDecorateFolderNodes = 1
    let g:DevIconsEnableFoldersOpenClose = 1
    let g:DevIconsEnableFolderPatternMatching = 1
    let g:DevIconsEnableFolderExtensionPatternMatching = 1
    let g:WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1

" Color Settings "
colorscheme NeoSolarized
set background=dark

" GOYO Settings "
function! s:goyo_enter()
    colorscheme pencil
endfunction
function! s:goyo_leave()
    colorscheme NeoSolarized
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>
"" Close buffer
noremap <leader>c :bd<CR>

" Quick window switching
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l