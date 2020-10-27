#==============================================================#
# Unnessecary but I don't like to delete
#==============================================================#
## Have the completion system announce what it is completing
##zstyle ':completion:*' format 'Completing %d'
## Zstyle stuff
#zstyle ':completion:*' completer _oldlist _complete _ignored
#zstyle ':completion:*:messages' format '%F{yellow}%d'
#zstyle ':completion:*:warnings' format '%B%F{red}No matches for:''%F{white}%d%b'
#zstyle ':completion:*:descriptions' format '%B%F{white}--- %d ---%f%b'
#zstyle ':completion::corrections' format ' %F{green}%d (errors: %e) %f'
#zstyle ':completion:*:options' description 'yes'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' keep-prefix
#zstyle ':completion:*' recent-dirs-insert both
#zstyle ':completion:*' list-colors "${LS_COLORS}"
#zstyle ':completion:*' special-dirs true
##zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
#zstyle ':completion:*' use-cache true
## zstyle show completion menu if 1 or more items to select
#zstyle ':completion:*:default' menu select=1
#zstyle ':completion:*:cd:*' tag-order local-directories path-directories
#zstyle ':completion:*:cd:*' group-order local-directories path-directories
#zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
#zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
#zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
#zstyle ':completion:*:manuals' separate-sections true
#zstyle ':completion:*' file-sort 'modification'
#
## make completion is slow
#zstyle ':completion:*:make:*:targets' call-command true
#zstyle ':completion:*:make::' tag-order targets:
#zstyle ':completion:*:*:*make:*:targets' command awk \''/^[a-zA-Z0-9][^\/\t=]+:/ {print $1}'\' \$file
##zstyle ':completion:*:*:make:*:targets' ignored-patterns '*.o'
##zstyle ':completion:*:*:*make:*:*' tag-order '!targets !functions !file-patterns'
##zstyle ':completion:*:*:*make:*:*' avoid-completer '_files'
#
#zstyle ':completion:*:*:*:*:*' menu select
#zstyle ':completion:*:matches' group 'yes'
#zstyle ':completion:*:options' description 'yes'
#zstyle ':completion:*:options' auto-description '%d'
#zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
#zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
#zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
#zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
#zstyle ':completion:*:default' list-prompt '%S%M matches%s'
#zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' verbose yes
#zstyle ':completion::complete:*' use-cache on
#zstyle ':completion::complete:*' cache-path "$HOME/.zcompcache"
#zstyle ':completion:*' list-colors $LS_COLORS
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#
### Ignore completion functions for commands you don't have
#zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
#zstyle ':completion:*' rehash true
#
## complete man pages
#zstyle ':completion:*:manuals' separate-sections true
#zstyle ':completion:*:manuals.(^1*)' insert-sections true
#
## ignore uninteresting user accounts
#zstyle ':completion:*:*:*:users' ignored-patterns \
#    adm apache avahi avahi-autoipd backup bind bin cl-builder colord couchdb daemon dictd festival \
#    games gdm gnats haldaemon halt hplip ident identd irc jetty junkbust kernoops libuuid lightdm \
#    list lp mail mailnull man messagebus named news nfsnobody nobody nscd ntp operator pcap postfix \
#    postgres proxy pulse radvd rpc rpcuser rpm rtkit saned shutdown speech-dispatcher squid sshd \
#    statd stunnel4 sync sys syslog uucp usbmux vcsa vde2-net www-data xfs
#
## ignore uninteresting hosts
#zstyle ':completion:*:*:*:hosts' ignored-patterns \
#    localhost loopback ip6-localhost ip6-loopback localhost6 localhost6.localdomain6 localhost.localdomain
#zstyle ':completion:*:processes' command 'ps -au$USER'
#
## completion of .. directories
#zstyle ':completion:*' special-dirs true
#
## disable sort when completing options of any command
#zstyle ':completion:complete:*:options' sort false
#
#zstyle ':fzf-tab:*' single-group ''
#zstyle ':fzf-tab:complete:_zlua:*' query-string prefix input first
#zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$_EXTRACT'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
#lsd_preview() {
#	zstyle "$1" extra-opts --preview=$_EXTRACT'lsd --group-dirs first --color always --icon always --icon-theme fancy ${~ctxt[hpre]}$in'
#}
#lsd_preview ':fzf-tab:complete:cd:*'
#lsd_preview ':fzf-tab:complete:lsd:*'
#lsd_preview ':fzf-tab:complete:exa:*'
#lsd_preview ':fzf-tab:complete:ls:*'
#lsd_preview ':fzf-tab:complete:_fzz:*'
#zstyle ':fzf-tab:complete:man:*' extra-opts --preview=$_EXTRACT'man ${~ctxt[hpre]}$in'
#
## give a preview of commandline arguments when completing `kill`
#zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
#
#zstyle ":plugin:zconvey" greeting "none"
#zstyle ':notify:*' command-complete-timeout 3
#zstyle ':notify:*' notifier plg-zsh-notify
#
#zstyle ':completion:*' completer _expand _complete _ignored _approximate
#zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
#
### Autocomplete ##
#zstyle ':autocomplete:list-choices:*' max-lines 90%
##zstyle ':autocomplete:*' groups always
#zstyle ':autocomplete:tab:*' fzf yes
#zstyle ':autocomplete:tab:*' widget-style menu-select
##zstyle ':autocomplete:tab:*' widget-style menu-complete
#zstyle ':autocomplete:*' magic off
#zstyle ':autocomplete:*' fuzzy-search off
#zstyle ':autocomplete:*' key-binding off
## zstyle ':autocomplete:*' config off
#zstyle ':autocomplete:*' recent-dirs on
#
### completion ##
# # shift-tab #
#zmodload zsh/complist
#bindkey '^[[Z' reverse-menu-complete
#bindkey -M menuselect '^[[Z' reverse-menu-complete
# In menu-style completion, give a status bar
#zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

#zstyle ':completion:*:*:kill:*' menu yes select
#zstyle ':completion:*:kill:*'   force-list always
#zstyle ":completion:*:descriptions" format "%B%d%b"
#zstyle ':completion:*:*:*:default' menu yes select search
#zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”

# Fuzzy matching of completions
#zstyle ':completion:*' completer _complete _match _approximate
#zstyle ':completion:*:match:*' original only
#zstyle -e ':completion:*:approximate:*' \
#max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
#Wow this shit helps
#zinit load zinit-zsh/z-a-meta-plugins
#
#zinit for annexes+con zdharma2 console-tools molovo ext-git
#
#zinit wait'!0' lucid \
#  light-mode for @t413/zsh-background-notify
#zinit wait'0' lucid \
#  if"(( ${ZSH_VERSION%%.*} > 4.4))" \
#  light-mode for @zsh-users/zsh-history-substring-search
#zinit wait'0' lucid \
#  light-mode for @larkery/zsh-histdb
#zinit wait'2' lucid \
#  atinit"source $ZHOMEDIR/rc/pluginconfig/zsh-cwd-history.zsh" \
#  light-mode for @ericfreese/zsh-cwd-history
## I like per-directory-history. But it includes bugs of share history
#zinit wait'2' lucid as"program" pick"*.plugin.zsh" \
#  atinit"source $ZHOMEDIR/rc/pluginconfig/zsh-directory-history.zsh" \
#  light-mode for @tymm/zsh-directory-history
# -> marlonrichert/zsh-autocomplete
#zinit ice wait'!0b' lucid ver:pu atload"source $ZHOMEDIR/rc/pluginconfig/auto-fu.zsh_atload.zsh"
#zinit light hchbaw/auto-fu.zsh
#zinit ice wait'1' lucid
#zinit light "$HOME/.zsh/rc/myplugins/snippets.zsh"
# Not compatible with auto-fu
#zinit ice wait'0c' lucid atinit"source $ZHOMEDIR/rc/pluginconfig/fzf-ab_atload.zsh"
#zinit light Aloxaf/fzf-tab
# use snippet
#zinit ice wait'0a' lucid id-as"junegunn/fzf_completions" pick"/dev/null" multisrc"shell/{completion,key-bindings}.zsh"
#zinit light junegunn/fzf
# -> rip
#zinit ice wait'1' lucid from"gh-r" as"program" pick"gomi"
#zinit light b4b4r07/gomi
# -> exa
#zinit ice wait'0' lucid
#zinit light supercrabtree/k # ls
# -> powerlevel10k
# Too slow on ssh
# zinit ice wait'!0' lucid atload"source $ZHOMEDIR/rc/pluginconfig/zsh-command-time_atload.zsh"
# zinit light popstas/zsh-command-time
# fz
#FZFZ_RECENT_DIRS_TOOL=zshz
#zinit ice wait'!0' lucid as"program" pick:"fzf-z.plugin.zsh"
#zinit light andrewferrier/fzf-z
# fasd Not updated recently
#zinit ice pick'fasd'
#zinit light clvv/fasd atload'eval "$(fasd --init auto)"'
# asdf
#zinit ice wait'!0' lucid as"program" pick:"bin/anyenv" if"[[ -d "$HOME/.config/anyenv/anyenv-install" ]]" atload'eval "$(anyenv init -)"'
#zinit light anyenv/anyenv
# don't maintain
# zinit ice pick"*.sh" atinit"source $ZHOMEDIR/rc/pluginconfig/z_atinit.zsh"
# zinit light rupa/z
# git-prompt
# zinit ice lucid wait"0" atload"source $ZHOMEDIR/rc/pluginconfig/zsh-async_atload.zsh && set_async"
# zinit light mafredri/zsh-async

# don't use
# zinit ice wait'1' lucid atload"alias rm=gomi"
# zinit light b4b4r07/zsh-gomi
#zsh-users/zsh-syntax-highlighting # -> zdharma/fast-syntax-highlighting
# move
# zplug 'hchbaw/zce.zsh' # -> don't move

# zplug 'felixr/docker-zsh-completion' # -> broken
# fuzzy finder
# unused
#zplug 'b4b4r07/enhancd', use:init.sh
#zplug 'junegunn/fzf-bin', as:command, from:gh-r, rename-to:fzf # -> zplug grep bug
#zplug 'junegunn/fzf', as:command, use:bin/fzf-tmux

#zplug "autojump" # ->z
#zplug "tarruda/zsh-autosuggestions" # ->auto-fu
#zplug 'mollifier/anyframe' # -> fzf
#zplug 'zsh-users/zaw' # -> fzf
zinit ice wait"0" lucid
zinit light @zimfw/completion

#maybe this will work
# eval 'shuf -n 1 $ZINITDIR/plugins/bhayward93---Linus-rants-ZSH/rants.tsv | cut -f6 | cowsay -f tux | lolcat'
# Important
zinit ice wait"1" lucid
zinit light kazhala/dotbare
#--------------------------------------------------------------#
##          Post Execution                                    ##
#--------------------------------------------------------------#

# Load The Prompt System And Completion System And Initilize Them.
autoload -Uz compinit promptinit

source $HOME/.zinit/plugins/kazhala---dotbare/dotbare.plugin.zsh
_dotbare_completion_cmd
_dotbare_completion_git

# Load And Initialize The Completion System Ignoring Insecure Directories With A
# Cache Time Of 20 Hours, So It Should Almost Always Regenerate The First Time A
# Shell Is Opened Each Day.
# See: https://gist.github.com/ctechols/ca1035271ad134841284
_comp_files=(${ZDOTDIR:-$HOME}/.zcompdump(Nm-20))
if (( $#_comp_files )); then
    compinit -i -C
else
    compinit -i
fi
unset _comp_files
promptinit