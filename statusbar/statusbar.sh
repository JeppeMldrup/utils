#!/bin/sh

Vol(){
        if [ $(amixer | grep -c off) = 2 ]
        then
                echo -n "Vol Off |"
        else
                echo -n "Vol $(amixer | grep -oE -m1 "[0-9]+%") |"
        fi
}

Bat(){
        batstatus=$(cat "/sys/class/power_supply/BAT1/status" | tr -d '\n')
        if [ "$batstatus" = "Charging" ]
        then
                echo -n "^fg(green) $batstatus ^fg()"
        fi
        bat=$(cat /sys/class/power_supply/BAT1/capacity)
        case $bat in
                [0-9])
                        echo -n "^fg(red)[*         ]^fg()"
                        ;;
                1[0-9])
                        echo -n "^fg(red)[**        ]^fg()"
                        ;;
                2[0-9])
                        echo -n "[***       ]"
                        ;;
                3[0-9])
                        echo -n "[****      ]"
                        ;;
                4[0-9])
                        echo -n "[*****     ]"
                        ;;
                5[0-9])
                        echo -n "[******    ]"
                        ;;
                6[0-9])
                        echo -n "[*******   ]"
                        ;;
                7[0-9])
                        echo -n "[********  ]"
                        ;;
                8[0-9])
                        echo -n "[********* ]"
                        ;;
                9[0-9])
                        echo -n "[**********]"
                        ;;
                100)
                        echo -n "[**********]"
                        ;;
        esac
        echo -n " $bat% |"
}

Wifi(){
        ssid=$(iw dev wlan0 info | grep ssid | awk '{print $2}')
        if [ -z $ssid ]
        then
                echo -n "^fg(red) No wifi ^fg()|"
        else
                echo -n "^fg(green) Connected: $ssid ^fg()|"
        fi
}

get_status() {
        while true; do
                Vol
                Bat
                Wifi
                date +" %a %d. %b %l:%M %Z %Y " | sed 's/Wed/Lunsdag/'
                sleep 1m
        done
}

get_desktops(){
        while :; do
                /home/jeppe/scripts/desktops.sh
                sleep 1m
        done
}

width=866
offset=500

fgcolor="#aaaaaa"
bgcolor="#111111"
font="Monospace"

parameters="-h 24 -fn $font"
parameters+=" -bg $bgcolor -fg $fgcolor -p"
parameters+=" -title-name dzentop"

get_status | dzen2 -ta r -tw $width -x $offset $parameters &
get_desktops | dzen2 -ta l -tw $offset $parameters &
