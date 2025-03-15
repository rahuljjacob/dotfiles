#!/bin/bash

if [[ "$(playerctl -p spotify status)" = "Playing"  ]]; then
    hyprlock --config ~/.config/session-lock/configs/hyprlock-music.conf

else
    hyprlock --config ~/.config/session-lock/configs/hyprlock-no-music.conf
fi 
