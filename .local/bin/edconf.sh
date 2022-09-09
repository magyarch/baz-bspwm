#!/bin/bash



# Dmenu script for editing some of my more frequently edited config files.


declare options=("alias
bash
bspwm
profile
vifm
polybar
sxhkd
xprofile
quit")

choice=$(echo -e "${options[@]}" | dmenu -i -c -g 1 -l 20 -nb '#1a1a1a' -sb '#9872bf' -fn 'JetBrains Mono Nerd Font:size=14' -p 'Edit a config file: ')

case "$choice" in
	quit)
		echo "Program terminated." && exit 1
	;;
	alias)
		choice="$HOME/.config/aliasrc"
	;;
	bash)
		choice="$HOME/.bashrc"
	;;
	bspwm)
		choice="$HOME/.config/bspwm/bspwmrc"
	;;
	profile)
		choice="$HOME/.profile"
	;;
	vifm)
		choice="$HOME/.config/vifm/vifmrc"
	;;
	polybar)
		choice="$HOME/.config/polybar/config.ini"
	;;
	sxhkd)
		choice="$HOME/.config/sxhkd/sxhkdrc"
	;;
	xprofile)
		choice="$HOME/.xprofile"
	;;
	*)
		exit 1
	;;
esac
subl -c "$choice"
