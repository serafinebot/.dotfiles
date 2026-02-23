#!/bin/bash
# oh-my-zsh installation might replace our .zshrc symlink
# delete it to avoid stow conflicts
rm -rf ~/.zshrc

exclude=("resources")

for dir in */ ; do
	name=`echo $dir | sed 's/\///g'`
	if [[ ! " ${exclude[*]} " =~ " ${name} " ]]; then
		echo "installing: $name"
		stow -D "${dir}"
		stow "${dir}"
	fi
done
