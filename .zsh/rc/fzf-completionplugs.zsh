# ENHANCD
zinit ice wait"0b" lucid
zinit light b4b4r07/enhancd

#Fuzzy search and edit
#zinit ice wait'5'
#zinit load seletskiy/zsh-fuzzy-search-and-edit


#zinit wait'0' lucid \
#  atinit"source $ZHOMEDIR/rc/pluginconfig/zsh-z_atinit.zsh" \
#  light-mode for @agkozak/zsh-z
# ZSHZ_CMD=j
# ZSHZ_DATA="$ZHOMEDIR/.z"

#fz and z
zinit ice wait"3" pick 'z.sh'
zinit load rupa/z

zinit ice wait"6"
zinit load changyuheng/fz

zinit pick"shell/completion.zsh" src"shell/key-bindings.zsh" for junegunn/fzf

#fzf powered file searcher using bat + fd
zinit ice wait"2"
zinit load leophys/zsh-plugin-fzf-finder

# FZF
zinit ice lucid wait"0b" from"gh-r" as"program"
zinit light junegunn/fzf-bin

export FZF_COMPLETION_TRIGGER=''

#zinit wait'1' lucid \
#  pick"fzf-extras.zsh" \
#  light-mode for @atweiden/fzf-extras # fzf

# after zsh-autocomplete & fzf_completion.zsh
#zinit wait'1c' lucid \
#  atinit"source $ZHOMEDIR/rc/pluginconfig/fz_atinit.zsh" \
#  light-mode for @changyuheng/fz

# FZF-TAB
zinit ice wait"1" lucid
zinit light Aloxaf/fzf-tab

#zinit wait'1' lucid \
#  from"gh-r" as"program" \
#  light-mode for @high-moctane/nextword

