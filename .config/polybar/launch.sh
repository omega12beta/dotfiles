#!/usr/bin/zsh
#make sure its dead

killall -q polybar

sleep 5; polybar prime &
