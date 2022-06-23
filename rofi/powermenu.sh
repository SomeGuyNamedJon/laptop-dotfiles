#!/bin/env bash

# Options for powermenu
lock=""
logout=""
shutdown=""
reboot=""
sleep="望"

# Get answer from user via rofi
selected_option=$(echo "$lock
$logout
$sleep
$reboot
$shutdown" | rofi -dmenu\
                  -config "~/.config/rofi/powermenu.rasi")

# Do something based on selected option
if [ "$selected_option" == "$lock" ]
then
    dm-tool lock
    #/home/$USER/.config/bspwm/scripts/i3lock-fancy/i3lock-fancy.sh
elif [ "$selected_option" == "$logout" ]
then
    bspc quit
elif [ "$selected_option" == "$shutdown" ]
then
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
    amixer set Master mute
    systemctl suspend
else
    echo "No match"
fi
