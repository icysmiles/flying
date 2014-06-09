#!/bin/bash
wallpaperdir = '$HOME/图片/桌面'

#files = ($wallpaperdir/*)
#randompic = 'printf "%s\n" "${files[RANDOM % ${#FILES[@]}]}"'
file = "$HOME/图片/桌面/20140527.jpg"

echo -e '# xfce backdrop list\n$file' >$HOME/.config/xfce4/desktop/backdrops.list    
killall -icysmiles xfdesktop
