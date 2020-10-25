"==============================================================
"               .vimrc
"==============================================================

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initial Configuration
source ~/.vim/rc/init.vim

" Functions
source ~/.vim/rc/function.vim

" Key mapping
" source ~/.vim/rc/keyconfig.vim
source ~/.vim/rc/mappings.vim

" Base Configuration
source ~/.vim/rc/base.vim
if has('nvim')
  source ~/.vim/rc/base.nvim
endif

" Layout Settings
source ~/.vim/rc/display.vim

" Plugins
source ~/.vim/rc/pluginlist.vim

" Command
source ~/.vim/rc/command.vim
source ~/.vim/rc/autocmd.vim

" Personal Plugin Settings
source ~/.vim/rc/pluginconfig.vim