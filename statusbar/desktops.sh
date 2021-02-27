#!/bin/sh

state=$(bspc wm --get-status)
occupied=$(echo $state | grep -o "[oOF][0-9]") #Replace [oOF] with [oOfF] to always display all desktops
layout=$(echo $state | grep -o "L[TM]" | head -n 1)
focused=$(xdotool getwindowfocus getwindowname)

bgcol=$(xrdb -query | grep background | grep -o '#[a-f0-9]*')
fgcol=$(xrdb -query | grep foreground | grep -o '#[a-f0-9]*')
cyan=$(xrdb -query | grep color6 | grep -o '#[a-f0-9]*')


echo -n "^bg($bgcol)^fg($fgcol)"
for n in $occupied; do
        if [ $(echo "$n" | grep -Ec "[OF][0-9]") == 1 ]; then
            echo -n "^bg($cyan)^fg($bgcol)    ${n:1:2}    ^fg($fgcol)^bg($bgcol)"
        else
            echo -n "^ca(1, bspc desktop -f ${n:1:2}; /home/jeppe/github/utils/statusbar/resetbar.sh)    ${n:1:2}    ^ca()"
        fi
done

echo "    ${layout:1:2}^p(50)^bg($cyan)^fg($bgcol)    $focused    ^fg($fgcol)^bg($bgcol)"
