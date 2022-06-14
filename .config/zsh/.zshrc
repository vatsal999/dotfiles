export TERM="xterm-256color"

# HISTORY
SAVEHIST=50000
HISTSIZE=50000
HISTFILE="$HOME/.cache/zsh/.zsh_history"
setopt HIST_SAVE_NO_DUPS    # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt EXTENDED_HISTORY     # Write the history file in the ":start:elapsed;command" format.
setopt SHARE_HISTORY        # Share history between all sessions.
setopt INC_APPEND_HISTORY   # Write to the history file immediately, not when the shell exits.


# VIM MODE
bindkey -v
bindkey "^?" backward-delete-char

export PATH="$HOME/.local/bin/:/usr/local/bin:$PATH"
autoload -U compinit
#

### CHANGE TITLE OF TERMINALS
# 
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#
# ALIASES
#
# these lines required for prompt to work
setopt promptsubst
autoload -Uz colors && colors
autoload -Uz promptinit && promptinit

alias clock="tty-clock -c -C 7"

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#load agnoster prompt theme
source "$ZDOTDIR/agnoster.zsh"

# install zsh-autosuggestions and zsh-syntax-highlighting from pacman community
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#for homebrew installation (MacOS)
#source /opt/share/homebrew/


