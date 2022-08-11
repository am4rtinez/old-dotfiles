# Adding aliases.
source $XDG_CONFIG_HOME/.aliases

ZSH_DEFAULT_THEME="$ZDOTDIR/.zprompts/default.zsh"
ZSH_THEME_PATH=$ZDOTDIR/.zprompts/"$(hostname)".zsh
ZSH_PROMPT=$(hostname).zsh

# +-----------------------------------------------------------------------------------------------+
# |                                            PROMT                                              |
# +-----------------------------------------------------------------------------------------------+
 
fpath=("$ZDOTDIR/.zprompts" $fpath)

if [[ -e $ZSH_THEME_PATH ]]; then
  autoload -Uz $ZSH_PROMPT; $ZSH_PROMPT
else
  autoload -Uz promptinit; promptinit
  prompt adam1
fi

# +-----------------------------------------------------------------------------------------------+
# |                                           PLUGINS                                             |
# +-----------------------------------------------------------------------------------------------+
source $ZDOTDIR/.zplugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/.zplugins/zsh-completions/zsh-completions.plugin.zsh

# +-----------------------------------------------------------------------------------------------+
# |                                           HISTORY                                             |
# +-----------------------------------------------------------------------------------------------+

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
HISTDUP=erase

#setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt APPEND_HISTORY
setopt SHARE_HISTORY             # Share history between all sessions.
#setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
#setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
#setopt HIST_VERIFY               # Do not execute immediately upon history expansion


# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Use modern completion system
# Use vcs_info to control version
autoload -Uz compinit add-zsh-hook vcs_info; compinit
setopt prompt_subst
add-zsh-hook precmd vcs_info

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
