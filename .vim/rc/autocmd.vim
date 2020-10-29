function! s:set_prompt_buffer_config() abort
  if &l:buftype ==# 'prompt'
    inoremap <buffer> <C-j> <Esc><C-w>j
    inoremap <buffer> <C-k> <Esc><C-w>k
    inoremap <buffer> <C-h> <Esc><C-w>h
    inoremap <buffer> <C-l> <Esc><C-w>l
    " startinsert
  endif
endfunction

" https://github.com/lambdalisue/dotfiles/blob/02549431364232b051cc8bdb5b124e9e75256a6b/nvim/init.vim#L423-L449
function! s:auto_mkdir(dir, force) abort
  if empty(a:dir) || a:dir =~# '^\w\+://' || isdirectory(a:dir) || a:dir =~# '^suda:'
      return
  endif
  if !a:force
    echohl Question
    call inputsave()
    try
      let result = input(
            \ printf('"%s" does not exist. Create? [y/N]', a:dir),
            \ '',
            \)
      if empty(result)
        echohl WarningMsg
        echo 'Canceled'
        return
      endif
    finally
      call inputrestore()
      echohl None
    endtry
  endif
  call mkdir(a:dir, 'p')
endfunction

if has('autocmd')
  augroup MyVimrc
    autocmd!
    autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
    autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin
    autocmd FileType qf setlocal wrap
    "autocmd BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod +x <afile> | endif | endif
    autocmd BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod a+x <afile>" | endif | endif
    autocmd CmdwinEnter * startinsert
    " Check timestamp more for 'autoread'.
    autocmd WinEnter,FocusGained * if !bufexists("[Command Line]") | checktime | endif
    " thincursor https://thinca.hatenablog.com/entry/20090530/1243615055
    " let s:cur_f = 0
    " autocmd WinEnter * setlocal cursorline | let s:cur_f = 0
    " autocmd WinLeave * setlocal nocursorline
    " autocmd CursorHold,CursorHoldI * setlocal cursorline | let s:cur_f = 1
    " autocmd CursorMoved,CursorMovedI * if s:cur_f | setlocal nocursorline | endif

    if has('nvim')
      " winresizer bugs when using startinsert instead of feedkeys
      " autocmd BufEnter,TermOpen,TermEnter term://* startinsert
      " When TermClose is enable, [Process exited 0] is diplayed and terminal window cannot be closed.
      " autocmd BufLeave,TermLeave term://* stopinsert
    endif
    autocmd BufWinEnter,WinEnter * call s:set_prompt_buffer_config()
    autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  augroup END
endif

" python renaming
" autocmd FileType python nnoremap <leader>rn :Semshi rename <CR>

" enable spell only if file type is normal text
let spellable = ['markdown', 'gitcommit', 'txt', 'text', 'liquid', 'rst']

autocmd BufEnter * if index(spellable, &ft) < 0 | set nospell | else | set spell | endif
" coc completion popup

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" startify if no passed argument or all buffers are closed

augroup noargs
    " startify when there is no open buffer left
    autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif
    " open startify on start if no argument was passed
    autocmd VimEnter * if argc() == 0 | Startify | endif
augroup END
" fzf if passed argument is a folder

augroup folderarg
    " change working directory to passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'cd' fnameescape(argv()[0])  | endif
    " start startify (fallback if fzf is closed)
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | Startify  | endif
    " start fzf on passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'Files ' fnameescape(argv()[0]) | endif
augroup END
" Return to last edit position when opening files

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"" Goyo Focus ""
autocmd! User GoyoEnter nested call helpers#goyo#enter()
autocmd! User GoyoLeave nested call helpers#goyo#leave()

"" NerdTree ""
" autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
