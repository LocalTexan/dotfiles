#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

current="$(swww query | grep -o -m 1 -P '(?<=image: ).*')"
files=($(find /home/localtexan/Wallpapers/ -type f))
files=(${files[@]/$current})

if [ ${#files[@]} -ge 1 ]; then
  random="${files[RANDOM % ${#files[@]}]}"

  swww img "${random}" --transition-type center --transition-duration 0.7 --transition-fps 120

  wal -i "${random}" -o /home/localtexan/.config/wal/dunst.sh
fi

killall -SIGUSR2 waybar
