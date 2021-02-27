#!/bin/sh
PASS_ENCRYPT=~/.passwords/pass.gpg
PASS_DECRYPT=/tmp/pass

if ! test -f $PASS_DECRYPT
then
    gpg --no-symkey-cache --decrypt $PASS_ENCRYPT > $PASS_DECRYPT
fi

CHOICE=$(awk '{print $1}' < $PASS_DECRYPT | dmenu -l 10)
PASS=$(grep "$CHOICE" < $PASS_DECRYPT | awk '{print $2}')

xdotool key type $PASS
