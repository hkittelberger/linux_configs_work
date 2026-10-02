# ~/.config/i3/lock.sh
#!/bin/bash
i3lock \
  -i ~/Pictures/wallpapers/alljojos.jpg \
  --indicator \
  --clock \
  --time-str="%H:%M" \
  --date-str="%A, %B %d" \
  --inside-color=eae9e7 \
  --ring-color=007b9d \
  --line-color=ffffff00 \
  --separator-color=222222ff \
  --wrong-color=ff0000ff \
  --time-color=130b0c \
  --date-color=130b0c \
  --keyhl-color=00ff00ff \
  --bshl-color=ff0000ff \
  --radius=120 \
  --ring-width=8
