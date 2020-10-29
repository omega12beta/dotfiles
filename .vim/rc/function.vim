"==============================================================
"               Util Functions
"==============================================================
"""" Functions """"

" advanced grep(faster with preview)
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" startify file icons
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" check if last inserted char is a backspace (used by coc pmenu)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" show docs on things with K
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! SourceSafe(file)
  if filereadable(expand(a:file))
    execute 'source ' . a:file
  endif
endfunction

function! IsSupportedTrueColor() abort
  if ((has('termtruecolor') && &guicolors == 1) ||
        \ (has('termguicolors') && &termguicolors == 1) ||
        \ (has('nvim') && exists('$NVIM_TUI_ENABLE_TRUE_COLOR')
        \ && !exists('+termguicolors')))
    return v:true
  else
    return v:false
  endif
endfunction

function! IsDir(dir) abort
  return !empty(a:dir) && (isdirectory(a:dir) ||
        \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir)))
endfunction

function! IsNormalBuffer() abort
  if &ft ==? 'qf' ||
        \ &ft ==? 'Vista' ||
        \ &ft ==? 'coc-explorer'
    return v:false
  endif

  if empty(&buftype) ||
        \ &ft ==? 'diff' " for gina diff
    return v:true
  endif

  return v:true
endfunction

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			endif
		endif
	endif
endfunction

" Functions
function! s:DeniteScanDir(...)
    let narrow_dir = input('Input narrowing directory: ', '', 'file')
    if narrow_dir ==# ''
        return
    endif
    let git_ignore = get(a:, 1, 1)
    let source = git_ignore == 1 ? 'file/rec' : 'file/rec/noignore'
    call denite#start([{'name': source, 'args': [narrow_dir]}])
endfunction

function! s:DeniteGrep(...)
    if !executable('rg')
        echoerr 'ripgrep is not installed or not in  your path.'
        return
    endif
    let l:save_pwd = getcwd()
    lcd %:p:h
    let narrow_dir = input('Target: ', '.', 'file')
    if narrow_dir ==# ''
        return
    endif
    " Don't search gitignored files by default
    let extra_args = ''
    let git_ignore = get(a:, 1, 1)
    if git_ignore == 0
        let extra_args = '--no-ignore-vcs '
    endif
    let filetype = input('Filetype: ', '')
    if filetype ==# ''
        let ft_filter = ''
    else
        let ft_filter = '--type ' . filetype
    endif
    " Allow to run in interactive mode (or require an input pattern)
    let grep_args = [narrow_dir, extra_args . ft_filter]
    let interactive = get(a:, 2, 0)
    if interactive == 1
        call add (grep_args, '!')
    endif
    execute 'lcd ' . l:save_pwd
    call denite#start([{'name': 'grep', 'args': grep_args}],
                \ {'start_filter': interactive})
endfunction

function! s:DeniteTasklist(...)
    if a:0 >=1 && a:1 ==# '.'
        let target = a:1
    else
        let target = expand('%')
    endif
    call denite#start([{'name': 'grep',
                \ 'args': [target, '','TODO:\s|FIXME:\s']}])
endfunction

function! s:DeniteVisualSearch(direction)
    let temp = @s
    norm! gv"sy
    let visual_selection = @s
    let visual_selection = escape(visual_selection, '$+%\.{*|@^')
    let @s = temp
    call denite#start([{'name': 'line', 'args': [a:direction]}],
                \ {'input': visual_selection})
endfunction

function! s:DeniteBookmarkAddFunc(path)
    execute 'Denite dirmark/add -default-action=add -immediately-1 -path=' .
                \ expand(a:path)
endfunction
" Note: we need to pass the parent dir of the candidate we want to bookmark
command -nargs=1 -complete=file DeniteBookmarkAdd
            \ call s:DeniteBookmarkAddFunc(<q-args>)

" Buffer mappings (note that the denite buffer only has normal mode)
function! s:denite_mappings() abort
    " Denite buffer
    nnoremap <silent><buffer><expr> <ESC> denite#do_map('quit')
    nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    " Actions
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer> j :<C-u>call
        \ <SID>DeniteMoveCursorCandidateWindow('j', v:count1, 'normal')<CR>
    nnoremap <silent><buffer> <C-n> :<C-u>call
        \ <SID>DeniteMoveCursorCandidateWindow('j', v:count1, 'normal')<CR>
    nnoremap <silent><buffer> k :<C-u>call
        \ <SID>DeniteMoveCursorCandidateWindow('k', v:count1, 'normal')<CR>
    nnoremap <silent><buffer> <C-p> :<C-u>call
        \ <SID>DeniteMoveCursorCandidateWindow('k', v:count1, 'normal')<CR>
    nnoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> <C-s> denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr> <C-r> denite#do_map('redraw')
    nnoremap <silent><buffer><expr> <C-x> denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> <C-y> denite#do_map('do_action', 'yank')
    nnoremap <silent><buffer> <Tab> :call <SID>denite_tab_action()<CR>
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select') . 'k'
    nnoremap <silent><buffer><expr> <C-Space> denite#do_map('toggle_select') . 'k'
    nnoremap <silent><buffer><expr> <localleader>v denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer> <localleader>w <C-w>P
    nnoremap <silent><buffer><expr> <localleader>u denite#do_map('restore_sources')
    nnoremap <silent><buffer><expr> <C-q> denite#do_map('do_action', 'quickfix')
    nnoremap <silent><buffer> <localleader>q :call <SID>denite_quickfix_all()<CR>
    " Custom actions
    nnoremap <silent><buffer><expr> <localleader>j denite#do_map('do_action',
                \ 'scroll_preview_down')
    nnoremap <silent><buffer><expr> <localleader>k denite#do_map('do_action',
                \ 'scroll_preview_up')
    nnoremap <silent><buffer><expr> <localleader>f denite#do_map('do_action', 'defx')
    nnoremap <silent><buffer><expr> <C-t> denite#do_map('do_action',
                \ 'candidate_file_rec')
    nnoremap <silent><buffer><expr> <localleader>c denite#do_map('do_action',
                \ 'candidate_directory_rec')
    nnoremap <silent><buffer><expr> <localleader>p denite#do_map('do_action',
                \ 'candidate_parent_dir')
endfunction

function! s:DeniteMoveCursorCandidateWindow(dir, lines, mode) abort
    " noautocmd is needed to preserve proper cursorline highlight
    if a:mode ==# 'filter'
        noautocmd call win_gotoid(win_findbuf(g:denite#_filter_parent)[0])
    endif
    execute 'normal! ' . a:lines . a:dir
    for nr in range(1, winnr('$'))
        if getwinvar(nr, '&previewwindow') == 1
            call denite#call_map('do_action', 'preview')
            break
        endif
    endfor
    if a:mode ==# 'filter'
        noautocmd call win_gotoid(g:denite#_filter_winid)
        startinsert!
    endif
endfunction

function! s:denite_filter_mappings() abort
    " Denite filter buffer
    inoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
    inoremap <silent><buffer><expr> <ESC> denite#do_map('quit')
    nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
    nnoremap <silent><buffer><expr> <ESC> denite#do_map('quit')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    imap <buffer> <C-e> <Plug>(denite_filter_quit)
    imap <buffer> <C-h> <C-o>h
    " Actions
    inoremap <silent><buffer> <C-j>
        \ <Esc>:call <SID>DeniteMoveCursorCandidateWindow('j', 1, 'filter')<CR>
    inoremap <silent><buffer> <C-n>
        \ <Esc>:call <SID>DeniteMoveCursorCandidateWindow('j', 1, 'filter')<CR>
    inoremap <silent><buffer> <C-k>
        \ <Esc>:call <SID>DeniteMoveCursorCandidateWindow('k', 1, 'filter')<CR>
    inoremap <silent><buffer> <C-p>
        \ <Esc>:call <SID>DeniteMoveCursorCandidateWindow('k', 1, 'filter')<CR>
    inoremap <silent><buffer> <C-u>
        \ <Esc>:call <SID>DeniteMoveCursorCandidateWindow('k', 12, 'filter')<CR>
    inoremap <silent><buffer> <C-d>
        \ <Esc>:call <SID>DeniteMoveCursorCandidateWindow('j', 12, 'filter')<CR>
    inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    inoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
    inoremap <silent><buffer><expr> <C-s> denite#do_map('do_action', 'split')
    inoremap <silent><buffer><expr> <C-r> denite#do_map('redraw')
    inoremap <silent><buffer><expr> <C-x> denite#do_map('choose_action')
    inoremap <silent><buffer><expr> <C-y> denite#do_map('do_action', 'yank')
    inoremap <silent><buffer> <Tab> <ESC>:call <SID>denite_tab_action()<CR>
    inoremap <silent><buffer> <C-Space>
        \ <ESC>:call denite#call_map('toggle_select')<CR><C-w>p
        \ :call cursor(line('.')-1, 0)<CR><C-w>pA
    inoremap <silent><buffer><expr> <localleader>v denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> <localleader>v denite#do_map('do_action', 'preview')
    inoremap <silent><buffer> <localleader>w <Esc><C-w>P
    inoremap <silent><buffer><expr> <localleader>u denite#do_map('restore_sources')
    inoremap <silent><buffer><expr> <C-q> denite#do_map('do_action', 'quickfix')
    inoremap <silent><buffer> <localleader>q <ESC>:call <SID>denite_quickfix_all()<CR>
    " Custom actions
    inoremap <silent><buffer><expr> <localleader>j denite#do_map('do_action',
                \ 'scroll_preview_down')
    inoremap <silent><buffer><expr> <localleader>k denite#do_map('do_action',
                \ 'scroll_preview_up')
    inoremap <silent><buffer><expr> <localleader>f denite#do_map('do_action', 'defx')
    inoremap <silent><buffer><expr> <C-t> denite#do_map('do_action',
                \ 'candidate_file_rec')
    inoremap <silent><buffer><expr> <localleader>c denite#do_map('do_action',
                \ 'candidate_directory_rec')
    inoremap <silent><buffer><expr> <localleader>p denite#do_map('do_action',
                \ 'candidate_parent_dir')
endfunction

" Custom actions
function! s:my_split(context)
    let split_action = 'vsplit'
    if winwidth(winnr('#')) <= 2 * (&textwidth ? &textwidth : 80)
        let split_action = 'split'
    endif
    call denite#do_action(a:context, split_action, a:context['targets'])
endfunction

function! s:defx_open(context)
    let path = a:context['targets'][0]['action__path']
    let file = fnamemodify(path, ':p')
    let file_search = filereadable(expand(file)) ? ' -search=' . file : ''
    let dir = denite#util#path2directory(path)
    if &filetype ==# 'defx'
      call defx#call_action('cd', [dir])
      call defx#call_action('search', [file])
    else
        execute('Defx ' . dir . file_search)
    endif
endfunction

function! s:defx_preview(context)
    let path = a:context['targets'][0]['action__path']
    let dir = denite#util#path2directory(path)
    let file = fnamemodify(path, ':p')
    let file_search = filereadable(expand(file)) ? ' -search=' . file : ''

    let has_preview_win = 0
    let defx_path = 0
    for nr in range(1, winnr('$'))
        if getwinvar(nr, '&previewwindow') == 1
            let has_preview_win = 1
            let defx_var = getbufvar(winbufnr(nr), 'defx')
            let defx_path =  defx_var.paths[0]
        endif
    endfor
    if has_preview_win == 1 && defx_path ==# (dir . '/')
        call defx#custom#column('filename', {'min_width': 23, 'max_width': -55})
        pclose!
        return
    endif

    let pos = win_screenpos(win_getid())
    let win_row = pos[0] - 1
    let win_col = (pos[1] - 1) + winwidth(0) - a:context.preview_width

    execute 'silent rightbelow vertical pedit! defx_tmp'
    wincmd P
    silent! setlocal nobuflisted
    call nvim_win_set_config(win_getid(), {
        \ 'relative': 'editor',
        \ 'row': win_row,
        \ 'col': win_col,
        \ 'width': a:context.preview_width,
        \ 'height': a:context.preview_height,
        \ })
    let fn_width = 45
    call defx#custom#column('filename',
        \ {'min_width': fn_width, 'max_width': fn_width })
    execute 'Defx -no-show-ignored-files -new -split=no ' .
                \ '-ignored-files=.*,__pycache__ ' .
                \ '-auto-recursive-level=1 ' .  dir . file_search
    call defx#call_action('open_tree', 'toggle')
    silent! setlocal norelativenumber nonumber
    doautocmd User denite-preview
    wincmd p
endfunction

function! s:candidate_file_rec(context)
    let path = a:context['targets'][0]['action__path']
    let narrow_dir = denite#util#path2directory(path)
    let sources_queue = a:context['sources_queue'] + [[
            \ {'name': 'file/rec/noignore', 'args': [narrow_dir]},
            \ ]]
    return {'sources_queue': sources_queue}
endfunction

function! s:candidate_directory_rec(context)
    let path = a:context['targets'][0]['action__path']
    let narrow_dir = denite#util#path2directory(path)
    let sources_queue = a:context['sources_queue'] + [[
            \ {'name': 'directory_rec/noignore', 'args': [narrow_dir]},
            \ ]]
    return {'sources_queue': sources_queue}
endfunction

function! s:candidate_parent_dir(context)
    let path = a:context['targets'][0]['action__path']
    let narrow_dir = denite#util#path2directory(path)
    let sources_queue = a:context['sources_queue'] + [[
            \ {'name': 'parent_dirs', 'args': [narrow_dir]},
            \ ]]
    return {'sources_queue': sources_queue}
endfunction

function! s:scroll_preview_down(context)
    wincmd P
    execute 'normal! 10j'
    wincmd p
endfunction

function! s:scroll_preview_up(context)
    wincmd P
    execute 'normal! 10k'
    wincmd p
endfunction

function! s:yank_commit(context)
    let candidate = a:context['targets'][0]['word']
    let commit_hash = matchstr(candidate, '*\s\+\zs\w*\ze\s-')
    call setreg('+', commit_hash)
endfunction

function! s:denite_quickfix_all()
    call denite#call_map('toggle_select_all')
    call denite#call_map('do_action', 'quickfix')
endfunction

function! s:denite_tab_action()
    let source_name = b:denite_statusline.sources
    if match(source_name, '^history') != -1
        " Edit action in history search source is called feedkeys
        call denite#call_map('do_action', 'feedkeys')
    else
        call denite#call_map('do_action', 'edit')
    endif
endfunction
