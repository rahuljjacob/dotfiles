#/bin/sh

if [ -f "/usr/bin/swayidle" ] ; then
	echo "Swayidle installed"
	swayidle -w timeout 300 'hyprlock ' timeout 360 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' timeout 600 'systemctl suspend'
else
	echo "Swayidle not installed"
fi;