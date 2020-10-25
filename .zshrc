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