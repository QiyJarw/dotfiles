export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/isl@0.18/lib"
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/isl@0.18/include"
export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/isl@0.18/lib"
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/isl@0.18/include"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
source "$HOME/.cargo/env"
source ~/.local/share/icons-in-terminal/icons_bash.sh
. ~/.local/bin/z/z.sh
alias luamake=/usr/local/bin/lua-language-server/3rd/luamake/luamake
eval "$(starship init bash)"
