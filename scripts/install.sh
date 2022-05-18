#!/bin/sh
echo "==================================================================================================="
printf "install \033[1;37mbrew\033[0;39m and \033[1;37mpackages\033[0;39m.\n"
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
cd $THIS_DIR

echo "run brew doctor ..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update ..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade ..."
brew upgrade

brew bundle --global

brew cleanup

printf "\033[0;32mbrew installation finished successfully!\033[0;39m\n"
