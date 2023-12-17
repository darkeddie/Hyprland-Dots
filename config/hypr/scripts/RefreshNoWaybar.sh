#!/usr/bin/env bash

# Modified version of Refresh but no waybar refresh
# Used by automatic wallpaper change
# Modified inorder to refresh rofi background, Pywal

SCRIPTSDIR=$HOME/.config/hypr/scripts

# Kill already running processes
_ps=(rofi)
for _prs in "${_ps[@]}"; do
    if pidof "${_prs}" >/dev/null; then
        pkill "${_prs}"
    fi
done

sleep 0.1
# Relaunch dunst with pywal-borders
${SCRIPTSDIR}/PywalDunst.sh &

# Pywal refresh
${SCRIPTSDIR}/PywalSwww.sh &

# Relaunching rainbow borders
sleep 1
${SCRIPTSDIR}/RainbowBorders.sh &

# for cava-pywal (note, need to manually restart cava once wallpaper changes)
ln -sf "$HOME/.cache/wal/cava-colors" "$HOME/.config/cava/config" || true