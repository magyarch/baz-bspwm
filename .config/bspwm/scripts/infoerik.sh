#!/bin/bash


OS=$(cat /etc/lsb-release | awk -F '=' '/DISTRIB_ID/ {print $2}')
KERNEL=$(uname -r)
ARCH=$(uname -m)
VERSION=$(cat /etc/lsb-release | awk -F '=' '/DISTRIB_RELEASE/ {print $2}')
UPTIME=$(awk '{printf("%d:%02d:%02d:%02d",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}' /proc/uptime)
MODEL=$(cat /sys/devices/virtual/dmi/id/board_{name,vendor} | awk '!(NR%2){print$1,p}{p=$0}')
DE=$(wmctrl -m | awk 'NR==1 {print $2}' | perl -nle 'print ucfirst lc')
CPU=$(awk < /proc/cpuinfo '/model name/{gsub(/[(TMR)]/,"");print $4,$5,$6}' | head -1)
SHELL=$(echo "$SHELL" | awk -F/ '{for ( i=1; i <= NF; i++) sub(".", substr(toupper($i),1,1) , $i); print $NF}')
RESOLUTION=$(xdpyinfo | awk '/dimensions:/ {printf $2}')
BIRTH=$(ls -alct /|sed '$!d'|awk '{print $7, $6, $8}')


GtkTheme=$(awk < ~/.config/gtk-2.0/gtkrc-2.0 -F'"' '/gtk-theme-name/{print $2}')
GtkIcon=$(awk < ~/.config/gtk-2.0/gtkrc-2.0 -F'"' '/gtk-icon-theme-name/{print $2}' )
#GtkFont=$(awk < ~/.gtkrc-2.0 -F'"' '/gtk-font-name/{print $2}')


Packages=$(checkupdates | wc -l)
Layout=$(setxkbmap -print | awk -F"+" '/xkb_symbols/{for ( i=1; i <= NF; i++) sub(".", substr(toupper($i),1,1) , $i); print $2}')



 echo -e "   $USER"
 #echo -e "   $MODEL"
 echo -e "   $OS $ARCH $VERSION"
 echo -e "   $DE"
 echo -e "   $KERNEL"
 echo -en "   $Packages"
 #echo -en "  "
 echo -e "   $UPTIME"
 echo -e "   $SHELL"
 echo -e "   $RESOLUTION"
 echo -e "   $CPU"
 echo -en "  $GPU"
 # echo -en "   $GtkTheme"
 #echo -e "   $GtkIcon"
 #echo -e "   $GtkFont"
 #echo -en "   $BIRTH"
 echo -e "   $Layout"
# echo -en "   $USER"

