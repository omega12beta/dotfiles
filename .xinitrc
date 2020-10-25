#!/bin/sh
#~/.xinitrc

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        # shellcheck source=/dev/null
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# start i3 and keep it running
if [ -f /usr/bin/i3 ]; then
    exec i3
fi


#DEFAULT_SESSION='i3 --shmlog-size 0'
#
#case $1 in
#  awesome       ) exec dbus-launch awesome ;;
#  bspwm         ) exec dbus-launch bspwm-session ;;
#  budgie        ) exec dbus-launch budgie-desktop ;;
#  cinnamon      ) exec dbus-launch cinnamon-session ;;
#  deepin        ) exec dbus-launch startdde ;;
#  enlightenment ) exec dbus-launch enlightenment_start ;;
#  fluxbox       ) exec dbus-launch startfluxbox ;;
#  gnome         ) exec dbus-launch gnome-session ;;
#  i3|i3wm       ) exec dbus-launch i3 --shmlog-size 0 ;;
#  jwm           ) exec dbus-launch jwm ;;
#  kde           ) exec dbus-launch startkde ;;
#  lxde          ) exec dbus-launch startlxde ;;
#  lxqt          ) exec dbus-launch lxqt-session ;;
#  mate          ) exec dbus-launch mate-session ;;
#  xfce          ) exec dbus-launch xfce4-session ;;
#
#  *             ) exec dbus-launch $DEFAULT_SESSION ;;
#esac
