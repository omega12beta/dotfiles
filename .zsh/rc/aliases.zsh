#==============================================================#
##          Aliases                                           ##
#==============================================================#

# cli/cli
alias git=hub
alias hubb='hub browse $(ghq list | fzf --prompt "hub> " --height 40% --reverse | cut -d "/" -f 2,3)'

# Fast shortcuts
alias c='clear'
alias r='reset'
alias q='exit'
alias cd..="cd .." # I often make this mistake

# Because sometimes you don't have the time to put this two letters
alias ..='cd ..'
alias ...='cd ../..'
alias -- -="cd -"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though

# Doing a fast proxy, good for watching netflix and youtube without restrictions
alias proxy='ssh -C2qTnN -D 8080'

# To search process with more details
alias pp="ps axuf | pager"

#FindMem
alias mem='top -l1 | grep PhysMem'

# Because I forget
alias explore="ranger"

#prompts when you overwrite something using cp ("oops, wrong folder")
alias cp='cp -i'

#prompts when you delete more than three files ("oops, a space too much in rm ./ *")
alias rm='rm -I'

# Random
alias pacman='sudo pacman'

alias cat='bat'
alias ping='prettyping --nolegend'

alias preview="fzf --preview 'bat --color \"always\" {}'"

#Color grep
alias grep='grep  --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn}'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

#getip
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\   -f2"

#Reload Audio
alias reload_sound='pulseaudio -k && sudo alsa force-reload' # when sound messes up

#Find local machines
alias nwho='ping -b -c 2 255.255.255.255 2>&1 | grep "bytes from" | cut -d " " -f 4 | sort | uniq | sed -e "s/://g"'

# Do something and receive a desktop alert when it completes `sudo apt-get install something | alert`
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# GHQ
alias ghq-repos="ghq list -p | fzf --prompt 'GHQ> ' --height 40% --reverse"
alias ghq-repo='cd $(ghq-repos)'

# NavTools
alias naliases=n-aliases ncd=n-cd nenv=n-env nfunctions=n-functions nhistory=n-history
alias nkill=n-kill noptions=n-options npanelize=n-panelize nhelp=n-help

# SharkDP
alias rg=batgrep.sh
alias bd=batdiff.sh
alias man=batman.sh

## common ##
alias rm='rm-trash'
alias del='rm -rf'
alias cp='cp -irf'
alias mv='mv -i'
alias ..='cd ..'
alias zcompile_zshrc='zcompile ~/.zshrc'
alias rez='exec zsh'
alias sc='screen'
alias l='less'
alias less-plain='LESS="" less'
alias sudo='sudo -H'
alias cl='clear'
alias dircolor='eval `dircolors -b $ZHOMEDIR/dircolors`'
alias quit='exit'

# grep w/ color
alias grep='grep -H -n -I --color=auto'

## application ##
# vi
alias vi="$EDITOR"
alias v="$EDITOR"
alias sv="sudo $EDITOR"
alias nv='nvim'

## development ##
alias py='python'

## Stuff ##
alias pl='print -rl --'
#alias ls="gls -bh --color=auto"
alias ls="exa -bh --color=auto"
alias l="ls"      l.='ls -d .*'   la='ls -a'   ll='ls -lbt created'  rm='command rm -i'
alias df='df -h'  du='du -h'      cp='cp -v'   mv='mv -v'      plast="last -20"
alias reload="exec $SHELL -l -i"  grep="command grep --colour=auto --binary-files=without-match --directories=skip"
# Quick typing
alias n1ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias n1ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias n1sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias n1httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
#==============================================================#
##          Suffix                                            ##
#==============================================================#

alias -s {md,markdown,txt}="$EDITOR"
alias -s {html,gif,mp4}='x-www-browser'
alias -s rb='ruby'
alias -s py='python'
alias -s hs='runhaskell'
alias -s php='php -f'
alias -s {jpg,jpeg,png,bmp}='feh'
alias -s mp3='mplayer'
function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf "$1";;
    *.tar.xz) tar Jxvf "$1";;
    *.zip) unzip "$1";;
    *.lzh) lha e "$1";;
    *.tar.bz2|*.tbz) tar xjvf "$1";;
    *.tar.Z) tar zxvf "$1";;
    *.gz) gzip -d "$1";;
    *.bz2) bzip2 -dc "$1";;
    *.Z) uncompress "$1";;
    *.tar) tar xvf "$1";;
    *.arj) unarj "$1";;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

# web-server
alias web-server='python -m SimpleHTTPServer 8000'

# generate password
alias generate-passowrd='openssl rand -base64 20'

# translate
alias transj='trans ja:'
alias tj='trans ja:'
alias te='trans :ja'

# vim
alias vim_startuptime='vi --startuptime /tmp/vim_startuptime.log -c "quit" && tail -n 1 /tmp/vim_startuptime.log | cut -d " " -f1 | tr -d "\n" && echo " [ms]"'
alias vim_startuptime_slower_than_default='echo "scale=3; $(vi --startuptime /tmp/vim_startuptime.log -c "quit" > /dev/null && tail -n 1 /tmp/vim_startuptime.log | cut -d " " -f1) / $(vi -u DEFAULTS --startuptime /tmp/vim_startuptime_def.log  -c "quit" > /dev/null && tail -n 1 /tmp/vim_startuptime_def.log | cut -d " " -f1)" | bc | xargs -i echo {}x slower your Vim than the default.'

#==============================================================#
##          ArchLinux                                         ##
#==============================================================#

if [ -f /etc/arch-release ] ;then
  # install
  alias pac-update='sudo pacman -Sy'
  alias pac-upgrade='sudo pacman -Syu'
  alias pac-upgrade-force='sudo pacman -Syyu'
  alias pac-install='sudo pacman -S'
  alias pac-remove='sudo pacman -Rs'
  # search remote package
  alias pac-search='sudo pacman -Ss'
  alias pac-package-info='sudo pacman -Si'
  # search local package
  alias pac-installed-list='sudo pacman -Qs'
  alias pac-installed-package-info='sudo pacman -Qi'
  alias pac-installed-list-export='sudo pacman -Qqen' # import: sudo pacman -S - < pkglist.txt
  alias pac-installed-files='sudo pacman -Ql'
  alias pac-unused-list='sudo pacman -Qtdq'
  alias pac-search-from-path='sudo pacman -Qqo'
  # search package from filename
  alias pac-included-files='sudo pacman -Fl'
  alias pac-search-by-filename='sudo pkgfile'
  # log
  alias pac-log='cat /var/log/pacman.log | \grep "installed\|removed\|upgraded"'
  alias pac-aur-packages='sudo pacman -Qm'
  # etc
  alias pac-clean='sudo pacman -Sc'
  # aur
  if builtin command -v yay > /dev/null 2>&1; then
    alias yay-installed-list='yay -Qm'
    alias yay-clean='yay -Sc'
  fi
fi
