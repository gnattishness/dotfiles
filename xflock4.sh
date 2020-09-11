#!/bin/sh
# /usr/local/bin/xflock4
# enabling screenlock by xfce4-power-manger for manjaro-i3 (without xfce4-session)

if [ -f "/usr/bin/xflock4" ]; then
  /usr/bin/xflock4
elif command -v locker &> /dev/null; then
  locker
else
  blurlock
fi
