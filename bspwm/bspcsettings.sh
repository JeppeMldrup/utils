#!/bin/sh
bspc desktop -n 1
bspc monitor --add-desktops 2 3 4 5 6 7 8 9
bspc config top_padding 56
bspc config window_gap 15
bspc config gapless_monocle true
bspc config single_monocle true
