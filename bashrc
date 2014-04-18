#
# ~/.bashrc

[[ $- != *i* ]] && return

PS1="[\t][\[\e[33m\]\u\[\e[32m\]@\h \[\e[1;36m\]\W\[\e[0m\]]\$ "
if [ -d ~/bin ] ;then
 PATH=~/bin:"$PATH"
fi

if [ -f /etc/bash_completion ] ;then
    . /etc/bash_completion
fi

if [ -f $HOME/.bash_spec ] ;then
    . $HOME/.bash_spec
fi

export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=20000
export EDITOR="vim"
export LANG="fr_FR.UTF-8"

alias ls='ls --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'
alias asciidoc='/usr/bin/asciidoc -n -a toc -a toclevels=4 -a max-width=55em -a icons'
alias vi='vi -O'

export TERM="rxvt-unicode-256color"
