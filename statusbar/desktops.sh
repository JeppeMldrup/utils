#!/bin/sh

state=$(bspc wm --get-status)
occupied=$(echo $state | grep -o "[oOF][0-9]") #Replace [oOF] with [oOfF] to always display all desktops
layout=$(echo $state | grep -o "L[TM]")
focused=$(xdotool getwindowfocus getwindowname)

for n in $occupied; do
        if [ $(echo "$n" | grep -Ec "[OF][0-9]") == 1 ]; then
                echo -n "^bg(#00baba)^fg(#111111)  ${n:1:2}  ^fg()^bg()"
        else
                echo -n "^ca(1, bspc desktop -f ${n:1:2}; /home/jeppe/scripts/resetbar.sh)  ${n:1:2}  ^ca()"
        fi
done

echo " ${layout:1:2}^p(50)^bg(#00baba)^fg(#111111)  $focused  ^fg()^bg()"
