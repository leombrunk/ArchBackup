#!/bin/bash

# Check if git is installed
IS_GIT_AVAILABLE="$(git --version)"
if [[ $IS_GIT_AVAILABLE != *"version"* ]]; then
	sudo pacman -S git
fi

# Create folders
mkdir -p .config/{i3,neofetch,polybar}

# Copy dot files
cp $HOME/{.zshrc,.vimrc,.fehbg,.Xresources} .
cp $HOME/.config/i3/config ./.config/i3/
cp $HOME/.config/neofetch/config.conf ./.config/neofetch/
cp $HOME/.config/polybar/{config,polybar.sh} ./.config/polybar

# Check git status
gs="$(git status | grep -i "modified")"

# If there is a change
if [[ $gs == *"modified"* ]]; then
	echo "push"
fi

# Push to Github
git add -A;
git commit -m "New backup `date +'%Y-%m-%d %H:%M:%S'`";
git push origin main;
 
