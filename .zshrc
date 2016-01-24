# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
PROMPT='%n@%m:%~$ '
HOSTNAME='minami-VM'
# bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aminami/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


alias ls='ls --color=auto'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias grep='grep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias pd='pushd'
alias pp='popd'
alias chrome='google-chrome'
alias pyserv='python -m SimpleHTTPServer > /dev/null 2>&1 &'
alias paste='xclip -o'
alias f8='flake8'
alias view='vim -R'
alias nxst='sudo service nginx start'
alias nxrst='sudo service nginx restart'
alias sshaf='eval `ssh-agent` && ssh-add'
clip () {
        cat $1 | xclip
    }


#Search command history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

export NVM_DIR="/home/minami/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

source ~/.zsh/git-prompt.sh
setopt PROMPT_SUBST
setopt TRANSIENT_RPROMPT
precmd () {
        RPROMPT='$(__git_ps1 "[%s]")'
    }
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="auto"
    GIT_PS1_DESCRIBE_STYLE="default"
    GIT_PS1_SHOWCOLORHINTS=1
