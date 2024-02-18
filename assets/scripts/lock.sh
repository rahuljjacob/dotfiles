#/bin/sh

if [ -f "/usr/bin/swayidle" ] ; then
	echo "Swayidle installed"
	swayidle -w timeout 300 'swaylock -f' timeout 360 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
else
	echo "Swayidle not installed"
fi;