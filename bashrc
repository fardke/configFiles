#
# ~/.bashrc

[[ $- != *i* ]] && return

PS1="[\t][\[\e[33m\]\u\[\e[32m\]@\h \[\e[1;36m\]\W\[\e[0m\]]\$ "
if [ -d ~/bin ] ;then
 PATH=/usr/local/bin:~/bin:"$PATH"
fi

PATH=/sbin:"$PATH"

if [ -f /etc/bash_completion ] ;then
    . /etc/bash_completion
fi
complete -cf sudo
if [ -f $HOME/.bash_spec ] ;then
    . $HOME/.bash_spec
fi

export HISTCONTROL=ignoredups
export EDITOR="vim"
export HISTFILESIZE=
export HISTSIZE=

alias ls='ls --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'
alias asciidoc='/usr/bin/asciidoc -n -a toc -a toclevels=4 -a max-width=55em -a icons'
alias vi='vi -O'
alias tree='tree -C'
alias minicom='sudo minicom -c on -C /tmp/minicom.cap -D'
alias python='python2.7'
export TERM="rxvt"

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi
