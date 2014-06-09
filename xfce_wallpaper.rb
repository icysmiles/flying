#!/usr/bin/env ruby
#encoding=UTF-8

require 'fileutils'

path = "/home/icysmiles/图片/桌面/"
img_name = path << Time.new.strftime("%Y%m%d") << ".jpg"

puts img_name

FileUtils.touch("/home/icysmiles/.config/xfce4/desktop/backdrop.list")
fh = File.new("/home/icysmiles/.config/xfce4/desktop/backdrop.list","w")
fh.puts "# xfce backdrop list\n#{img_name}"
fh.close

system("DISPLAY=:0.0")
system("xfconf-query -c xfce4-desktop -p \"/backdrop/screen0/monitor${1:-0}/image-path\"  -s \"#{img_name}\"")
system("xfdesktop --reload")
#!/bin/bash
wallpaperdir = '$HOME/图片/桌面'

#files = ($wallpaperdir/*)
#randompic = 'printf "%s\n" "${files[RANDOM % ${#FILES[@]}]}"'
file = "$HOME/图片/桌面/20140527.jpg"

echo -e '# xfce backdrop list\n$file' >$HOME/.config/xfce4/desktop/backdrops.list    
killall -icysmiles xfdesktop
