#!/bin/bash
WINDOW=$(hyprctl clients | grep "class: " | awk '{gsub("class: ", "");print}' |  tofi --fuzzy-match true)
if [ "$WINDOW" = "" ]; then
    exit
fi
echo "runing"
echo "$WINDOW"

notify-send "$WINDOW"
hyprctl dispatch focuswindow $WINDOW
echo "sending"


