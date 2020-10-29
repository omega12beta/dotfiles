 "==============================================================
 "          Plugins                                          {{{
 "==============================================================

if has('vim_starting')
  let s:plugin_manager_dir='~/.vim/plugged/vim-plug'
  execute 'set runtimepath+=' . s:plugin_manager_dir
  if !isdirectory(expand(s:plugin_manager_dir))
    call system('mkdir -p ' . s:plugin_manager_dir)
    call system('git clone --depth 1 https://github.com/junegunn/vim-plug.git '
        \ . s:plugin_manager_dir . '/autoload')
  end
endif

call plug#begin(expand('~/.vim/plugged'))

Plug 'junegunn/vim-plug',
      \ {'dir': '~/.vim/plugged/vim-plug/autoload'}

" ================= looks and GUI stuff ================== "{{{
" Plug 'vim-airline/vim-airline'                          " airline status bar
" Plug 'vim-airline/vim-airline-themes'                   " Airline Themes
Plug 'ryanoasis/vim-devicons'                           " pretty icons everywhere
Plug 'luochen1990/rainbow'                              " rainbow parenthesis
Plug 'overcache/NeoSolarized'                           " solarized color themes
Plug 'gregsexton/MatchTag'                              " highlight matching html tags

Plug 'skywind3000/vim-quickui'

" ================= Denite ================== "
Plug 'romgrk/searchReplace.vim'
Plug 'liuchengxu/vim-clap', {'build': './install.sh'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'raghur/fruzzy', {'build': 'python3 ./python3/fruzzy_installer.py'}
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'hara/ctrlp-colorscheme'
Plug 'zeero/vim-ctrlp-help'
Plug 'fisadev/vim-ctrlp-cmdpalette'

" ================= Functionalities ================= "{{{
" Plug 'neoclide/coc.nvim', {'branch': 'release'}         " LSP and more
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " fzf itself
Plug 'junegunn/fzf.vim'                                 " fuzzy search integration
Plug 'SirVer/ultisnips'                                 " snippets manager
Plug 'honza/vim-snippets'                               " actual snippets
Plug 'Yggdroot/indentLine'                              " show indentation lines
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " better python
Plug 'tpope/vim-commentary'                             " better commenting
Plug 'mhinz/vim-startify'                               " cool start up screen
Plug 'tpope/vim-fugitive'                               " git support
Plug 'psliwka/vim-smoothie'                             " some very smooth ass scrolling
Plug 'tpope/vim-eunuch'                                 " run common Unix commands inside Vim
Plug 'machakann/vim-sandwich'                           " make sandwiches
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Syntax
Plug 'scrooloose/syntastic'

" File Explorer
Plug 'scrooloose/nerdtree'

" substitute, search, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" Focus
Plug 'junegunn/goyo.vim'

" Prettier for Vim
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Search Man Pages
Plug 'vim-utils/vim-man'

" Easy Scratchpad
Plug 'mtth/scratch.vim'

Plug 'rhysd/conflict-marker.vim'
Plug 'hotwatermorning/auto-git-diff'
Plug 'yutakatay/convert-git-url.vim'

" Neosnip
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Gtags Stuff
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" zinit syntax
Plug 'zinit-zsh/zinit-vim-syntax'

" Auto Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'neoclide/coc-neco', {
       \   'for': ['vim']
       \ }

" display the result when searching
Plug 'henrik/vim-indexed-search'

" Plug 'tpope/vim-surround' " surrounding text objects with paranthesis, quotes, html tags...
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-abolish' " easily search, substitute, abbreviate multiple version of words, coercion to camel case / snake case / dote case / title case...
Plug 'tpope/vim-repeat' " the . command can repeat whatever you want! See http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
Plug 'tpope/vim-commentary' " keystroke to comment automatically
Plug 'wellle/targets.vim' " add new text object (can delete between comma with di, for example)
Plug 'machakann/vim-highlightedyank' " Highlight briefly every yanked text
Plug 'machakann/vim-swap' " swap arguments in parenthesis
Plug 'chaoren/vim-wordmotion' " camel case motion
Plug 'honza/vim-snippets' " snippets
Plug 'stefandtw/quickfix-reflector.vim' " Allow multisearch in current directory / multi replace as well
Plug 'lambdalisue/suda.vim' " Write file with sudo
Plug 'blueyed/vim-diminactive' " Plug to dim colors of not-focused windows
Plug 'ap/vim-css-color' " Display the hexadecimal colors - useful for css and color config
Plug 'AndrewRadev/splitjoin.vim' " Split arrays in PHP / struct in Go / other things

" undo tree
Plug 'simnalamburt/vim-mundo' " Undo tree display

" outliners
Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim' " Use LSP

"------------------------------
" Buffer
Plug 'schickling/vim-bufonly'

"------------------------------
" Buffer switcher
Plug 'mg979/vim-xtabline'

"------------------------------
" Tab
Plug 'kana/vim-tabpagecd'

Plug 'moll/vim-bbye' " Close the current buffer
Plug 'simeji/winresizer' " Easy way to rezise and exchange windows
Plug 'andymass/vim-matchup' " Match more stuff with % (html tag, LaTeX...)

" tmux
Plug 'tmux-plugins/vim-tmux' | Plug 'tmux-plugins/vim-tmux-focus-events' " syntax highlighting for tmux.conf + other cool options
Plug 'christoomey/vim-tmux-navigator' " seemless navigation between vim windows / tmux pane

" git
Plug 'junegunn/gv.vim' " Display commits for project / file
Plug 'rhysd/git-messenger.vim' " Display commit message for a precise line

" syntax highlighting
Plug 'PotatoesMaster/i3-vim-syntax' " i3 config
Plug 'chr4/nginx.vim' " nginx
Plug 'wgwoods/vim-systemd-syntax' " systemd
Plug 'cespare/vim-toml' " toml

" Python
Plug 'python-mode/python-mode', {
      \   'branch': 'develop',
      \   'for': ['python']
      \ }
Plug 'mgedmin/python-imports.vim', {
      \   'for': ['python']
      \ }

Plug 'wellle/tmux-complete.vim' " Add tmux completion for COC

" markdown / writting
Plug 'junegunn/limelight.vim', { 'for': 'markdown' } " Hyperfocus-writing
Plug 'godlygeek/tabular' " Align plugin (useful for markdown tables for example)
Plug 'christoomey/vim-titlecase' " Titlecase with gt
Plug 'rhysd/vim-grammarous', { 'for': 'markdown' } " show grammar mistakes
Plug 'reedes/vim-wordy' " Verify quality of writting (see :Wordy)
Plug 'reedes/vim-lexical' " Dictionnary, thesaurus...
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Spelling
Plug 'dpelle/vim-languagetool'

" PHP
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
Plug 'nishigori/vim-php-dictionary', {'for': 'php'}
Plug 'lumiliet/vim-twig', {'for': 'twig'} " twig
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'} " php refactoring options
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
Plug '2072/php-indenting-for-vim', {'for': 'php'}
Plug 'tobyS/vmustache' | Plug 'tobyS/pdv', {'for': 'php'} " php doc autocompletion

" Yank
if has('nvim')
  " https://github.com/neovim/neovim/issues/1822
  Plug 'bfredl/nvim-miniyank'
else
  Plug 'svermeulen/vim-yoink'
endif
if !has('nvim')
  Plug 'svermeulen/vim-subversive'
endif
if has('nvim')
  Plug 'yutakatay/osc52.nvim'
endif
Plug 'chikatoike/concealedyank.vim'
Plug 'yutakatay/save-clipboard-on-exit.vim'

" Paste
Plug 'junegunn/vim-peekaboo'
Plug 'yutakatay/auto-paste-mode.vim'

" Clojure
Plug 'guns/vim-clojure-highlight', {'for': 'clojure'}
" Plug 'guns/vim-clojure-static', {'for': 'clojure'}
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
" Plug 'tpope/vim-salve', {'for': 'clojure'}
Plug 'tpope/vim-dispatch', {'for': 'clojure'}

" Golang
Plug 'fatih/vim-go', {'for': 'go'} " general plugin
Plug 'godoctor/godoctor.vim', {'for': 'go'} " refactoring
" Plug 'sebdah/vim-delve', {'for': 'go'} " debugger
Plug 'Phantas0s/go-analyzer.vim' " Custom plugin

" VimScript
Plug 'tpope/vim-scriptease' " Debug vimscript
Plug 'mopp/layoutplugin.vim', {
      \   'on': ['LayoutPlugin']
      \ }
Plug 'Shougo/neco-vim', {
      \   'for': ['vim']
      \ }

" Format
Plug 'editorconfig/editorconfig-vim'
Plug 'sbdchd/neoformat'

" Syntax
let g:polyglot_disabled = ['markdown', 'go', 'rust', 'json', 'jsonc', 'csv']
Plug 'sheerun/vim-polyglot'
if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'vigoux/architext.nvim'
endif

"------------------------------
" Minimap
if executable('cargo')
  Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
endif

"------------------------------
" Undo
Plug 'mbbill/undotree'
Plug 'machakann/vim-highlightedundo'

"------------------------------
" Diff
Plug 'AndrewRadev/linediff.vim'
Plug 'chrisbra/vim-diff-enhanced'

"------------------------------
" Mark
Plug 'kshenoy/vim-signature'
Plug 'MattesGroeger/vim-bookmarks'

"------------------------------
" Fold
Plug 'lambdalisue/readablefold.vim'

"------------------------------
" Manual
Plug 'thinca/vim-ref'
Plug 'reireias/vim-cheatsheet'
Plug 'liuchengxu/vim-which-key'

"------------------------------
" Tag
Plug 'jsfaint/gen_tags.vim'
if has('nvim')
  Plug 'pechorin/any-jump.vim'
endif

"------------------------------
" Quickfix
Plug 'tyru/qfhist.vim'
Plug 'ronakg/quickr-preview.vim'
Plug 'drmingdrmer/vim-toggle-quickfix'
Plug 'yssl/QFEnter'

"------------------------------
" Session
Plug 'tpope/vim-obsession'

"------------------------------
" Macro
Plug 'zdcthomas/medit'

"------------------------------
" Command
Plug 'lambdalisue/suda.vim'
Plug 'tyru/capture.vim'
Plug 'thinca/vim-ambicmd'
Plug 'tyru/vim-altercmd'

"------------------------------
" Commandline
Plug 'yutakatay/CmdlineComplete'

"------------------------------
" History
Plug 'yutakatay/history-ignore.vim'

"------------------------------
" Visual Mode
Plug 'kana/vim-niceblock'

"------------------------------
" Terminal
if has('nvim')
  Plug 'kassio/neoterm'
endif

"------------------------------
" Task runner
Plug 'janko-m/vim-test'
Plug 'igemnace/vim-makery'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'powerman/vim-plugin-AnsiEsc'

"------------------------------
" Writing assistant
Plug 'preservim/nerdcommenter'
Plug 'cometsong/CommentFrame.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-sleuth'
Plug 'lfilho/cosco.vim'

"------------------------------
" Brackets
Plug 'kien/rainbow_parentheses.vim'
Plug 'andymass/vim-matchup'
Plug 'cohama/lexima.vim'

"------------------------------
" Reading assistant
Plug 'Yggdroot/indentLine'
Plug 'wellle/context.vim'

"------------------------------
" Code jump
Plug 'liuchengxu/vista.vim'
Plug 'kana/vim-altr'

" "------------------------------

call plug#end()
