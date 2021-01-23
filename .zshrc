# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt autocd beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ken/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PS1='%n@%m %~$ '

alias firefox="firefox-nightly"
neofetch
