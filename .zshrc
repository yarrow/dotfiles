# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt sharehistory      # all processes share the same history
setopt hist_ignore_dups  # ignore duplicates of the immediately preceeding cmd
#setopt histignorealldups  
setopt hist_no_store     # ignore history command

bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use brew-installed zsh completions
if whence brew; then
    brew_complete=$(brew --prefix)/share/zsh/site-functions
    typeset -U fpath
    fpath=($brew_complete $fpath)
fi

autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' completer _expand _complete
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

bindkey -v "^[p" history-beginning-search-backward
bindkey -v "^[n" history-beginning-search-forward
bindkey -v "^P" vi-up-line-or-history
bindkey -v "^N" vi-down-line-or-history
bindkey -v " " magic-space

setopt pushd_ignore_dups # remove old /foo on pushd /foo
setopt magic_equal_subst # expand foo=~/bar to foo=$HOME/bar
setopt no_clobber        # as in {t,}csh
setopt no_bg_nice        # don't nice commands in the background

alias vim=nvim
alias vi=nvim
export VISUAL=nvim
export EDITOR=nvim
export LESS='-R --ignore-case'
export SUDO_EDITOR=/home/linuxbrew/.linuxbrew/bin/nvim
export STARSHIP_SHELL=zsh
export LS_COLORS='no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:'
eval "$(starship init zsh)"
