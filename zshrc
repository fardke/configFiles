if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi



HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=$HISTSIZE

eval `dircolors -b`
setopt EXTENDED_HISTORY        # puts timestamps in the history
setopt HIST_VERIFY        # when using ! cmds, confirm first
setopt HIST_IGNORE_DUPS        # ignore same commands run twice+
setopt APPEND_HISTORY        # don't overwrite history 
setopt SHARE_HISTORY        # _all_ zsh sessions share the same history files
setopt INC_APPEND_HISTORY    # write after each command
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

autoload -Uz zfinit && zfinit
autoload -Uz zcalc
autoload -Uz compinit && compinit
autoload -Uz zsh-mime-setup
autoload -Uz zsh-mime-handler
zsh-mime-setup
autoload -Uz colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable hg git svn
zstyle ':mime:*' mailcap ~/.mailcap

setopt autocd

source $HOME/configFiles/precmd
COLORPROMPT="%{$fg_bold[cyan]%}"
if [ $USERNAME = "root" ]; then
    COLORPROMPT="%{$fg_bold[red]%}"
fi
PROMPT="${vcs_info_msg_0_}$COLORPROMPT%n@%M:%{$fg_bold[yellow]%}%~%{$fg_bold[red]%}%(?..[%?])%{$fg_bold[yellow]%} %# %{$reset_color%}"

bindkey -v
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[7~" beginning-of-line
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
bindkey '^R' history-incremental-search-backward
# for rxvt
bindkey "\e[8~" end-of-line

# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line

# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -al'
alias grep='grep --exclude='tags' --color=auto'
alias asciidoc='/usr/bin/asciidoc -n -a toc -a toclevels=4 -a max-width=55em -a icons'
alias tree='tree -C'
alias minicom='sudo minicom -c on -C /tmp/minicom.cap -D'
alias python='python2.7'
alias tmuxboulot='ssh kewindesktop -t tmux -u attach -t 0'
alias gcalcli='python2.7 gcalcli'
alias wgcalcli='watch --color python2.7 gcalcli calw --nolineart --tsv --military -w 27'
alias cda='cd /home/kewin/.config/awesome'
alias wookie='python2 /home/kewin/devNotOnBoard/wookie/wookie/wookie.py start'
alias gd='git d'
alias mpolka='minicom /dev/ttyUSB1'
alias mbetty='minicom /dev/ttyUSB0'
alias tpolka='telnet 10.60.39.85'
alias vi='vim -O'
alias ubundroid='cd /opt/uck/; sudo ./uck-remaster-chroot-rootfs /opt/ubundroid/ zsh'

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk/bin
export PATH=$JAVA_HOME:/opt/uck/:$PATH:$HOME/bin/:/usr/local/bin
export EDITOR=vim


source $HOME/devNotOnBoard/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
