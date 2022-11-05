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
zstyle ':completion:*' list-colors $LSCOLORS
# zinit installing script
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# load zinit
source "$HOME/.local/share/zinit/zinit.git/zinit/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# End of lines added by compinstall

# zinit plugin zsh-plugin-install
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# tab completion
autoload -Uz compinit && compinit

alias ls='exa --icons --git-ignore -a'
alias ll='exa --icons --git-ignore -la'
alias llg='exa --icons --git-ignore -la --git'
alias lt='exa --icons  --git-ignore -TaL 2 '
alias lta='exa --icons -Ta --git'

alias cls=clear

# export local programs onto $PATH
export PATH=~/.local/bin:$PATH

# z:directory jumper 
source ~/.local/bin/z/z.sh

source ~/.cargo/env
# source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pasted from https://github.com/jarun/nnn/blob/master/emisc/quitcd/quitcd.bash_zsh
n ()
{
    # Block nesting of nnn in subshells
    if [[ "${NNNLVL:-0}" -ge 1 ]]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The backslash allows one to alias n to nnn if desired without making an
    # infinitely recursive alias
    \nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# starship.rs:custom powerline prompt
eval "$(starship init zsh)"

