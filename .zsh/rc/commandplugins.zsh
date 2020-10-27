#--------------------------------#
# improve cd
#--------------------------------#

zinit wait"0" lucid for \
  light-mode @peterhurford/up.zsh \
  light-mode @Tarrasch/zsh-bd \
  light-mode @jocelynmallon/zshmarks

#----------------------------------#
# Programs
#----------------------------------#
zinit ice wait"2"
zinit light @voronkovich/gitignore.plugin.zsh

#zinit ice wait"4"
#zinit light @stevemcilwain/quiver.git

zinit ice wait"3" lucid
zinit light @jsahlen/tmux-vim-integration.plugin.zsh

zinit ice wait"1" lucid
zinit light MichaelAquilina/zsh-you-should-use
YSU_HARDCORE=0

zinit ice wait"2" lucid
zinit light @lukechilds/zsh-nvm

# zinit light brymck/print-alias

zinit ice wait"1" lucid
zinit light @StackExchange/blackbox

zinit ice wait"6"
zinit load @psprint/zsh-cmd-architect

zinit ice wait"1" lucid
zinit light @laggardkernel/zsh-thefuck

zinit ice wait"1"
zinit light @woefe/vi-mode.zsh

zinit ice from"gh-r" as"program" bpick"*.tar.gz" mv"gopass* -> gopass" pick"gopass/gopass"
zinit load @gopasspw/gopass

zinit ice from"gh-r" as"program" mv"jq* -> jq"
zinit load @stedolan/jq

zinit ice from"gh-r" as"program" mv"jiq* -> jiq"
zinit load @fiatjaf/jiq

#some binaries
#zinit wait"1" lucid from"gh-r" as"null" for \
#     sbin"**/fd"        @sharkdp/fd \
#     sbin"**/bat"       @sharkdp/bat \
#     sbin"exa* -> exa"  ogham/exa

# zinit wait'1' lucid \
#   from"gh-r" as"program" mv"exa* -> exa" \
#   atload"alias ls=exa" \
#   light-mode for @ogham/exa

#zinit wait'1' lucid blockf nocompletions \
#  from"gh-r" as'program' pick'ripgrep*/rg' \
#  atclone'chown -R $(id -nu):$(id -ng) .; zinit creinstall -q BurntSushi/ripgrep' \
#  atpull'%atclone' \
#  light-mode for @BurntSushi/ripgrep

# zinit wait'1' lucid blockf nocompletions \
#   from"gh-r" as'program' pick'fd*/fd' \
#   atclone'chown -R $(id -nu):$(id -ng) .; zinit creinstall -q sharkdp/fd' \
#   atpull'%atclone' \
#   light-mode for @sharkdp/fd

#zinit wait'1' lucid \
#  from"gh-r" as"program" pick"bat/bat" mv"bat* -> bat" \
#  atload"export BAT_THEME='TwoDark'; alias cat=bat" \
#  light-mode for @sharkdp/bat

# BAT-EXTRAS
zinit ice wait"1" as"program" pick"src/batgrep.sh" lucid
zinit ice wait"1" as"program" pick"src/batdiff.sh" lucid
zinit light @eth-p/bat-extras

# Safe Trash
zinit wait"1" lucid \
  from"gh-r" as"program" pick"rip*/rip" \
  atload"alias rm='rip --graveyard ~/.local/share/Trash'" \
  light-mode for @nivekuil/rip

# Too Long Didn't Read
zinit wait"1" lucid \
  from"gh-r" as"program" pick"tldr" \
  light-mode for @dbrgn/tealdeer
zinit ice wait"1" lucid as"completion" mv'zsh_tealdeer -> _tldr'
zinit snippet https://github.com/dbrgn/tealdeer/blob/master/zsh_tealdeer

# PS replacement
zinit wait"1" lucid \
  from"gh-r" as"program" bpick'*lnx*' \
  light-mode for @dalance/procs

# Diff
zinit wait"1" lucid \
  from"gh-r" as"program" pick"delta*/delta" \
  light-mode for @dandavison/delta

# Rename
zinit wait"1" lucid \
  from"gh-r" as"program" pick"mmv*/mmv" \
  light-mode for @itchyny/mmv

# neovim
zinit wait"0" lucid \
  from'gh-r' ver'nightly' as'program' pick'nvim*/bin/nvim' \
  atclone'echo "" > ._zinit/is_release' \
  atpull'%atclone' \
  run-atpull \
  light-mode for @neovim/neovim

# loading bar
#zinit ice wait"2" lucid as'command' pick'src/vramsteg' \
#    atclone'cmake .' atpull'%atclone' make  # use Turbo mode
#zinit light psprint/vramsteg-zsh

# denilsonsa/prettyping
zinit ice wait"2" lucid as'program' mv'prettyping* -> prettyping' \
    atload'alias ping=prettyping'
zinit light @denilsonsa/prettyping

# go package stuff
zinit ice from"gh-r" as"program" mv"gotcha_* -> gotcha"
zinit light b4b4r07/gotcha

# node (for coc.nvim)
zinit id-as=node as='readurl|command' \
  nocompletions extract \
  pick'node*/bin/*' \
  dlink='node-v%VERSION%-linux-x64.tar.gz' \
  for https://nodejs.org/download/release/latest/
