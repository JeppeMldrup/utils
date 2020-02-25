#!/bin/sh
#sudo kill $(ps -aux | grep "[s]tatusbar.sh" | awk '{print $2}')
#sudo kill $(ps -aux | grep "[d]zen2" | awk '{print $2}')
#/home/jeppe/scripts/statusbar.sh &
kill $(ps -aux | grep "[s]leep 1m" | awk '{print $2}')
