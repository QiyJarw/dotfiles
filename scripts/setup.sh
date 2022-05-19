#!/bin/sh
dotfiles_root=$(cd $(dirname $0)/.. && pwd)

cd ${dotfiles_root}/scripts

printf "This is dotfiles setup script. Please make sure if dotfile directory is at \033[1;33myour home directory\033[0;39m.\n"
source ${dotfiles_root}/scripts/link.sh # dotfileのリンクをhomeに貼る

source ${dotfiles_root}/scripts/install.sh # brew及びツールのインストール

echo "==================================================================================================="
printf "\033[1;32msetup finished successfully!\033[0;39m\n"
printf "Current shell is ${SHELL}. If you change the shell, you need to type command: \033[1;33m'which zsh | chsh -s'\033[0;39m, and reboot terminal.\n"
printf "Please type command: \33[1;33m'yarn config set global-path '/home/user-name/.local/bin'\33[0;39m to change a global path of yarn.\n"
