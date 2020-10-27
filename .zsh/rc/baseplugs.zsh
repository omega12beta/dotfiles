#--------------------------------#
# prompt
#--------------------------------#
# zinit lucid \
#   if"(( ${ZSH_VERSION%%.*} > 4.4))" \
#   atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
#   light-mode for @zdharma/fast-syntax-highlighting

#zinit light denysdovhan/spaceship-prompt

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light @sindresorhus/pure

zinit ice wait"0" lucid
zinit light @zpm-zsh/colors

###########################################
###             history                 ###
###########################################

# HISTORY SUBSTRING SEARCHING
zinit ice wait"0b" lucid atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
zinit light @zsh-users/zsh-history-substring-search

zinit wait"1" lucid for \
    @psprint/zsh-navigation-tools \
    @zdharma/history-search-multi-word
    #@psprint/zsh-editing-workbench
   # H, ? (from n-history) - run n-help
   # Ctrl-R - start n-history, the incremental, multi-keyword history searcher (Zsh binding)
   # Ctrl-A - rotate entered words (1+2+3 -> 3+1+2)
   # Ctrl-F - fix mode (approximate matching)
   # Ctrl-L - redraw of whole display
   # Ctrl-T - browse themes (next theme)
   # Ctrl-G - browse themes (previous theme)
   # Ctrl-U - half page up
   # Ctrl-D - half page down
   # Ctrl-P - previous element (also done with vim's k)
   # Ctrl-N - next element (also done with vim's j)
   # [, ] - jump directory bookmarks in n-cd and typical signals in n-kill
   # g, G - beginning and end of the list
   # / - show incremental search
   # F3 - show/hide incremental search
   # Esc - exit incremental search, clearing filter
   # Ctrl-W (in incremental search) - delete whole word
   # Ctrl-K (in incremental search) - delete whole line
   # Ctrl-O, o - enter uniq mode (no duplicate lines)
   # Ctrl-E, e - edit private history (when in private history view)
   # F1 - (in n-history) - switch view
   # F2, Ctrl-X, Ctrl-/ - search predefined keywords (defined in config files)
   # atinit'zstyle ":history-search-multi-word" page-size "7"' \
###########################################
###                 Env                 ###
###########################################

zinit ice from"gh-r" as"program" mv"direnv* -> direnv"
zinit light @direnv/direnv

# Pyenv
zinit ice wait as'null' lucid \
    atclone'./bin/pyenv-virtualenv-init init - > zpyenv-virtualenv.zsh' \
    atpull'%atclone' src'zpyenv-virtualenv.zsh' nocompile'!' sbin'bin/*'
zinit light @pyenv/pyenv-virtualenv

zinit ice wait as'command' lucid \
    atinit'export PYENV_ROOT="$PWD"' \
    atclone'PYENV_ROOT="$PWD" ./libexec/pyenv init - > zpyenv.zsh' \
    atpull'%atclone' src'zpyenv.zsh' nocompile'!' pick'bin/pyenv'
zinit light @pyenv/pyenv

# Completion for Pipenv
# zinit ice wait lucid atclone"cp pipenv.plugin.zsh _pipenv"
# zinit snippet https://github.com/gangleri/pipenv/blob/master/pipenv.plugin.zsh
#
# zinit ice wait lucid
# zinit light MichaelAquilina/zsh-autoswitch-virtualenv

###########################################
###                 Git                 ###
###########################################

# github
  zinit wait"1" lucid \
  from"gh-r" as'program' bpick'*linux_*.tar.gz' pick'gh*/**/gh' \
  light-mode for @cli/cli

if [[ ! -r ~/.zsh/completion.local/_gh ]]; then
  gh completion -s zsh > ~/.zsh/completion.local/_gh
fi

zinit wait"1" lucid \
  from"gh-r" as"program" mv"hub-*/bin/hub -> hub" pick"hub" \
  for @github/hub
  # aliases in aliases.zsh

# cd into git root repo
zinit ice silent wait"1"
zinit light @mollifier/cd-gitroot

# zinit ice wait'!0' lucid # -> using as a alias in gitconfig
# zinit light-mode for @caarlos0/zsh-git-sync

###########################################
###              Simple                 ###
###########################################

zinit ice wait lucid
zinit light @mafredri/zsh-async

#ls- adds color and exa alias
zinit ice wait lucid
zinit load @zpm-zsh/ls

#ls when you cd
zinit ice wait"0" lucid
zinit load desyncr/auto-ls

#helps other plugins
zinit ice wait
zinit load willghatch/zsh-hooks

# zsh-autopair
zinit ice wait lucid
zinit load hlissner/zsh-autopair

# SSH-AGENT
zinit light bobsoppe/zsh-ssh-agent

###########################################
###             zdharma                 ###
###########################################
# Zconvey shell integration plugin
zinit wait lucid \
 sbin"cmds/zc-bg-notify" sbin"cmds/plg-zsh-notify" for \
    zdharma/zconvey

zinit light zdharma/zui

zinit lucid wait"1" for \
    zdharma/zbrowse

zinit light zdharma/zplugin-crasis

zinit wait"2" lucid for \
    zdharma/declare-zsh

zinit wait"2" lucid for \
    zinit-zsh/zinit-console

#zinit light zdharma/zzcomplete