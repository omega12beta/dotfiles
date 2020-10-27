#==============================================================#
## Setup zinit                                                ##
#==============================================================#
if [ -z "$ZPLG_HOME" ]; then
    ZPLG_HOME="${ZHOMEDIR:-$HOME}/zinit"
fi

if ! test -d "$ZPLG_HOME"; then
    mkdir "$ZPLG_HOME"
    chmod g-rwX "$ZPLG_HOME"
    git clone --depth 10 https://github.com/zdharma/zinit.git ${ZPLG_HOME}/bin
fi

typeset -gAH ZPLGM
ZPLGM[HOME_DIR]="${ZPLG_HOME}"
source "$ZPLG_HOME/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#==============================================================#
## Plugin's that don't fit into specific categories           ##
#==============================================================#

zinit ice as"program" pick"yank" make
zinit light mptre/yank

# Stupid but funny
#zinit ice pick"$ZINITDIR/plugins/bhayward93---Linus-rants-ZSH/rants.tsv"
zinit light bhayward93/Linus-rants-ZSH

# tmux
zinit ice pick"init.zsh"
zinit light laggardkernel/zsh-tmux

#--------------------------------#
# alias
#--------------------------------#

zinit wait"0" lucid \
  light-mode for @unixorn/git-extra-commands

#--------------------------------#
# stuff
#--------------------------------#
#zinit wait'1' lucid \
#  pick"asdf.sh" \
#  light-mode for @asdf-vm/asdf

# snippet
#[[ $- == *i* ]] && stty -ixon
#zinit wait'1' lucid blockf nocompletions \
#  from"gh-r" as"program" pick"pet" bpick'*linux_amd64.tar.gz' \
#  atclone'chown -R $(id -nu):$(id -ng) .; zinit creinstall -q knqyf263/pet' \
#  atpull'%atclone' \
#  for @knqyf263/pet
#  zle -N pet-select
#  # move pluginlist because async load occurs below error
#  # stty: 'standard input': Inappropriate ioctl for device
#  # [[ $- == *i* ]] && stty -ixon
#  bindkey '^s' pet-select
