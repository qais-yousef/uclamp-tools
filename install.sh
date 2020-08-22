#!/bin/sh
set -eux

path="`realpath $(dirname "$0")`"

sudo ln -s "$path/uclampreset" /usr/local/bin/uclampreset
sudo ln -s "$path/uclampcheck" /usr/local/bin/uclampcheck

if [ -d "/etc/pm/sleep.d/" ]; then
	sudo ln -s "$path/uclamp.pm-suspend" /etc/pm/sleep.d/99_uclamp
fi

if [ -d "/lib/systemd/system-sleep/" ]; then
	sudo ln -s "$path/uclamp.system-sleep" /lib/systemd/system-sleep/uclamp
fi
