#!/bin/bash

# Check if git is installed
IS_GIT_AVAILABLE="$(git --version)"
if [[ $IS_GIT_AVAILABLE != *"version"* ]]; then
	sudo pacman -S git
fi

cd "$(dirname "$0")"

# Create folders
mkdir -p .config/{bottom,dunst,i3,kitty,neofetch,polybar,rofi}
mkdir -p .yt-dlp
mkdir -p .screenlayout
mkdir -p Documents
mkdir -p Pictures/Wallpaper

cp $HOME/Pictures/Wallpaper/Wallpaper.jpg ./Pictures/Wallpaper/

# Copy dot files
cp $HOME/{.bashrc,.fehbg,.vimrc,.xinitrc} .

cp -r $HOME/.screenlayout/. ./.screenlayout/
cp $HOME/.yt-dlp/config ./.yt-dlp/

cp $HOME/.config/redshift.conf ./.config/

cp $HOME/.config/bottom/bottom.toml ./.config/bottom/
cp $HOME/.config/dunst/dunstrc ./.config/dunst/
cp -r $HOME/.config/i3/. ./.config/i3/
cp $HOME/.config/kitty/kitty.conf ./.config/kitty/
cp $HOME/.config/neofetch/config.conf ./.config/neofetch/
cp $HOME/.config/polybar/{config.ini,launch.sh} ./.config/polybar/
cp $HOME/.config/rofi/config.rasi ./.config/rofi/

cp $HOME/Documents/LinuxReminders.txt ./Documents/

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
 
