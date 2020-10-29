" "===============================================================
" "          Plugin Settings                                   {{{
" "===============================================================
let s:plug = { 'plugs': get(g:, 'plugs', {}) }
function! s:plug.is_installed(name) abort
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction
"------------------------------
  let g:coc_global_extensions = [
        \ 'coc-marketplace',
        \ 'coc-tag',
        \ 'coc-dictionary',
        \ 'coc-word',
        \ 'coc-emoji',
        \ 'coc-omni',
        \ 'coc-syntax',
        \ 'coc-emmet',
        \ 'coc-lists',
        \ 'coc-snippets',
        \ 'coc-postfix',
        \ 'coc-markdownlint',
        \ 'coc-json',
        \ 'coc-yaml',
        \ 'coc-sh',
        \ 'coc-pyright',
        \ 'coc-rust-analyzer',
        \ 'coc-clangd',
        \ 'coc-html',
        \ 'coc-css',
        \ 'coc-db',
        \ 'coc-diagnostic',
        \ 'coc-tabnine',
        \ 'coc-highlight',
        \ 'coc-git',
        \ 'coc-gitignore',
        \ 'coc-explorer',
        \ 'coc-spell-checker',
        \ 'coc-project',
        \ 'coc-gist',
        \ 'coc-fzf-preview',
        \ 'coc-terminal',
        \ 'coc-tasks',
        \ 'coc-todolist',
        \ 'coc-template',
        \ 'coc-translator',
        \ 'coc-calc',
        "\ 'coc-python',
        "\ 'coc-lines', " -> too many candidates for completion
        "\ 'coc-pairs', " -> change lexima because it's too simple
        "\ 'coc-smartf', " -> clever-f, easymotion I want to search with only one line, but it can't
        \ ]

  if has('nvim')
    call add(g:coc_global_extensions, 'coc-yank')
    call add(g:coc_global_extensions, 'coc-actions')
    call add(g:coc_global_extensions, 'coc-floatinput')
  endif

  if executable('nextword')
    call add(g:coc_global_extensions, 'coc-nextword')
  endif

  if executable('vim-language-server')
    call add(g:coc_global_extensions, 'coc-vimlsp')
  endif

" Prettier Settings "
let g:prettier#autoformat = 1

" YankRing
let g:yankring_history_dir = '/tmp'
" Prevent "clipboard: error: Error: target STRING not available" on startup
" https://github.com/neovim/neovim/issues/2642
let g:yankring_clipboard_monitor=0

" Airline Settings "
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

" Syntastic Settings "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" FZF ""
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea'"

"" Any-Jump Settings ""
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

"" Startify ""
let g:startify_padding_left = 10
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
    \ { 'type': 'dir'       },
    \ { 'type': 'files'     },
    \ { 'type': 'sessions'  },
    \ { 'type': 'bookmarks' },
    \ { 'type': 'commands' },
    \ ]
let  g:startify_bookmarks =  [
    \ {'v': '~/.config/nvim'},
    \ {'d': '~/.dotfiles' }
    \ ]
let g:startify_commands = [
    \ {'ch':  ['Health Check', ':checkhealth']},
    \ {'ps': ['Plugins status', ':PlugStatus']},
    \ {'pu': ['Update vim plugins',':PlugUpdate | PlugUpgrade']},
    \ {'uc': ['Update coc Plugins', ':CocUpdate']},
    \ {'h':  ['Help', ':help']},
    \ ]
let g:startify_custom_header =
      \ 'startify#pad(g:ascii + startify#fortune#cowsay())'

let g:ascii = [
 \ '',
 \ '                                                    ▟▙            ',
 \ '                                                    ▝▘            ',
 \ '            ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
 \ '            ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
 \ '            ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
 \ '            ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
 \ '            ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
 \ '',
 \ '',
 \ '',
 \]

"" rainbow brackets ""
let g:rainbow_active = 1

" Fruzzy matcher
let g:fruzzy#usenative = 0
let g:fruzzy#sortonempty = 0

"==============================
" etc                       {{{
"==============================
"-------------------------------
" nerdcommenter
if s:plug.is_installed('nerdcommenter')
  let g:NERDSpaceDelims = 1
  "let g:NERDCompactSexyComs = 1
  let g:NERDDefaultAlign = 'left'
  "let g:NERDAltDelims_java = 1
  "let g:NERDCustomDelimiters = {
  "      \ 'c': { 'left': '/**','right': '*/' },
  "      \ 'cpp': { 'left': '/**','right': '*/' } }
  let g:NERDCommentEmptyLines = 1
  let g:NERDTrimTrailingWhitespace = 1
  nmap <C-_> <Leader>c<Leader>
  vmap <C-_> <Leader>c<Leader>
endif
"
"-------------------------------
" vim-signature
if s:plug.is_installed('vim-signature')
  let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "m<Space>",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "]`",
        \ 'GotoPrevSpotByPos'  :  "[`",
        \ 'GotoNextMarker'     :  "]-",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListBufferMarks'    :  "m/",
        \ 'ListBufferMarkers'  :  "m?"
        \ }
endif
"
"-------------------------------
" indentLine
if s:plug.is_installed('indentLine')
  let g:indentLine_enabled = 0
endif
"
"-------------------------------
" CmdlineComplete
if s:plug.is_installed('CmdlineComplete')
  cmap <C-k> <Plug>CmdlineCompleteBackward
  cmap <C-j> <Plug>CmdlineCompleteForward
endif
"
"-------------------------------
" splitjoin.vim
if s:plug.is_installed('splitjoin.vim')
  nmap <SubLeader>J :SplitjoinJoin<cr>
  nmap <SubLeader>S :SplitjoinSplit<cr>
endif
"
"-------------------------------
" vim-diminactive
if s:plug.is_installed('vim-diminactive')
  let g:diminactive = 0
  let g:diminactive_enable_focus = 1
endif
"
"-------------------------------
" tagbar
if s:plug.is_installed('tagbar')
  " highlight link TagbarHighlight PmenuSel
  let g:tagbar_type_markdown = {
        \ 'ctagstype': 'markdown',
        \ 'ctagsbin' : 'markdown2ctags',
        \ 'ctagsargs' : '-f - --sort=yes',
        \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
        \ ],
        \ 'sro' : '|',
        \ 'kind2scope' : {
        \ 's' : 'section',
        \ },
        \ 'sort': 0,
        \ }
endif
"
"-------------------------------
" vim-bbye
if s:plug.is_installed('vim-bbye')
  nnoremap <Leader>bd :Bdelete<CR>
  nmap <F4> :Bdelete<CR>
  nmap <C-X> :Bdelete<CR>
  nmap <S-F4> :Bdelete!<CR>
  nmap <C-F4> :Bdelete!<CR>
endif
"
"-------------------------------
" python-mode
if s:plug.is_installed('python-mode')
  let g:pymode_folding = 0
  let g:pymode_rope_completion = 0
  let g:pymode_python = 'python3'
endif
"
"-------------------------------
" vim-go
if s:plug.is_installed('vim-go')
  let g:go_fmt_command = 'goimports'
  let g:go_hightlight_functions = 1
  let g:go_hightlight_methods = 1
  let g:go_hightlight_structs = 1
  let g:go_hightlight_interfaces = 1
  let g:go_hightlight_operators = 1
  let g:go_hightlight_build_constraints = 1
endif

"-------------------------------
" vim-polyglot
if s:plug.is_installed('vim-polyglot')
  let g:csv_no_conceal = 0
  autocmd! filetypedetect * *.tmux
endif
"
"-------------------------------
" cohama/lexima.vim
if s:plug.is_installed('lexima.vim')
  call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '(', 'input': '('})
  call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '[', 'input': '['})
  call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '{', 'input': '{'})
  call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '"', 'input': '"'})
  call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '''', 'input': ''''})
  call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '`', 'input': '`'})
  call lexima#add_rule({'at': '\%#\n\s*}', 'char': '}', 'input': '}', 'delete': '}'})
endif
"
"-------------------------------
" vim-test
if s:plug.is_installed('vim-test')
  let g:test#strategy = 'asyncrun'
  nnoremap <make>   <Nop>
  nmap    m <make>
  nnoremap <make>n :<C-u>TestNearest<CR>
  nnoremap <make>f :<C-u>TestFile<CR>
  nnoremap <make>s :<C-u>TestSuite<CR>
  nnoremap <make>l :<C-u>TestLast<CR>
  nnoremap <make>v :<C-u>TestVisit<CR>
  let g:test#rust#cargotest#options = '-- --nocapture'
  let g:test#rust#cargotest#executable = 'RUST_BACKTRACE=1 cargo test'

  command! TestCurrent wa <Bar> execute 'TestNearest ' . get(b:, 'vista_nearest_method_or_function', '')
  nnoremap <make>c :<C-u>TestCurrent<CR>
endif
"
"-------------------------------
" asynctasks.vim
if s:plug.is_installed('asynctasks.vim')
endif
"
"-------------------------------
" asyncrun.vim
if s:plug.is_installed('asyncrun.vim')
  let g:asyncrun_open = 8
  " https://github.com/skywind3000/asyncrun.vim/blob/58d23e70569994b36208ed2a653f0a2d75c24fbc/doc/asyncrun.txt#L181
  augroup local-asyncrun
    autocmd!
    autocmd User AsyncRunStop copen | $ | wincmd p
  augroup END
endif

"-------------------------------
" vim-dispatch
if s:plug.is_installed('vim-dispatch')
  nnoremap <Leader>R :<C-u>Copen<Bar>Dispatch<CR>
  " nnoremap <SubLeader>q   :<C-u>Copen<CR>
  nnoremap <make><CR> :<C-u>Make
endif
"
"-------------------------------
" vim-better-whitespace
if s:plug.is_installed('vim-better-whitespace')
  let g:better_whitespace_enabled = 1
  let g:strip_whitespace_on_save = 1
  let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'minimap']
endif
"
"-------------------------------
" vim-cheatsheet
if s:plug.is_installed('vim-cheatsheet')
  let s:cache_file_dir = expand('~/.cache/vim/files/')
  if !isdirectory(s:cache_file_dir)
    call system("mkdir -p " . s:cache_file_dir)
  endif
  let g:cheatsheet#cheat_file = expand(s:cache_file_dir . 'cheatsheet.md')
  command! CheatUpdate call system("curl -Ls https://raw.githubusercontent.com/yutakatay/katapedia/master/doc/Vim.md -o " . g:cheatsheet#cheat_file)
endif
"
"-------------------------------
" vim-matchup
if s:plug.is_installed('vim-matchup')
  let g:loaded_matchit = 1
  hi MatchParenCur cterm=underline gui=underline
  hi MatchWordCur cterm=underline gui=underline
endif

"-------------------------------
" vim-gutentags
if s:plug.is_installed('vim-gutentags')
  let g:gutentags_enabled = 0
  let g:gutentags_add_default_project_roots = 0
  let g:gutentags_project_root  = ['package.json', '.git', '.hg', '.svn']
  let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
  let g:gutentags_generate_on_new = 1
  let g:gutentags_generate_on_missing = 1
  let g:gutentags_generate_on_write = 1
  let g:gutentags_generate_on_empty_buffer = 0
  let g:gutentags_ctags_extra_args = ['--tag-relative=yes', '--fields=+ailmnS']
  let g:gutentags_ctags_exclude = [
        \  '*.git', '*.svn', '*.hg',
        \  'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
        \  '*-lock.json',  '*.lock',
        \  '*.min.*',
        \  '*.bak',
        \  '*.zip',
        \  '*.pyc',
        \  '*.class',
        \  '*.sln',
        \  '*.csproj', '*.csproj.user',
        \  '*.tmp',
        \  '*.cache',
        \  '*.vscode',
        \  '*.pdb',
        \  '*.exe', '*.dll', '*.bin',
        \  '*.mp3', '*.ogg', '*.flac',
        \  '*.swp', '*.swo',
        \  '.DS_Store', '*.plist',
        \  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
        \  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
        \  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
        \]

  let g:gutentags_enabled = 1
  let g:gutentags_modules = []
  if executable('ctags')
    let g:gutentags_modules += ['ctags']
  endif
  if executable('cscope')
    let g:gutentags_modules += ['cscope']
  endif
  if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
  endif
  let g:gutentags_cache_dir = expand('~/.cache/tags')
  if !isdirectory(g:gutentags_cache_dir)
    call mkdir(g:gutentags_cache_dir, 'p')
  endif
  let g:gutentags_gtags_dbpath = g:gutentags_cache_dir
  let g:gutentags_define_advanced_commands = 1

  function! s:SetupCPPTags()
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
    let g:gutentags_ctags_extra_args += ['/usr/include', '/usr/local/include']
  endfunction

  " lazy load for vim-plug
  " command! GutentagsSetup call gutentags#setup_gutentags()
  augroup MyGutentags
    autocmd!
    " autocmd! User vim-gutentags call gutentags#setup_gutentags()
    autocmd! FileType c,cpp call <SID>SetupCPPTags()
  augroup END
endif

"-------------------------------
" gutentags_plus
if s:plug.is_installed('gutentags_plus')
  let g:gutentags_plus_nomap = 1
endif
"
"-------------------------------
" vista.vim
if s:plug.is_installed('vista.vim')
  " Position to open the vista sidebar. On the right by default.
  " Change to 'vertical topleft' to open on the left.
  let g:vista_sidebar_position = 'vertical botright'
  " Width of vista sidebar.
  let g:vista_sidebar_width = 30
  " Set this flag to 0 to disable echoing when the cursor moves.
  let g:vista_echo_cursor = 1
  " Time delay for showing detailed symbol info at current cursor.
  let g:vista_cursor_delay = 400
  " Close the vista window automatically close when you jump to a symbol.
  let g:vista_close_on_jump = 0
  " Move to the vista window when it is opened.
  let g:vista_stay_on_open = 1
  " Blinking cursor 2 times with 100ms interval after jumping to the tag.
  let g:vista_blink = [2, 100]
  " How each level is indented and what to prepend.
  " This could make the display more compact or more spacious.
  " e.g., more compact: ["▸ ", ""]
  let g:vista_icon_indent = [" => ", " |-"]
  " Executive used when opening vista sidebar without specifying it.
  " Avaliable: 'coc', 'ctags'. 'ctags' by default.
  let g:vista_default_executive = 'ctags'
  let g:vista#executives = ['coc', 'ctags', 'lcn', 'vim_lsp']
  " Declare the command including the executable and options used to generate ctags output
  " for some certain filetypes.The file path will be appened to your custom command.
  " For example:
  let g:vista_ctags_cmd = {
        \ 'haskell': 'hasktags -o - -c',
        \ }
  " To enable fzf's preview window set g:vista_fzf_preview.
  " The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
  " For example:
  let g:vista_fzf_preview = ['right:50%']
  " Fall back to other executives if the specified one gives empty data.
  " By default it's all the provided executives excluding the tried one.
  " let g:vista_finder_alternative_executives = ['coc']
  function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
  endfunction

  function! MyRunForNearestMethodOrFunction() abort
    if line2byte('$') + len(getline('$')) < 1000000
      call vista#RunForNearestMethodOrFunction()
    endif
  endfunction

  nmap <Leader>v :<C-u>Vista finder<CR>

  augroup MyVista
    autocmd!
    autocmd VimEnter * call MyRunForNearestMethodOrFunction()
  augroup END
endif

"-------------------------------
" vim-xtabline
if s:plug.is_installed('vim-xtabline')
  " let g:xtabline_lazy = 1
  let g:xtabline_settings = {}
  let g:xtabline_settings.tabline_modes = ['buffers', 'tabs', 'arglist']
  let g:xtabline_settings.buffer_filtering = 0
  let g:xtabline_settings.relative_paths = 0
  let g:xtabline_settings.use_tab_cwd = 0
  let g:xtabline_settings.theme = 'slate'
  let g:xtabline_settings.map_prefix = 'm'
  " let g:xtabline_settings.enable_mappings = 1
  let g:xtabline_settings.bufline_format = ' N I< l +'
  let g:xtabline_settings.recent_buffers = 99
  let g:xtabline_settings.tab_number_in_buffers_mode = 0
  nmap <silent> <F2> :<C-u>if IsNormalBuffer() <Bar> execute "1XTabPrevBuffer" <Bar> endif <CR>
  nmap <silent> <F3> :<C-u>if IsNormalBuffer() <Bar> execute "1XTabNextBuffer" <Bar> endif <CR>
  nmap <silent> <C-a> :<C-u>if IsNormalBuffer() <Bar> execute "1XTabPrevBuffer" <Bar> endif <CR>
  nmap <silent> <C-g> :<C-u>if IsNormalBuffer() <Bar> execute "1XTabNextBuffer" <Bar> endif <CR>
  nmap <F4> :<C-u>XTabCloseBuffer<CR>
  nmap <C-x> :<C-u>XTabCloseBuffer<CR>
  nmap <S-F4> :<C-u>XTabCloseBuffer<CR>
  nmap <C-F4> :<C-u>XTabCloseBuffer<CR>
  nmap <C-M-F2> :<C-u>XTabMoveBufferPrev<CR>
  nmap <C-M-F3> :<C-u>XTabMoveBufferNext<CR>
  nmap <S-PageUp>   :<C-u>XTabMoveBufferPrev<CR>
  nmap <S-PageDown> :<C-u>XTabMoveBufferNext<CR>
  nmap <BS> <Plug>(XT-Select-Buffer" )
  nmap <Leader>1 1<Plug>(XT-Select-Buffer)
  nmap <Leader>2 2<Plug>(XT-Select-Buffer)
  nmap <Leader>3 3<Plug>(XT-Select-Buffer)
  nmap <Leader>4 4<Plug>(XT-Select-Buffer)
  nmap <Leader>5 5<Plug>(XT-Select-Buffer)
  nmap <Leader>6 6<Plug>(XT-Select-Buffer)
  nmap <Leader>7 7<Plug>(XT-Select-Buffer)
  nmap <Leader>8 8<Plug>(XT-Select-Buffer)
  nmap <Leader>9 9<Plug>(XT-Select-Buffer)
  nmap <Leader>0 0<Plug>(XT-Select-Buffer" )

   function! s:xtabline_ignore_buffer() abort
    if &ft ==? 'scrollbar'
      " setlocal buftype=
    endif
  endfunction
  function! s:xtabline_reformat() abort
    if winwidth(0) > 150
      let g:xtabline_settings.show_right_corner = 1
    else
      let g:xtabline_settings.show_right_corner = 0
    endif
  endfunction
  call s:xtabline_reformat()
  augroup MyXTabline
    autocmd!
    autocmd VimResized * call s:xtabline_reformat() | call xtabline#cmds#run("reset_buffer")
    " autocmd BufNew * call s:xtabline_ignore_buffer()
  augroup END
endif

"-------------------------------
" suda.vim
if s:plug.is_installed('suda.vim')
  let g:suda_smart_edit = 1
endif

"-------------------------------
" nvim-miniyank
if s:plug.is_installed('nvim-miniyank')
  let g:miniyank_filename = $HOME."/.cache/miniyank.mpack"
  if exists('*trim')
    let s:miniyank_filename_size = trim(system("du " . g:miniyank_filename . " | cut -f1"))
    if s:miniyank_filename_size > 1000
      echom "Remove large miniyank.mpack file: " . s:miniyank_filename_size . "[KB]"
      call system("rm -f " . g:miniyank_filename)
    endif
  endif
  let g:miniyank_maxitems = 100
  map p <Plug>(miniyank-autoput)
  map P <Plug>(miniyank-autoPut)
  map <SubLeader>p <Plug>(miniyank-startput)
  map <SubLeader>P <Plug>(miniyank-startPut)
  nmap <C-p> <Plug>(miniyank-cycle)
  nmap <C-n> <Plug>(miniyank-cycleback)
endif

"-------------------------------
" winresizer
if s:plug.is_installed('winresizer')
  let g:winresizer_start_key = '<C-w><C-r>'
endif

"-------------------------------
" vim-peekaboo
if s:plug.is_installed('vim-peekaboo')
  let g:peekaboo_prefix = "<Leader>"
  let g:peekaboo_ins_prefix = "<C-x>"
endif

"-------------------------------
" vim-swap
if s:plug.is_installed('vim-swap')
  omap i, <Plug>(swap-textobject-i)
  xmap i, <Plug>(swap-textobject-i)
  omap a, <Plug>(swap-textobject-a)
  xmap a, <Plug>(swap-textobject-a)
endif

"-------------------------------
" vim-sandwich
if s:plug.is_installed('vim-sandwich')
  " use mappings sa, sd, sr
endif

"-------------------------------
" quickr-preview.vim
if s:plug.is_installed('quickr-preview.vim')
  let g:quickr_preview_keymaps = 0
endif

"-------------------------------
" vim-clap
if s:plug.is_installed('vim-clap')
  function! s:clap_my_keymap() abort
    inoremap <silent> <buffer> <Down> <C-R>=clap#handler#navigate_result('down')<CR>
    inoremap <silent> <buffer> <Up> <C-R>=clap#handler#navigate_result('up')<CR>
  endfunction
  augroup MyVimClap
    autocmd!
    autocmd User ClapOnEnter   call s:clap_my_keymap()
    " autocmd User ClapOnExit    call YourFunction()
  augroup END
  nnoremap <unique><silent> <Leader><Leader>bc :<C-u>Clap bcommits<CR>
  nnoremap <unique><silent> <Leader><Leader>l :<C-u>Clap blines<CR>
  nnoremap <unique><silent> <Leader><Leader>b :<C-u>Clap buffers<CR>
  " nnoremap <unique><silent> <Leader><Leader> :<C-u>Clap colors<CR>
  nnoremap <unique><silent> <Leader><Leader>h :<C-u>Clap hist<CR>
  nnoremap <unique><silent> <Leader><Leader>c :<C-u>Clap commits<CR>
  nnoremap <unique><silent> <Leader><Leader>f :<C-u>Clap files<CR>
  " nnoremap <unique><silent> <Leader><Leader> :<C-u>Clap filetypes<CR>
  nnoremap <unique><silent> <Leader><Leader>p :<C-u>Clap git_files<CR>
  nnoremap <unique><silent> <Leader><Leader>g :<C-u>Clap grep<CR>
  nnoremap <unique><silent> <Leader><Leader>j :<C-u>Clap jumps<CR>
  nnoremap <unique><silent> <Leader><Leader>m :<C-u>Clap marks<CR>
  nnoremap <unique><silent> <Leader><Leader>t :<C-u>Clap tags<CR>
  " nnoremap <unique><silent> <Leader><Leader> :<C-u>Clap windows<CR>
endif

"-------------------------------
" vim-toggle-quickfix
if s:plug.is_installed('vim-toggle-quickfix')
  nmap <SubLeader>q <Plug>window:quickfix:toggle
  nmap <SubLeader>l <Plug>window:location:toggle
endif

"-------------------------------
" vim-subversive
if s:plug.is_installed('vim-subversive')
  nmap <Leader>s <plug>(SubversiveSubstituteRange)
  xmap <Leader>s <plug>(SubversiveSubstituteRange)
  nmap <Leader>ss <plug>(SubversiveSubstituteWordRange)
endif

"-------------------------------
" vim-yoink
if s:plug.is_installed('vim-yoink')
  nmap <C-n> <plug>(YoinkPostPasteSwapBack)
  nmap <C-p> <plug>(YoinkPostPasteSwapForward)
  nmap p <plug>(YoinkPaste_p)
  nmap P <plug>(YoinkPaste_P)
endif

"-------------------------------
" git-messenger.vim
if s:plug.is_installed('git-messenger.vim')
  nmap <C-w>m <Plug>(git-messenger)
  function! s:setup_gitmessengerpopup() abort
    nmap <buffer><Esc> q
  endfunction
  augroup MyGitMessenger
    autocmd FileType gitmessengerpopup call <SID>setup_gitmessengerpopup()
  augroup END
endif

"-------------------------------
" context.vim
if s:plug.is_installed('context.vim')
  let g:context_enabled = 0
  let g:context_add_mappings = 0
endif

"-------------------------------
" vim-which-key
if s:plug.is_installed('vim-which-key')
  nnoremap <silent> <Leader><CR>      :<C-u>WhichKey '<lt>Space>'<CR>
  nnoremap <silent> <SubLeader><CR> :<C-u>WhichKey  '<SubLeader>'<CR>
  nnoremap <silent> <Leader>f :<C-u>WhichKey '<lt>Space>f'<CR>
  nnoremap <silent> <make><CR> :<C-u>WhichKey  '<make>'<CR>
  nnoremap <silent> <spector><CR> :<C-u>WhichKey  '<spector>'<CR>
  nnoremap <silent> <fzf-p><CR> :<C-u>WhichKey  '<fzf-p>'<CR>
  nnoremap <silent> <fzf-p-resume><CR> :<C-u>WhichKey  '<fzf-p-resume>'<CR>
  nnoremap <silent> <coc><CR> :<C-u>WhichKey  '<coc>'<CR>
  nnoremap <silent> <easymotion><CR> :<C-u>WhichKey  '<easymotion>'<CR>
  nnoremap <silent> g<CR> :<C-u>WhichKey  'g'<CR>
endif

"-------------------------------
" CommentFrame.vim
if s:plug.is_installed('CommentFrame.vim')
  let g:CommentFrame_SkipDefaultMappings = 1
endif

"-------------------------------
" any-jump.vim
if s:plug.is_installed('any-jump.vim')
  let g:any_jump_disable_default_keybindings = 1
  " Normal mode: Jump to definition under cursore
  nnoremap ]j :AnyJump<CR>
  " Visual mode: jump to selected text in visual mode
  xnoremap ]j :AnyJumpVisual<CR>
  " Normal mode: open previous opened file (after jump)
  nnoremap ]b :AnyJumpBack<CR>
  " Normal mode: open last closed search window again
  nnoremap ]l :AnyJumpLastResults<CR>
endif

"-------------------------------
" gen_tags.vim
if s:plug.is_installed('gen_tags.vim')
  if !executable('ctags')
    let g:gen_tags#ctags_auto_gen = 1
  endif
  if !executable('gtags')
    let g:loaded_gentags#gtags = 1
  endif
  let g:gen_tags#gtags_default_map = 0
endif

"-------------------------------
" vim-highlightedundo
if s:plug.is_installed('vim-highlightedundo')
  nmap u     <Plug>(highlightedundo-undo)
  nmap <C-r> <Plug>(highlightedundo-redo)
  " nmap U     <Plug>(highlightedundo-Undo)
  nmap g-    <Plug>(highlightedundo-gminus)
  nmap g+    <Plug>(highlightedundo-gplus)
endif

"-------------------------------
" vim-bookmarks
if s:plug.is_installed('vim-bookmarks')
  nmap <SubLeader>m <Plug>BookmarkToggle
  let g:bookmark_no_default_key_mappings = 1
endif

" "-------------------------------
" vim-wordmotion
if s:plug.is_installed('vim-wordmotion')
  let g:wordmotion_prefix = '<SubLeader>'
endif

"-------------------------------
" vim-quickui
if s:plug.is_installed('vim-quickui')
  call quickui#menu#reset()
  call quickui#menu#install("&File", [
        \ [ "&Open\t(:w)", 'call feedkeys(":tabe ")'],
        \ [ "&Save\t(:w)", 'write'],
        \ [ "--", ],
        \ [ "LeaderF &File", 'Leaderf file', 'Open file with leaderf'],
        \ [ "LeaderF &Mru", 'Leaderf mru --regexMode', 'Open recently accessed files'],
        \ [ "LeaderF &Buffer", 'Leaderf buffer', 'List current buffers in leaderf'],
        \ [ "--", ],
        \ [ "J&unk File", 'JunkFile', ''],
        \ ])

  call quickui#menu#install("&File", [
        \ [ "--", ],
        \ [ "E&xit", 'qa' ],
        \ ])

  call quickui#menu#install("&Edit", [
        \ ['Copyright &Header', 'call feedkeys("\<esc> ec")', 'Insert copyright information at the beginning'],
        \ ['&Trailing Space', 'call StripTrailingWhitespace()', ''],
        \ ['Update &ModTime', 'call UpdateLastModified()', ''],
        \ ['&Paste Mode Line', 'PasteVimModeLine', ''],
        \ ['Format J&son', '%!python -m json.tool', ''],
        \ ['--'],
        \ ['&Align Table', 'Tabularize /|', ''],
        \ ['Align &Cheatsheet', 'MyCheatSheetAlign', ''],
        \ ])

  call quickui#menu#install('&Symbol', [
        \ [ "&Grep Word\t(In Project)", 'call MenuHelp_GrepCode()', 'Grep keyword in current project' ],
        \ [ "--", ],
        \ [ "Find &Definition\t(GNU Global)", 'call MenuHelp_Gscope("g")', 'GNU Global search g'],
        \ [ "Find &Symbol\t(GNU Global)", 'call MenuHelp_Gscope("s")', 'GNU Gloal search s'],
        \ [ "Find &Called by\t(GNU Global)", 'call MenuHelp_Gscope("d")', 'GNU Global search d'],
        \ [ "Find C&alling\t(GNU Global)", 'call MenuHelp_Gscope("c")', 'GNU Global search c'],
        \ [ "Find &From Ctags\t(GNU Global)", 'call MenuHelp_Gscope("z")', 'GNU Global search c'],
        \ [ "--", ],
        \ [ "Goto D&efinition\t(YCM)", 'YcmCompleter GoToDefinitionElseDeclaration'],
        \ [ "Goto &References\t(YCM)", 'YcmCompleter GoToReferences'],
        \ [ "Get D&oc\t(YCM)", 'YcmCompleter GetDoc'],
        \ [ "Get &Type\t(YCM)", 'YcmCompleter GetTypeImprecise'],
        \ ])
  call quickui#menu#install('&Move', [
        \ ["Quickfix &First\t:cfirst", 'cfirst', 'quickfix cursor rewind'],
        \ ["Quickfix L&ast\t:clast", 'clast', 'quickfix cursor to the end'],
        \ ["Quickfix &Next\t:cnext", 'cnext', 'cursor next'],
        \ ["Quickfix &Previous\t:cprev", 'cprev', 'quickfix cursor previous'],
        \ ])
  call quickui#menu#install("&Build", [
        \ ["File &Execute\tF5", 'AsyncTask file-run'],
        \ ["File &Compile\tF9", 'AsyncTask file-build'],
        \ ["File E&make\tF7", 'AsyncTask emake'],
        \ ["File &Start\tF8", 'AsyncTask emake-exe'],
        \ ['--', ''],
        \ ["&Project Build\tShift+F9", 'AsyncTask project-build'],
        \ ["Project &Run\tShift+F5", 'AsyncTask project-run'],
        \ ["Project &Test\tShift+F6", 'AsyncTask project-test'],
        \ ["Project &Init\tShift+F7", 'AsyncTask project-init'],
        \ ['--', ''],
        \ ["T&ask List\tCtrl+F10", 'call MenuHelp_TaskList()'],
        \ ['E&dit Task', 'AsyncTask -e'],
        \ ['Edit &Global Task', 'AsyncTask -E'],
        \ ['&Stop Building', 'AsyncStop'],
        \ ])
  call quickui#menu#install("&Git", [
        \ ['&View Diff', 'call svnhelp#svn_diff("%")'],
        \ ['&Show Log', 'call svnhelp#svn_log("%")'],
        \ ['File &Add', 'call svnhelp#svn_add("%")'],
        \ ])

  call quickui#menu#install('&Tools', [
        \ ['Compare &History', 'call svnhelp#compare_ask_file()', ''],
        \ ['&Compare Buffer', 'call svnhelp#compare_ask_buffer()', ''],
        \ ['--',''],
        \ ['List &Buffer', 'call quickui#tools#list_buffer("FileSwitch tabe")', ],
        \ ['List &Function', 'call quickui#tools#list_function()', ],
        \ ['Display &Messages', 'call quickui#tools#display_messages()', ],
        \ ['--',''],
        \ ["&DelimitMate %{get(b:, 'delimitMate_enabled', 0)? 'Disable':'Enable'}", 'DelimitMateSwitch'],
        \ ['Read &URL', 'call menu#ReadUrl()', 'load content from url into current buffer'],
        \ ['&Spell %{&spell? "Disable":"Enable"}', 'set spell!', 'Toggle spell check %{&spell? "off" : "on"}'],
        \ ['&Profile Start', 'call MonitorInit()', ''],
        \ ['Profile S&top', 'call MonitorExit()', ''],
        \ ["Relati&ve number %{&relativenumber? 'OFF':'ON'}", 'set relativenumber!'],
        \ ["Proxy &Enable", 'call MenuHelp_Proxy(1)', 'setup http_proxy/https_proxy/all_proxy'],
        \ ["Proxy D&isable", 'call MenuHelp_Proxy(0)', 'clear http_proxy/https_proxy/all_proxy'],
        \ ])
  call quickui#menu#install('&Plugin', [
        \ ["&NERDTree\t<space>tn", 'NERDTreeToggle', 'toggle nerdtree'],
        \ ['&Tagbar', '', 'toggle tagbar'],
        \ ["&Choose Window/Tab\tAlt+e", "ChooseWin", "fast switch win/tab with vim-choosewin"],
        \ ["-"],
        \ ["&Browse in github\trhubarb", "Gbrowse", "using tpope's rhubarb to open browse and view the file"],
        \ ["&Startify", "Startify", "using tpope's rhubarb to open browse and view the file"],
        \ ["&Gist", "Gist", "open gist with mattn/gist-vim"],
        \ ["&Edit Note", "Note", "edit note with vim-notes"],
        \ ["&Display Calendar", "Calendar", "display a calender"],
        \ ['Toggle &Vista', 'Vista!!', ''],
        \ ["-"],
        \ ["Plugin &List", "PlugList", "Update list"],
        \ ["Plugin &Update", "PlugUpdate", "Update plugin"],
        \ ])
  call quickui#menu#install('Help (&?)', [
        \ ["&Index", 'tab help index', ''],
        \ ['Ti&ps', 'tab help tips', ''],
        \ ['--',''],
        \ ["&Tutorial", 'tab help tutor', ''],
        \ ['&Quick Reference', 'tab help quickref', ''],
        \ ['&Summary', 'tab help summary', ''],
        \ ['--',''],
        \ ['&Vim Script', 'tab help eval', ''],
        \ ['&Function List', 'tab help function-list', ''],
        \ ['&Dash Help', 'call asclib#utils#dash_ft(&ft, expand("<cword>"))'],
        \ ], '10000' )
  " let g:quickui_show_tip = " 1
  "----------------------------------------------------------------------
  " context menu
  "----------------------------------------------------------------------
  let g:context_menu_k = [
        \ ["&Peek Definition\tAlt+;", 'call quickui#tools#preview_tag("")'],
        \ ["S&earch in Project\t\\cx", 'exec "silent! GrepCode! " . expand("<cword>")'],
        \ [ "--", ],
        \ [ "Find &Definition\t\\cg", 'call MenuHelp_Fscope("g")', 'GNU Global search g'],
        \ [ "Find &Symbol\t\\cs", 'call MenuHelp_Fscope("s")', 'GNU Gloal search s'],
        \ [ "Find &Called by\t\\cd", 'call MenuHelp_Fscope("d")', 'GNU Global search d'],
        \ [ "Find C&alling\t\\cc", 'call MenuHelp_Fscope("c")', 'GNU Global search c'],
        \ [ "Find &From Ctags\t\\cz", 'call MenuHelp_Fscope("z")', 'GNU Global search c'],
        \ [ "--", ],
        \ [ "Goto D&efinition\t(YCM)", 'YcmCompleter GoToDefinitionElseDeclaration'],
        \ [ "Goto &References\t(YCM)", 'YcmCompleter GoToReferences'],
        \ [ "Get D&oc\t(YCM)", 'YcmCompleter GetDoc'],
        \ [ "Get &Type\t(YCM)", 'YcmCompleter GetTypeImprecise'],
        \ [ "--", ],
        \ ['Dash &Help', 'call asclib#utils#dash_ft(&ft, expand("<cword>"))'],
        \ ['Cpp&man', 'exec "Cppman " . expand("<cword>")', '', 'c,cpp'],
        \ ['P&ython Doc', 'call quickui#tools#python_help("")', 'python'],
        \ ]
  "----------------------------------------------------------------------
  " hotkey
  "----------------------------------------------------------------------
  nnoremap <silent><F10> :call quickui#menu#open()<cr>
endif
"
"-------------------------------
" cosco.vim
if s:plug.is_installed('cosco.vim')
  augroup MyCosco
    autocmd!
    autocmd FileType javascript,css,rust,c,cpp,cs,java,php nmap <silent> <SubLeader>; <Plug>(cosco-commaOrSemiColon)
    autocmd FileType javascript,css,rust,c,cpp,cs,java,php imap <silent> <C-_> <c-o><Plug>(cosco-commaOrSemiColon)<Esc>o
  augroup end
endif
"
"===============================
" vim-ref                    {{{
"===============================
"
if s:plug.is_installed('vim-ref')
  function! RefDoc() abort
    if &filetype =~? 'perl'
      execute 'Ref perldoc'
    elseif &filetype =~? 'python'
      execute 'Ref pydoc'
    elseif &filetype =~? 'ruby'
      execute 'Ref refe'
    elseif &filetype =~? 'cpp'
      if has('nvim')
        execute 'terminal cppman ' .expand('<cword>')
      else
        execute '!cppman ' .expand('<cword>')
      endif
    elseif &filetype =~? 'go'
      execute 'GoDoc'
    else
      execute 'Ref man'
    endif
  endfunction
  map <F1> :<C-u>call RefDoc()<CR>

  let g:ref_source_webdict_cmd = 'lynx -dump -nonumbers %s'
  let g:ref_lynx_use_cache = 1

  let g:ref_source_webdict_sites = {
        \   'weblio' : {
        \     'url' : 'https://ejje.weblio.jp/content/%s'
        \   },
        \   'wikij': {
        \     'url': 'https://ja.wikipedia.org/wiki/%s',
        \   },
        \   'wiki': {
        \     'url': 'https://en.wikipedia.org/wiki/%s',
        \   },
        \   'github': {
        \     'url': 'https://github.com/%s',
        \   },
        \   'github_raw': {
        \     'url': 'https://raw.githubusercontent.com/%s',
        \   },
        \   'docs_rs': {
        \     'url': 'https://docs.rs/%s',
        \   },
        \   'crates_io': {
        \     'url': 'https://crates.io/search?q=%s',
        \   },
        \ }
  function! g:ref_source_webdict_sites.weblio.filter(output) abort
    return join(split(a:output, "\n")[24 :], "\n")
  endfunction

  function! g:ref_source_webdict_sites.wiki.filter(output) abort
    return join(split(a:output, "\n")[17 :], "\n")
  endfunction

  function! g:ref_source_webdict_sites.docs_rs.filter(output) abort
    return join(split(a:output, "\n")[14 :], "\n")
  endfunction

  function! g:ref_source_webdict_sites.crates_io.filter(output) abort
    return join(split(a:output, "\n")[14 :], "\n")
  endfunction

  let g:ref_source_webdict_sites.default = 'weblio'
  nnoremap <silent><expr> <Leader>re ':Ref webdict weblio ' . expand('<cword>') . '<CR>'
  vnoremap <silent> <Leader>re "zy:Ref webdict weblio <C-r>"<CR>
  nnoremap <silent><expr> <Leader>rwj ':Ref webdict wikij ' . expand('<cword>') . '<CR>'
  vnoremap <silent> <Leader>rwj "zy:Ref webdict wikij <C-r>"<CR>
  nnoremap <silent><expr> <Leader>rw ':Ref webdict wiki ' . expand('<cword>') . '<CR>'
  vnoremap <silent> <Leader>rw "zy:Ref webdict wiki <C-r>"<CR>

  nnoremap <silent><expr> <S-F1> ':Ref webdict weblio ' . expand('<cword>') . '<CR>'
  vnoremap <silent> <S-F1> "zy:Ref webdict weblio <C-r>"<CR>
  nnoremap <silent><expr> <C-F1> ':Ref webdict wiki ' . expand('<cword>') . '<CR>'

  command! WeblioCurrentWord execute 'Ref webdict weblio ' . expand('<cword>')
  command! -nargs=1 Weblioj execute 'Ref webdict weblio ' '<args>'
  command! -nargs=1 Weblioe execute 'Ref webdict weblio ' '<args>'
  command! Wikij execute 'Ref webdict wikij ' . expand('<cword>')
  command! Wiki execute 'Ref webdict wiki ' . expand('<cword>')

  " GitHub
  command! GitHubReadMe execute 'Ref webdict github_raw ' . expand('<cWORD>')[1:-2] . '/master/README.md'

  " Rust
  command! RustDocsCurrentWord execute 'Ref webdict docs_rs ' . expand('<cword>')
  command! -nargs=1 RustDocs execute 'Ref webdict docs_rs ' '<args>'
  " don't work because this site requires javascript
  " command! RustCratesIOCurrentWord execute 'Ref webdict crates_io ' . expand('<cword>')
  " command! -nargs=1 RustCratesIO execute 'Ref webdict crates_io ' '<args>'
endif
" }}}
"
"===============================
" fzf.vim                    {{{
"===============================
"
if s:plug.is_installed('fzf.vim')
  let g:fzf_command_prefix = 'FZF'

  function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
  endfunction

  let g:fzf_action = {
        \ 'ctrl-q': function('s:build_quickfix_list'),
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-s': 'split',
        \ 'ctrl-x': 'split',
        \ 'ctrl-v': 'vsplit' }

  augroup MyFzf
    autocmd!
    autocmd FileType fzf tnoremap <silent> <buffer> <Esc> <C-g>
  augroup END

  command! -bar -bang FZFMapsN call fzf#vim#maps("n", <bang>0)
  command! -bar -bang FZFMapsI call fzf#vim#maps("i", <bang>0)
  command! -bar -bang FZFMapsX call fzf#vim#maps("x", <bang>0)
  command! -bar -bang FZFMapsO call fzf#vim#maps("o", <bang>0)
  command! -bar -bang FZFMapsV call fzf#vim#maps("v", <bang>0)
endif
"
"===============================
" coc.nvim                   {{{
"===============================

if s:plug.is_installed('coc.nvim')
  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif
  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.

  if s:plug.is_installed('lexima.vim')
    " do not imap <CR> ! because endwise do not work.
  else
    if exists('*complete_info')
      inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif
  endif

  " Use `[c` and `]c` to navigate diagnostics
  nmap <silent> [c <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c <Plug>(coc-diagnostic-next)
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " <C-w>p switch floating window

  " Use K to show documentation in preview window
  nnoremap <silent> Q :call <SID>show_documentation()<CR>

  function! s:show_documentation() abort
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " sync coc_global_extensions with enable/disable
  function! s:sync_coc_global_extensions() abort
    let coc_extensions = CocAction('extensionStats')
    for e in coc_extensions
      if index(g:coc_global_extensions, e['id']) >= 0
        if e['state'] == 'disabled'
          call CocActionAsync('toggleExtension', e['id'])
        endif
      else
        if e['state'] != 'disabled'
          call CocActionAsync('toggleExtension', e['id'])
        endif
      endif
    endfor
  endfunction

  function! s:set_tag_func() abort
    " create too heavy tags file
    set tagfunc=CocTagFunc
    for tags_file in tagfiles()
      echom tags_file
      if filereadable(tags_file)
        set tagfunc=
        break
      endif
    endfor
  endfunction

  augroup MyCoc
    autocmd!
    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json,jsonc setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    autocmd BufWritePre *.py Format
    " auto hover
    " autocmd CursorHold * if ! coc#util#has_float() | call CocAction('doHover') | endif
    " https://github.com/neoclide/coc.nvim/issues/1013
    " autocmd FileType vim if bufname('%') == '[Command Line]' | let b:coc_suggest_disable = 1 | endif
    autocmd User CocNvimInit call s:sync_coc_global_extensions()
    autocmd User CocNvimInit call s:set_tag_func()
  augroup end

  nnoremap <coc>   <Nop>
  nmap    ; <coc>
  " Remap for rename current word
  nmap <coc>r <Plug>(coc-rename)
  " Remap for format selected region
  xmap <coc>f  <Plug>(coc-format-selected)
  nmap <coc>f  <Plug>(coc-format-selected)
  " Remap for do codeAction of selected region, ex: `<Leader>aap` for current paragraph
  xmap <coc>as  <Plug>(coc-codeaction-selected)
  nmap <coc>as  <Plug>(coc-codeaction-selected)
  " Remap for do codeAction of current line
  nmap <coc>ac <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <coc>q <Plug>(coc-fix-current)
  nmap <coc>l <Plug>(coc-codelens-action)

  " Introduce function text object
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap <coc>if <Plug>(coc-funcobj-i)
  xmap <coc>af <Plug>(coc-funcobj-a)
  omap <coc>if <Plug>(coc-funcobj-i)
  omap <coc>af <Plug>(coc-funcobj-a)

  " Use <TAB> for selections ranges.
  " NOTE: Requires 'textDocument/selectionRange' support from the language server.
  " coc-tsserver, coc-python are the examples of servers that support it.
  " nmap <silent> <TAB> <Plug>(coc-range-select)
  " xmap <silent> <TAB> <Plug>(coc-range-select)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format call CocAction('format')
  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold call     CocAction('fold', <f-args>)

  " Using CocList
  nnoremap <silent> <coc>m  :<C-u>CocList<cr>
  " Show all diagnostics
  nnoremap <silent> <coc>d  :<C-u>CocDiagnostics<cr>
  nnoremap <silent> <coc>D  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <coc>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <coc>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <coc>o  :<C-u>CocList outline<cr>
  " Search workLeader symbols
  nnoremap <silent> <coc>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <coc>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <coc>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <coc>p  :<C-u>CocListResume<CR>

  command! CocInstallAll CocInstall -sync
  command! CocUninstallAll call s:coc_uninstall_all()

  function! s:coc_plugin_is_installed(name) abort
    let extensions = get(g:, 'coc_global_extensions', {})
    return (count(extensions, a:name) != 0)
  endfunction

  function! s:coc_uninstall_all() abort
    for e in g:coc_global_extensions
      execute "CocUninstall " . e
    endfor
  endfunction

  "----------------
  " Plugins
  if s:coc_plugin_is_installed('coc-snippets')
    imap <C-l> <Plug>(coc-snippets-expand)
    " vmap <C-k> <Plug>(coc-snippets-select)
    let g:coc_snippet_next = '<c-s>'
    let g:coc_snippet_prev = '<c-t>'
    imap <C-s> <Plug>(coc-snippets-expand-jump)
    " inoremap <silent><expr> <TAB>
    "       \ pumvisible() ? coc#_select_confirm() :
    "       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    "       \ <SID>check_back_space() ? "\<TAB>" :
    "       \ coc#refresh()
  endif

  if s:coc_plugin_is_installed('coc-yank')
    highlight HighlightedyankRegion term=bold ctermbg=0 guibg=#13354A
    nnoremap <silent> <Leader>y  :<C-u>CocList -A --normal yank<cr>
  endif

  if s:coc_plugin_is_installed('coc-git')
    " navigate chunks of current buffer
    nmap [g <Plug>(coc-git-prevchunk)
    nmap ]g <Plug>(coc-git-nextchunk)
    " show chunk diff at current position
    nmap gs <Plug>(coc-git-chunkinfo)
    " show commit contains current position
    nmap <coc>gc <Plug>(coc-git-commit)
  endif

  if s:coc_plugin_is_installed('coc-pairs')
    augroup MyCocPairs
      autocmd!
      autocmd FileType vim let b:coc_pairs_disabled = ['"']
    augroup END
  endif

  if s:coc_plugin_is_installed('coc-highlight')
    augroup MyCocHighlight
      autocmd!
      autocmd CursorHold * silent call CocActionAsync('highlight')
    augroup END
  endif

  if s:coc_plugin_is_installed('coc-explorer')
    nmap gx :<C-u>CocCommand explorer --width 30<CR>

    augroup MyCocExplorer
      autocmd!
      autocmd VimEnter * sil! au! FileExplorer *
      autocmd BufEnter * let s:d = expand('%:p') | if IsDir(s:d) | bd | exe 'CocCommand explorer ' . s:d | endif
    augroup END
  endif

  if s:coc_plugin_is_installed('coc-spell-checker')
    command! CSpellAddWordToWorkspaceDictionary CocCommand cSpell.addWordToDictionary
  endif

  if s:coc_plugin_is_installed('coc-actions')
    function! s:cocActionsOpenFromSelected(type) abort
      execute 'CocCommand actions.open ' . a:type
    endfunction
    xmap <silent> <coc>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
    nmap <silent> <coc>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
    xmap <silent> M :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
    nmap <silent> M   :<C-u>execute 'CocCommand actions.open'<CR>
  endif

  if s:coc_plugin_is_installed('coc-translator')
    nmap <coc>t <Plug>(coc-translator-p)
    vmap <coc>t <Plug>(coc-translator-pv)
  endif

  if s:coc_plugin_is_installed('coc-floatinput')
    nmap <silent> <coc>: <Plug>(coc-floatinput-command)
    nmap <silent> <coc>:c <Plug>(coc-floatinput-coc-command)
    nmap <silent> <coc>rn <Plug>(coc-floatinput-rename)
  endif

  if s:coc_plugin_is_installed('coc-fzf-preview')
    function! s:buffers_delete_from_lines(lines) abort
      for line in a:lines
        let matches = matchlist(line, '\[\(\d\+\)\]')
        if len(matches) >= 1
          execute 'Bdelete! ' . matches[1]
        endif
      endfor
    endfunction

    function! s:fzf_preview_settings() abort
      let g:fzf_preview_command = 'bat --color=always --style=grid,header {-1}'
      " let g:fzf_preview_fzf_preview_window_option = 'wrap'
      let g:fzf_preview_filelist_command = 'rg --files --hidden --no-messages -g \!"* *" -g \!".git"'
      if s:plug.is_installed('vim-devicons')
        let g:fzf_preview_use_dev_icons = 1
      endif
      let g:fzf_preview_quit_map = 1

      let g:fzf_preview_custom_processes['open-file'] = fzf_preview#remote#process#get_default_processes('open-file', 'coc')
      let g:fzf_preview_custom_processes['open-file']['ctrl-s'] = g:fzf_preview_custom_processes['open-file']['ctrl-x']
      call remove(g:fzf_preview_custom_processes['open-file'], 'ctrl-x')

      let g:fzf_preview_custom_processes['open-buffer'] = fzf_preview#remote#process#get_default_processes('open-buffer', 'coc')
      let g:fzf_preview_custom_processes['open-buffer']['ctrl-s'] = g:fzf_preview_custom_processes['open-buffer']['ctrl-x']
      call remove(g:fzf_preview_custom_processes['open-buffer'], 'ctrl-q')
      let g:fzf_preview_custom_processes['open-buffer']['ctrl-x'] = get(function('s:buffers_delete_from_lines'), 'name')

      let g:fzf_preview_custom_processes['open-bufnr'] = fzf_preview#remote#process#get_default_processes('open-bufnr', 'coc')
      let g:fzf_preview_custom_processes['open-bufnr']['ctrl-s'] = g:fzf_preview_custom_processes['open-bufnr']['ctrl-x']
      call remove(g:fzf_preview_custom_processes['open-bufnr'], 'ctrl-q')
      let g:fzf_preview_custom_processes['open-bufnr']['ctrl-x'] = get(function('s:buffers_delete_from_lines'), 'name')

      let g:fzf_preview_dev_icons_limit = 5000
      " let g:fzf_preview_default_fzf_options = { '--reverse': v:true }
    endfunction

    augroup my_fzf_preview_buffers
      autocmd!
      autocmd User fzf_preview#initialized call s:fzf_preview_settings()
    augroup END

    " conflict coc-fzf
    let g:fzf_layout = {
          \ 'window': 'call fzf_preview#window#create_centered_floating_window()',
          \ }

    " Map
    nnoremap <fzf-p>   <Nop>
    vnoremap <fzf-p>   <Nop>
    nmap    z <fzf-p>
    vmap    z <fzf-p>

    xnoremap          <CR>         "sy:CocCommand fzf-preview.ProjectGrep<Space>-F<Space><C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>
    nnoremap <silent> <Leader>p    :<C-u>CocCommand fzf-preview.FromResources project_mru git --add-fzf-arg=--keep-right<CR>
    nnoremap <silent> <Leader>.    :<C-u>CocCommand fzf-preview.ProjectFiles --add-fzf-arg=--keep-right<CR>
    nnoremap <silent> <Leader>;    :<C-u>CocCommand fzf-preview.MruFiles --add-fzf-arg=--keep-right<CR>
    nnoremap <silent> <Leader>'    :<C-u>CocCommand fzf-preview.MrwFiles --add-fzf-arg=--keep-right<CR>
    nnoremap <Leader>,             :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
    nnoremap <silent> <fzf-p>p     :<C-u>CocCommand fzf-preview.FromResources project_mru git --add-fzf-arg=--keep-right<CR>
    nnoremap <silent> <fzf-p>.     :<C-u>CocCommand fzf-preview.ProjectFiles --add-fzf-arg=--keep-right<CR>
    nnoremap <silent> <fzf-p>;     :<C-u>CocCommand fzf-preview.MruFiles --add-fzf-arg=--keep-right<CR>
    nnoremap <silent> <fzf-p>'     :<C-u>CocCommand fzf-preview.MrwFiles --add-fzf-arg=--keep-right<CR>
    nnoremap          <fzf-p>,     :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
    vnoremap          <fzf-p>,     y:<C-u>CocCommand fzf-preview.ProjectGrep<Space>"<C-r>=escape(@", '\\.*$^[]')<CR>"
    nnoremap <silent> <fzf-p>g     :<C-u>CocCommand fzf-preview.GitStatus --add-fzf-arg=--keep-right<CR>
    nnoremap <silent> <fzf-p><C-g> :<C-u>CocCommand fzf-preview.GitActions --add-fzf-arg=--keep-right<CR>
    nnoremap <silent> <Leader>g     :<C-u>CocCommand fzf-preview.GitStatus --add-fzf-arg=--keep-right<CR>
    nnoremap <silent> <Leader><C-g> :<C-u>CocCommand fzf-preview.GitActions --add-fzf-arg=--keep-right<CR>
    "nnoremap <silent> <fzf-p>b     :<C-u>CocCommand fzf-preview.Buffers<CR>
    nnoremap <silent> <fzf-p>b     :<C-u>CocCommand fzf-preview.Buffers --add-fzf-arg=--keep-right<CR>
    nnoremap <silent> <fzf-p>a     :<C-u>CocCommand fzf-preview.AllBuffers --add-fzf-arg=--keep-right<CR>
    nnoremap <silent> <fzf-p>m     :<C-u>CocCommand fzf-preview.Marks<CR>
    nnoremap          <Leader>*    :<C-u>CocCommand fzf-preview.Lines --resume --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
    nnoremap <silent> <Leader>/    :<C-u>CocCommand fzf-preview.Lines --resume --add-fzf-arg=--no-sort --add-fzf-arg=--query="'" --resume<CR>
    nnoremap          <Leader><Leader>*  :<C-u>CocCommand fzf-preview.ProjectGrep<Space>"<C-r>=expand('<cword>')<CR>"
    nnoremap          <fzf-p>*     :<C-u>CocCommand fzf-preview.Lines --resume --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
    nnoremap <silent> <fzf-p>/     :<C-u>CocCommand fzf-preview.Lines --resume --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
    nnoremap          <fzf-p>**    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>"<C-r>=expand('<cword>')<CR>"
    nnoremap <silent> <fzf-p><C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
    nnoremap <silent> <fzf-p>j     :<C-u>CocCommand fzf-preview.Jumps<CR>
    nnoremap <silent> <fzf-p>c     :<C-u>CocCommand fzf-preview.Changes<CR>
    nnoremap <silent> <fzf-p>t     :<C-u>CocCommand fzf-preview.Ctags<CR>
    nnoremap <silent> <fzf-p>tb    :<C-u>CocCommand fzf-preview.BufferTags --resume<CR>
    nnoremap <silent> <fzf-p>q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
    nnoremap <silent> <fzf-p>l     :<C-u>CocCommand fzf-preview.LocationList<CR>
    nnoremap          <Leader>gf   :<C-u>CocCommand fzf-preview.FromResources project_mru git --add-fzf-arg=--select-1 --add-fzf-arg=--query="<C-r>=substitute(expand('<cfile>'), '^\.\+/', '', '')<CR>"<CR>

    nnoremap <silent> <fzf-p>v     :<C-u>CocCommand fzf-preview.VistaCtags<CR>
    nnoremap <silent> <fzf-p>vb    :<C-u>CocCommand fzf-preview.VistaBufferCtags<CR>
    nnoremap <silent> <fzf-p>r     :<C-u>CocCommand fzf-preview.CocReferences<CR>
    nnoremap <silent> <fzf-p>d     :<C-u>CocCommand fzf-preview.CocDiagnostics<CR>
    nnoremap <silent> <fzf-p>c     :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>
    nnoremap <silent> <fzf-p>n     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=substitute(@/, '\(^\\v\)\\|\\\(<\\|>\)', '', 'g')<CR>"<CR>
    nnoremap <silent> <fzf-p>h     :<C-u>CocCommand fzf-preview.CommandPalette<CR>

    " resume
    nnoremap <fzf-p-resume>   <Nop>
    vnoremap <fzf-p-resume>   <Nop>
    nmap    Z <fzf-p-resume>
    vmap    Z <fzf-p-resume>
    nnoremap <silent> <Leader>P    :<C-u>CocCommand fzf-preview.FromResources project_mru git --add-fzf-arg=--keep-right --resume<CR>
    nnoremap <silent> <Leader>>    :<C-u>CocCommand fzf-preview.ProjectFiles --add-fzf-arg=--keep-right --resume<CR>
    nnoremap <silent> <Leader>:    :<C-u>CocCommand fzf-preview.MruFiles --add-fzf-arg=--keep-right --resume<CR>
    nnoremap <silent> <Leader>"    :<C-u>CocCommand fzf-preview.MrwFiles --add-fzf-arg=--keep-right --resume<CR>
    nnoremap <Leader>,             :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
    nnoremap <silent> <fzf-p-resume>p     :<C-u>CocCommand fzf-preview.FromResources project_mru git --add-fzf-arg=--keep-right --resume<CR>
    nnoremap <silent> <fzf-p-resume>.     :<C-u>CocCommand fzf-preview.ProjectFiles --add-fzf-arg=--keep-right --resume<CR>
    nnoremap <silent> <fzf-p-resume>;     :<C-u>CocCommand fzf-preview.MruFiles --add-fzf-arg=--keep-right --resume<CR>
    nnoremap <silent> <fzf-p-resume>'     :<C-u>CocCommand fzf-preview.MrwFiles --add-fzf-arg=--keep-right --resume<CR>
    nnoremap          <fzf-p-resume>,     :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
    vnoremap          <fzf-p-resume>.     y:<C-u>CocCommand fzf-preview.ProjectGrep<Space>"<C-r>=escape(@", '\\.*$^[]') --resume<CR>"
    nnoremap <silent> <fzf-p-resume>g     :<C-u>CocCommand fzf-preview.GitStatus --add-fzf-arg=--keep-right --resume<CR>
    nnoremap <silent> <fzf-p-resume>b     :<C-u>CocCommand fzf-preview.Buffers --add-fzf-arg=--keep-right --resume<CR>
    nnoremap <silent> <fzf-p-resume>a     :<C-u>CocCommand fzf-preview.AllBuffers --add-fzf-arg=--keep-right --resume<CR>
    nnoremap <silent> <fzf-p-resume>m     :<C-u>CocCommand fzf-preview.Marks --resume<CR>
    nnoremap <silent> <fzf-p-resume>w     :<C-u>CocCommand fzf-preview.MrwFiles --add-fzf-arg=--keep-right --resume<CR>
    nnoremap <silent> <fzf-p-resume>g     :<C-u>CocCommand fzf-preview.GitStatus --add-fzf-arg=--keep-right --resume<CR>
    nnoremap <silent> <fzf-p-resume>j     :<C-u>CocCommand fzf-preview.Jumps --resume<CR>
    nnoremap <silent> <fzf-p-resume>c     :<C-u>CocCommand fzf-preview.Changes --resume<CR>
    nnoremap <silent> <fzf-p-resume>t     :<C-u>CocCommand fzf-preview.Ctags --resume<CR>
    nnoremap <silent> <fzf-p-resume>tb    :<C-u>CocCommand fzf-preview.BufferTags --resume --resume<CR>
    nnoremap <silent> <fzf-p-resume>q     :<C-u>CocCommand fzf-preview.QuickFix --resume<CR>
    nnoremap <silent> <fzf-p-resume>l     :<C-u>CocCommand fzf-preview.LocationList --resume<CR>
    nnoremap <silent> <fzf-p-resume>n     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=substitute(@/, '\(^\\v\)\\|\\\(<\\|>\)', '', 'g')<CR>"<CR>

    " Command
    command! -bang FZFTodo FzfPreviewProjectGrep FIXME\|TODO<CR>
  endif

  if s:plug.is_installed('coc-fzf')
    call coc_fzf#common#add_list_source('fzf-buffers', 'display open buffers', 'FZFBuffers')
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
  endif

endif

" }}}

