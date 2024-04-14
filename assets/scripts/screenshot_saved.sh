#/bin/sh
grim -g "$(slurp)" $HOME/Pictures/Screenshots/$(date +'%s_grim.png')
notify-send "  Screenshot Saved"
