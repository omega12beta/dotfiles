source $ZHOMEDIR/zinit/bin/zinit.zsh

# zsh #
if [[ "${ZSH_INSTALL}" == "true" ]]; then
  # zinit pack for zsh
  if builtin command -v make > /dev/null 2>&1; then
      zinit id-as=zsh as"null" lucid depth=1 \
        atclone"./.preconfig; m {hi}Building Zsh...{rst}; \
          CPPFLAGS='-I/usr/include -I/usr/local/include' CFLAGS='-g -O2 -Wall' LDFLAGS='-L/usr/libs -L/usr/local/libs' \
          ./configure --prefix=\"$ZPFX\" \
            --enable-multibyte \
            --enable-function-subdirs \
            --with-tcsetpgrp \
            --enable-pcre \
            --enable-cap \
            --enable-zsh-secure-free \
            >/dev/null && \
          { type yodl &>/dev/null || \
            { m -u2 {warn}WARNING{ehi}:{rst}{warn} No {cmd}yodl{warn}, manual pages will not be built.{rst}; ((0)); } && \
            { make install; ((1)); } || make install.bin install.fns install.modules } >/dev/null && \
          { type sudo &>/dev/null && sudo rm -f /bin/zsh && sudo cp -vf Src/zsh /bin/zsh; ((1)); } && \
            m {success}The build succeeded.{rst} || m {failure}The build failed.{rst}" \
        atpull"%atclone" nocompile countdown git \
        for @zsh-users/zsh
  fi
fi

###########################################
###             annexes                 ###
###########################################
zinit light zdharma/z-p-test
zinit light zinit-zsh/z-a-rust
zinit light zinit-zsh/z-a-readurl
zinit light zinit-zsh/z-a-patch-dl
zinit light zinit-zsh/z-a-bin-gem-node
zinit light zinit-zsh/z-a-unscope
zinit light zinit-zsh/z-a-default-ice
zinit light zinit-zsh/z-a-submods
zinit light zinit-zsh/z-a-man
zinit load zinit-zsh/z-a-meta-plugins
zinit for \
      zdharma \
      zdharma2 \
      developer \
      console-tools \
      ext-git
# -> provides
    #zdharma/fast-syntax-highlighting
    #zdharma/history-search-multi-word,
    #zdharma/zsh-diff-so-fancy
# -> provides
    #*zdharma */zconvey
    # */zui */zflai
# -> provides
    #molovo/color, molovo/revolver, molovo/zunit
    #github-issues (package), github-issues-srv (package),
    #zunit, voronkovich/gitignore, jonas/tig
# -> provides
    #ogham/exa, BurntSushi/ripgrep, jonas/tig
    #dircolors-material, sharkdp/fd,
    #sharkdp/bat, sharkdp/hexyl,
    #sharkdp/hyperfine, sharkdp/vivid
# -> provides
    #Fakerr/git-recall, paulirish/git-open,
    #paulirish/git-recent, davidosomething/git-my,
    #arzzen/git-quick-stats, iwata/git-now,
    #tj/git-extras, wfxr/forgit

# Functions
source ~/.zsh/rc/functions.zsh

#Aliases
source ~/.zsh/rc/aliases.zsh

#Base Plugins
source ~/.zsh/rc/baseplugs.zsh

#Options
source ~/.zsh/rc/options.zsh

#Plugins
source ~/.zsh/rc/plugins.zsh

#Command Plugs
source ~/.zsh/rc/commandplugins.zsh

#Fzf Plugins
source ~/.zsh/rc/fzf-completionplugs.zsh

#Completions
source ~/.zsh/rc/completions.zsh

#Old+Stuff I don't need
source ~/.zsh/rc/old-post.zsh

zmodload -i zsh/complist
#==============================================================#
##          Completion                                        ##
#==============================================================#

setopt prompt_subst          # escape sequence

autoload -Uz compinit && compinit
zstyle ':completion:*' verbose yes
## _oldlist
## _complete:
## _ignored:
## _match:
## _prefix:
## _approximate:
## _expand:
## _history:
## _correct:
zstyle ':completion:*' completer _oldlist _complete _ignored
zstyle ':completion:*:messages' format '%F{yellow}%d'
zstyle ':completion:*:warnings' format '%B%F{red}No matches for:''%F{white}%d%b'
zstyle ':completion:*:descriptions' format '%B%F{white}--- %d ---%f%b'
zstyle ':completion::corrections' format ' %F{green}%d (errors: %e) %f'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' recent-dirs-insert both
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' special-dirs true
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' use-cache true
# zstyle show completion menu if 1 or more items to select
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:cd:*' group-order local-directories path-directories
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' file-sort 'modification'

# make completion is slow
zstyle ':completion:*:make:*:targets' call-command true
zstyle ':completion:*:make::' tag-order targets:
zstyle ':completion:*:*:*make:*:targets' command awk \''/^[a-zA-Z0-9][^\/\t=]+:/ {print $1}'\' \$file
#zstyle ':completion:*:*:make:*:targets' ignored-patterns '*.o'
#zstyle ':completion:*:*:*make:*:*' tag-order '!targets !functions !file-patterns'
#zstyle ':completion:*:*:*make:*:*' avoid-completer '_files'

#
#zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
#zstyle ':completion:*' expand prefix suffix
#zstyle ':completion:*' file-sort modification
#zstyle ':completion:*' format '%d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' insert-unambiguous false
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' list-suffixes true
#zstyle ':completion:*' menu select=1
#zstyle ':completion:*' original true
#zstyle ':completion:*' preserve-prefix '//[^/]##/'
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/omega12beta//.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
