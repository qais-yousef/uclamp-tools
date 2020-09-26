#!/bin/sh
set -eux

path="`realpath $(dirname "$0")`"

sudo ln -sf "$path/uclampreset" /usr/local/bin/uclampreset
sudo ln -sf "$path/uclampreset" /usr/local/bin/uclampreset-rt
sudo ln -sf "$path/uclampcheck" /usr/local/bin/uclampcheck

if [ -d "/etc/pm/sleep.d/" ]; then
	sudo ln -sf "$path/uclamp.pm-suspend" /etc/pm/sleep.d/99_uclamp
fi

if [ -d "/lib/systemd/system-sleep/" ]; then
	sudo ln -sf "$path/uclamp.system-sleep" /lib/systemd/system-sleep/uclamp
fi
