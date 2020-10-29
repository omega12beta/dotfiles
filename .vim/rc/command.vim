"==============================================================
"          command                                          {{{
"==============================================================

" CDC = Change to Directory of Current file
command! CdCurrentDirectory lcd %:p:h

" Diff current buffer " :w !diff %-
if !exists(':DiffOrig')
  command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

command! SetNumberToggle set nonu! | set norelativenumber!

" Change indent
command! -nargs=1 IndentChange set tabstop=<args> shiftwidth=<args>

function! ReloadEncoding(args) abort
  execute 'e ++enc=' . a:args
endfunction
command! -nargs=1 EncodingReload call ReloadEncoding(<f-args>)

function! SetCmdLine(args) abort
  let l:input = input('', a:args)
  execute l:input
  call histadd('cmd', l:input)
endfunction

" delete blank lines
command! DeleteBlankLines call SetCmdLine(':g/^$/d')
" count word
command! CountWord call SetCmdLine(':%s/\<<C-r><C-w>\>/&/gn')
command! -range=% SelectedInfo call feedkeys("gvg\<C-g>")

" open definition in preview window
command! PreviewDefinition execute "normal! \<C-w>}"

command! FullPath echo expand("%:p")

" Spell Dictionary
command! AddCorrectSpell execute "normal! zg"
command! AddWrongSpell  execute "normal! zw"
command! ChangeCorrectSpell  execute ':call feedkeys("z=")'
command! FixCorrectSpell  execute ':ChangeCorrectSpell'
command! CorrectSpell  execute ':ChangeCorrectSpell'

" Binary
command! BinaryModeOn %!xxd -g1
command! BinaryModeOff %!xxd -r
command! HexDumpOn %!xxd -g1
command! HexDumpOff %!xxd -r

" Trim whitespace
command! TrimWhiteSpace let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s
" command! TrimWhiteSpace %s/\s\+$//e

" Spell check
command! SpellCheckOff execute "setlocal nospell"
command! SpellCheckOn  execute "setlocal spell! spelllang=en_us"

" Nvim delmark
if has('nvim')
  command! DelMarks delmarks! | wshada!
endif

" sort startuptime
command! SortStartupTime %!sort -k2nr

" json
command! JsonDemangle %!jq '.'

" q record
command! -nargs=1 Recording normal! q<args>

" file fullpath
command! Filepath echo expand('%:p')
au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
au FileType help wincmd L                               " open help in vertical split
au BufWritePre * :%s/\s\+$//e                           " remove trailing whitespaces before saving
au CursorHold * silent call CocActionAsync('highlight') " highlight match on cursor hold

" format with available file format formatter
command! -nargs=0 Format :call CocAction('format')
" organize imports
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
" files in fzf
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)
" advanced grep
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)


" }}}