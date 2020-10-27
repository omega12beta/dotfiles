#!/bin/sh
#~/.xinitrc
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
# merge in defaults and keymaps
if [ -f $sysresources ]; then     xrdb -merge $sysresources; fi
if [ -f $sysmodmap ]; then     xmodmap $sysmodmap; fi
if [ -f "$userresources" ]; then     xrdb -merge "$userresources"; fi
if [ -f "$usermodmap" ]; then     xmodmap "$usermodmap"; fi
# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then     for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f";     done;     unset f; fi
# start i3 and keep it running
if [ -f /usr/bin/i3 ]; then     exec i3; fi
la
ls
ls -a
bat .zinit
ls .zinit
ls .zinit/.zinit
cd .dotfiles
ls -a
cd .zsh
ls -a
ls -a zinit
git clone https://github.com/zdharma/zinit.git ~/.dotfiles/.zsh/zinit/bin
ls
cd zinit
ls
ls -a
