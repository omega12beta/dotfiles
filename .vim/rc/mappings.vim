

"==============================================================
"          Key mapping                                      {{{
"==============================================================
"" General Binds ""
" instead of using Ctrl+w + <movement>:
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
" Instead of using Ctrl+w + <movement>:
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
" Switch between buffers with tab
nmap <C-tab> :bn<CR>
" close buffer
nmap <leader>d :bd<CR>
" close all buffers
nmap <leader>D :bufdo bd<CR>
" File to ignore for autocomplete, also used by Ctrlp
set wildignore+=*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak,*.tar,*.zip,*.tgz
set wildignore+=*/.hg/*,*/.svn/*,*/.git/*
set wildignore+=*/vendor/cache/*,*/public/system/*,*/tmp/*,*/log/*,*/solr/data/*,*/.DS_Store
" Saving and exit
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :q!<CR>
"" the essentials
noremap <leader>e :PlugInstall<CR>
noremap <C-q> :wq<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"   <leader>dd    - Jump to definition of current symbol
"   <leader>dr    - Jump to references of current symbol
"   <leader>dj    - Jump to implementation of current symbol
"   <leader>ds    - Fuzzy search current project symbols
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
nnoremap <silent> <leader>ds :<C-u>CocList -I -N --top symbols<CR>

nmap <Leader>py <Plug>(Prettier)

map <C-g>s :Gstatus<CR>
map <C-g>b :Gblame<CR>
map <C-g>c :Gcommit
map <C-g>h :Git checkout
map <C-g>r :Gread<CR>
map <C-g>w :Gwrite<CR>
map <C-g>d :Gdiff<CR>
map <C-g>p :Gpush<CR>
map <C-g>g :Gpull<CR>

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

nnoremap <silent> <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>c :Commands<CR>
nmap <leader>t :BTags<CR>
nmap <leader>/ :Rg<CR>
nmap <leader>gc :Commits<CR>
nmap <leader>gs :GFiles?<CR>
nmap <leader>sh :History/<CR>
" show mapping on all modes with F1
nmap <F1> <plug>(fzf-maps-n)
imap <F1> <plug>(fzf-maps-i)
vmap <F1> <plug>(fzf-maps-x)

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

" Normal mode: Jump to definition under cursore
nnoremap <leader>j :AnyJump<CR>
" Visual mode: jump to selected text in visual mode
xnoremap <leader>j :AnyJumpVisual<CR>
" Normal mode: open previous opened file (after jump)
nnoremap <leader>ab :AnyJumpBack<CR>
" Normal mode: open last closed search window again
nnoremap <leader>al :AnyJumpLastResults<CR>

" toggle file explorer visibility
map <C-A> :NERDTreeToggle<CR>
" Denite
nnoremap <silent> <C-t> :DeniteBufferDir file/rec<CR>
nnoremap <silent> <localleader>t :DeniteBufferDir file/rec/noignore<CR>
nnoremap <silent> <Leader>ls :DeniteBufferDir file/rec<CR>
nnoremap <silent> <Leader>lS :DeniteBufferDir file/rec/noignore<CR>
nnoremap <silent> <Leader>lu :execute 'Denite file/rec:' . expand('%:p:h:h')<CR>
nnoremap <silent> <Leader>lU :execute 'Denite file/rec/noignore:' .
            \ expand('%:p:h:h')<CR>
nnoremap <silent> <Leader>sd :call <SID>DeniteScanDir()<CR>
nnoremap <silent> <Leader>sD :call <SID>DeniteScanDir(0)<CR>
nnoremap <silent> <localleader>z :Denite z<CR>
nnoremap <silent> <localleader>c :DeniteBufferDir directory_rec<CR>
nnoremap <silent> <localleader>d :DeniteBufferDir directory_rec/noignore<CR>
nnoremap <silent> <localleader>p :DeniteBufferDir -no-start-filter parent_dirs<CR>
nnoremap <silent> <Leader>rd :Denite fast_file_mru<CR>
nnoremap <silent> <Leader>be :Denite buffer<CR>
nnoremap <silent> <Leader>tl :call <SID>DeniteTasklist()<CR>
nnoremap <silent> <Leader>tL :call <SID>DeniteTasklist('.')<CR>
nnoremap <silent> <Leader>rg :lcd %:p:h<CR>:call <SID>DeniteGrep(1)<CR>
nnoremap <silent> <Leader>rG :lcd %:p:h<CR>:call <SID>DeniteGrep(0)<CR>
nnoremap <silent> <Leader>ig :lcd %:p:h<CR>:call <SID>DeniteGrep(1, 1)<CR>
nnoremap <silent> <Leader>iG :lcd %:p:h<CR>:call <SID>DeniteGrep(0, 1)<CR>
nnoremap <silent> <Leader>dg :lcd %:p:h<CR>:DeniteCursorWord -no-start-filter
            \ grep<CR>
nnoremap <silent> <Leader>he :Denite help<CR>
nnoremap <silent> <Leader>yh :Denite neoyank<CR>
nnoremap <silent> <Leader>sh :Denite history:search<CR>
nnoremap <silent> <Leader>ch :Denite command_history<CR>
nnoremap <silent> <Leader>sm :Denite output:messages<CR>
nnoremap <silent> <Leader>me :Denite output:map<CR>
nnoremap <silent> <Leader>uf :Denite output:function<CR>
nnoremap <silent> <Leader>dl :Denite line:forward<CR>
nnoremap <silent> <Leader>dw :DeniteCursorWord line:forward<CR>
vnoremap <silent> <Leader>dw :call <SID>DeniteVisualSearch('forward')<CR>
nnoremap <silent> <Leader>dq :Denite -post-action=suspend quickfix<CR>
nnoremap <silent> <Leader>gl :Denite gitlog:all<CR>
nnoremap <silent> <Leader>gL :Denite gitlog<CR>
nnoremap <silent> <Leader>bm :Denite dirmark<CR>
nnoremap <silent> <Leader>dr :Denite -resume<CR>
nnoremap <silent> <Leader>dR :Denite -resume -no-start-filter<CR>
nnoremap <silent> ]d :Denite -resume -immediately -cursor-pos=+1<CR>
nnoremap <silent> [d :Denite -resume -immediately -cursor-pos=-1<CR>
nnoremap ]D :<C-u>Denite -resume -cursor-pos=$<CR>
nnoremap [D :<C-u>Denite -resume -cursor-pos=0<CR>
nnoremap <silent> <Leader>te :Denite outline<CR>
nnoremap <silent> <Leader>tE :NeoIncludeMakeCache<CR>:Denite tag:include<CR>

" }}}