# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
export EDITOR=nvim
COLORTERM=truecolor
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/qiy/.zshrc'

autoload -Uz compinit && compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# End of lines added by compinstall

alias ls='exa --icons --git-ignore'
alias ll='exa --icons --git-ignore -la'
alias lt='exa --icons  --git-ignore -TaL 2 '
alias lta='exa --icons -Ta'

alias cls=clear

# export local programs onto $PATH
export PATH=~/.local/bin:$PATH

# z:directory jumper 
source ~/.local/bin/z/z.sh

source ~/.cargo/env
source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# starship.rs:custom powerline prompt
eval "$(starship init zsh)"
