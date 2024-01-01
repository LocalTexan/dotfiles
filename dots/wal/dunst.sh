#!/bin/sh


pywalfox update
killall waybar


mkdir -p  "${HOME}/.config/dunst"
ln -sf    "${HOME}/.cache/wal/dunstrc"    "${HOME}/.config/dunst/dunstrc"

waybar

pkill dunst 
dunst &
