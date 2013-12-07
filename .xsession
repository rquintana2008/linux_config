#!/bin/bash
xrdb -merge .Xresources
#xpmroot ~/bachground.xpm &
#stalonetray -i 16  --icon-gravity NW --geometry 26x16-0+0 -bg '#000000' --sticky --skip-taskbar &
/usr/local/bin/stalonetray &
/usr/bin/xbindkeys &
exec xmonad
