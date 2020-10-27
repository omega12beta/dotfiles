#==============================================================#
##          Base Configuration                                ##
#==============================================================#

HOSTNAME="$HOST"
HISTFILE="$ZHOMEDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=100000
HISTORY_IGNORE="(ls|cd|pwd|zsh|exit|cd ..)"
LISTMAX=1000
KEYTIMEOUT=1
WORDCHARS='*?_-.[]~&;!#$%^(){}<>|'
setopt histappend               # Append history to file, don't overwrite.
setopt histverify               # Show expanded history before running it.
# autoload
autoload -Uz run-help
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
# define in post execution. because compinit is slow and plugin manager automatic load compinit.
# autoload -Uz compinit && compinit -u
autoload -Uz is-at-least

#==============================================================#
##          Options                                           ##
#==============================================================#
# - - - - - - - - - - - - - - - - - - - -
# ZSH Settings
# - - - - - - - - - - - - - - - - - - - -

unsetopt case_glob              # Use Case-Insensitve Globbing.
setopt globdots                 # Glob Dotfiles As Well.
setopt extendedglob             # Use Extended Globbing.
setopt autocd                   # Automatically Change Directory If A Directory Is Entered.

setopt no_beep                 # Disables Beeping

setopt promptsubst             # Most Themes Use This Option.

# General.
setopt brace_ccl                # Allow Brace Character Class List Expansion.
setopt combining_chars          # Combine Zero-Length Punctuation Characters ( Accents ) With The Base Character.
setopt rc_quotes                # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'.
unsetopt mail_warning           # Don't Print A Warning Message If A Mail File Has Been Accessed.

# Jobs.
setopt long_list_jobs           # List Jobs In The Long Format By Default.
setopt auto_resume              # Attempt To Resume Existing Job Before Creating A New Process.
setopt notify                   # Report Status Of Background Jobs Immediately.
unsetopt bg_nice                # Don't Run All Background Jobs At A Lower Priority.
unsetopt hup                    # Don't Kill Jobs On Shell Exit.
unsetopt check_jobs             # Don't Report On Jobs When Shell Exit.

setopt correct                  # Turn On Corrections

# Completion Options.
setopt complete_in_word         # Complete From Both Ends Of A Word.
setopt always_to_end            # Move Cursor To The End Of A Completed Word.
setopt path_dirs                # Perform Path Search Even On Command Names With Slashes.
setopt auto_menu                # Show Completion Menu On A Successive Tab Press.
setopt auto_list                # Automatically List Choices On Ambiguous Completion.
setopt auto_param_slash         # If Completed Parameter Is A Directory, Add A Trailing Slash.
setopt no_complete_aliases

setopt menu_complete            # Do Not Autoselect The First Completion Entry.
unsetopt flow_control           # Disable Start/Stop Characters In Shell Editor.

setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
setopt completealiases        # complete alisases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt nocorrect                # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked

setopt bang_hist                # Treat The '!' Character Specially During Expansion.
setopt inc_append_history       # Write To The History File Immediately, Not When The Shell Exits.
setopt share_history            # Share History Between All Sessions.
setopt hist_expire_dups_first   # Expire A Duplicate Event First When Trimming History.
setopt hist_ignore_dups         # Do Not Record An Event That Was Just Recorded Again.
setopt hist_ignore_all_dups     # Delete An Old Recorded Event If A New Event Is A Duplicate.
setopt hist_find_no_dups        # Do Not Display A Previously Found Event.
setopt hist_ignore_space        # Do Not Record An Event Starting With A Space.
setopt hist_save_no_dups        # Do Not Write A Duplicate Event To The History File.
setopt hist_verify              # Do Not Execute Immediately Upon History Expansion.
setopt extended_history         # Show Timestamp In History.
NO_AUTO_TMUX=1 # enables tmuxpanels automatically
export DOTBARE_DIFF_PAGER="delta --diff-so-fancy --line-numbers"

## Autosuggest ##
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
# ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty bracketed-paste accept-line push-line-or-edit)
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
#bindkey autosuggest-execute
#bindkey autosuggest-clear
#bindkey autosuggest-fetch
#bindkey autosuggest-disable
#bindkey autosuggest-enable
#bindkey autosuggest-toggle
# Group matches and describe.

# key[F1]        = '^[[[A'
# key[F2]        = '^[[[B'
# key[F3]        = '^[[[C'
# key[F4]        = '^[[[D'
# key[F5]        = '^[[[E'
# key[F6]        = '^[[17~'
# key[F7]        = '^[[18~'
# key[F8]        = '^[[19~'
# key[F9]        = '^[[20~'
# key[F10]       = '^[[21~'
# key[F11]       = '^[[23~'
# key[F12]       = '^[[24~'
# key[Shift-F1]  = '^[[25~'
# key[Shift-F2]  = '^[[26~'
# key[Shift-F3]  = '^[[28~'
# key[Shift-F4]  = '^[[29~'
# key[Shift-F5]  = '^[[31~'
# key[Shift-F6]  = '^[[32~'
# key[Shift-F7]  = '^[[33~'
# key[Shift-F8]  = '^[[34~'
#
# key[Insert]    = '^[[2~'
# key[Delete]    = '^[[3~'
# key[Home]      = '^[[1~'
# key[End]       = '^[[4~'
# key[PageUp]    = '^[[5~'
# key[PageDown]  = '^[[6~'
# key[Up]        = '^[[A'
# key[Down]      = '^[[B'
# key[Right]     = '^[[C'
# key[Left]      = '^[[D'
#
# key[Bksp]      = '^?'
# key[Bksp-Alt]  = '^[^?'
# key[Bksp-Ctrl] = '^H'    console only.
#
# key[Esc]       = '^['
# key[Esc-Alt]   = '^[^['
#
# key[Enter]     = '^M'
# key[Enter-Alt] = '^[^M'
#
# key[Tab]       = '^I' or '\t'  unique form! can be bound, but does not 'showkey -a'.
# key[Tab-Alt]   = '^[\t'
# /-Shift-Ctrl = Bksp      = '^?'
# [-Ctrl       = Esc       = '^['
# M-Ctrl       = Enter     = '^M'

# A            = 'a'    (duhhh)
# A-Shift      = 'A'    (who would have guessed?)
# A-Alt        = '^[a'
#
# A-Ctrl       = '^A'
# A-Alt-Ctrl   = '^[^A'
# A-Alt-Shift  = '^[A'
# A-Ctrl-Shift = '^A'   (Shift has no effect)
# bindkey -s '^Xm' "My mistress\' eyes are nothing like the sun."
# Bind 'Ctrl-X' followed by 'm' to a nice line of poetry.

bindkey -v

autoload fzf-cd-widget
zle -N fzf-cd-widget
bindkey "^B" fzf-cd-widget

zle -N fzf-finder-widget-pager
bindkey "^P" fzf-finder-widget-pager

zle -N fzf-history-widget
bindkey "^Y" fzf-history-widget

bindkey '^T' toggle-fzf-tab

zle -N fuck-command-line
bindkey "^[\t" fuck-command-line

#bindkey '^P' fuzzy-search-and-edit

bindkey "^Y" autosuggest-accept

# use the vi navigation keys (hjkl) besides cursor keys in menu completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char        # left
bindkey -M menuselect 'k' vi-up-line-or-history   # up
bindkey -M menuselect 'l' vi-forward-char         # right
bindkey -M menuselect 'j' vi-down-line-or-history # bottom

# Vi Binds
bindkey '^k' vi-cmd-mode # <C-k> for going to command mode

bindkey -M vicmd ' ' execute-named-cmd # Space for command line mode

# Home key variants
bindkey '\e[1~' vi-beginning-of-line
bindkey '\eOH' vi-beginning-of-line

# End key variants
bindkey '\e[4~' vi-end-of-line
bindkey '\eOF' vi-end-of-line

bindkey -M viins '^o' vi-backward-kill-word

bindkey -M vicmd 'yy' vi-yank-whole-line
bindkey -M vicmd 'Y' vi-yank-eol

bindkey -M vicmd 'y.' vi-yank-whole-line
bindkey -M vicmd 'c.' vi-change-whole-line
bindkey -M vicmd 'd.' kill-whole-line

bindkey -M vicmd 'u' undo
bindkey -M vicmd 'U' redo

bindkey -M vicmd 'H' run-help
bindkey -M viins '\eh' run-help

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey -M vicmd '\-' vi-repeat-find
bindkey -M vicmd '_' vi-rev-repeat-find

bindkey -M viins '\e.' insert-last-word
bindkey -M vicmd '\e.' insert-last-word

bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line

# Disable moving one char back after switching to insert mode.
vi-esc-fix() {
  zle vi-cmd-mode
  zle forward-char
}
zle -N vi-esc-fix
bindkey -r "\e"
bindkey -M viins "\e" vi-esc-fix

# Hit e in command mode to edit current command line.
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd e edit-command-line

# Suspend and foreground vim
foreground-nvim() {
  fg %nvim
}
zle -N foreground-nvim
bindkey '^Z' foreground-nvim

# In the line editor, number of matches to show before asking permission
LISTMAX=9999

zstyle ':plugin:history-search-multi-word' reset-prompt-protect 1

# disable slow completion
__git_remote_repositories() {}
_remote_files() {}

palette() { local colors; for n in {000..255}; do colors+=("%F{$n}$n%f"); done; print -cP $colors; }

eval $(thefuck --alias)
# #==============================================================#
# ##          Spaceship Prompt                                  ##
# #==============================================================#
# SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
# SPACESHIP_PROMPT_DEFAULT_PREFIX="➤·"
# SPACESHIP_TIME_SHOW=true
# SPACESHIP_TIME_PREFIX="∞·"
# SPACESHIP_CHAR_PREFIX=" {"
# SPACESHIP_CHAR_SUFFIX="}➤ "
# SPACESHIP_CHAR_SYMBOL="ꭥⅻ β"
# SPACESHIP_USER_PREFIX="➤ "
# SPACESHIP_DIR_PREFIX="🖿 "
# SPACESHIP_GIT_PREFIX="▻ "
# SPACESHIP_NODE_SHOW=false
# SPACESHIP_PYENV_SYMBOL="ꓑ "
# SPACESHIP_EXEC_TIME_PREFIX="⮑ "
# SPACESHIP_BATTERY_THRESHOLD=80
# SPACESHIP_VI_MODE_SHOW=true
# SPACESHIP_VI_MODE_PREFIX="{𖼈i} "
# SPACESHIP_VI_MODE_INSERT="[I]⌁"
# SPACESHIP_VI_MODE_NORMAL="[ꓠ]⌁"
#
# SPACESHIP_PROMPT_ORDER=(
#   time          # Time stamps section
#   user          # Username section
#   dir           # Current directory section
#   host          # Hostname section
#   git           # Git section (git_branch + git_status)
#   #hg            # Mercurial section (hg_branch  + hg_status)
#   package       # Package version
#   node          # Node.js section
#   ruby          # Ruby section
#   #elixir        # Elixir section
#   #xcode         # Xcode section
#   #swift         # Swift section
#   golang        # Go section
#   php           # PHP section
#   rust          # Rust section
#   #haskell       # Haskell Stack section
#   #julia         # Julia section
#   docker        # Docker section
#   #aws           # Amazon Web Services section
#   #gcloud        # Google Cloud Platform section
#   venv          # virtualenv section
#   #conda         # conda virtualenv section
#   pyenv         # Pyenv section
#   #dotnet        # .NET section
#   #ember         # Ember.js section
#   #kubectl       # Kubectl context section
#   #terraform     # Terraform workspace section
#   exec_time     # Execution time
#   line_sep      # Line break
#   battery       # Battery level and status
#   vi_mode       # Vi-mode indicator
#   jobs          # Background jobs indicator
#   exit_code     # Exit code section
#   char          # Prompt character
# )

