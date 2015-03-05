# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
PROMPT='%n@%m:%~$ '
# bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aminami/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias chrome='google-chrome'
alias pyserv='python -m SimpleHTTPServer'
alias paste='xclip -o'
alias f8='flake8'
clip () {
        cat $1 | xclip
    }


#Search command history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
