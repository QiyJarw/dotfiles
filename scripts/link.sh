#!/bin/sh
echo "==================================================================================================="
dotfiles_root=$(cd $(dirname $0)/.. && pwd)

# /dotfilesに移動
cd ${dotfiles_root}

# dotfilesの管理対象外の一覧を取得
IGNORE=${dotfiles_root}/.ignore
ignore_list=()
is_omitted=0

while read line
do
	ignore_list+=$line
done < $IGNORE

echo ""
# dotfilesディレクトリの中身のリンクをホームディレクトリ直下に作成
echo "link dotfiles to your home directory."
# 認証情報や一時ファイルなどはリンクを張らない
for file in .??*; do
	[ "${file}" = ".git" ] && continue;
	printf "\033[1;37m${file}\033[0;39m was linked to ${HOME}\n"
	ln -sf ${PWD}/${file} ${HOME} # リンクを貼る
done

printf "\033[0;32mDotfiles linking finished successfully!\033[0;39m\n"
