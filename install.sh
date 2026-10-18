#!/bin//bash

YAVAOS_HYPR=$(pwd)

# Make symbolic links to config dirs
CONFIG_DIRS="alacritty kitty autostart bash yavaos btop chromium chromium-flags.conf brave-flags.conf elephant walker fcitx5 fontconfig hypr uwsm"

for i in $CONFIG_DIRS; do
  ln -sf "$YAVAOS_HYPR/.config/$i" "$HOME/.config"
done
