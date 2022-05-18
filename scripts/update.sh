#!/bin/sh
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

cd ${HOME}

# dotfilesディレクトリの中身のリンクをホームディレクトリ直下に作成
echo "start linking ..."
# 認証情報や一時ファイルなどはリンクを張らない
for file in .??*; do
	for itm in ${ignore_list[@]}; do
		if [ "${file}" != "${itm}" ]; then #除外ファイルとdotfiles内のファイルが一致しなければ
			continue # なにもしない
		else
			is_omitted=1 # 一致したとき
			break # フラグを立てる
		fi
	done
	if [ ${is_omitted} -eq 1 ] ; then # フラグが立っていれば
		echo ${file} is omitted. # リンク省略
		is_omitted=0
	else # フラグが立っていなければ
		echo ${file} linked to ${HOME}
		ln -sf ${PWD}/${file} ${HOME} # リンクを貼る
	fi
done

echo "link finished."
