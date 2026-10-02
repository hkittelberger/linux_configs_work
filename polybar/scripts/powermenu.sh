#!/bin/bash

chosen=$(echo -e " Power Off\n Restart\n Lock\n Sleep" | rofi -dmenu -p "Power Menu")

case "$chosen" in
  *Power\ Off) systemctl poweroff ;;
  *Restart) systemctl reboot ;;
  *Lock) ~/.config/i3/lock.sh ;;
  *Sleep) systemctl suspend ;;
esac
