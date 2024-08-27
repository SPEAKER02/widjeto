#!/usr/bin/env sh

DIR="$HOME/.config/polybar/pwidgets"

kill_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
}

## Main
if [[ "$1" == "--main" ]]; then
	kill_bar
	#apps (main)
	polybar -q apps-base-1 -c $DIR/main.ini &
	polybar -q apps-base-2 -c $DIR/main.ini &
	polybar -q apps-text-1 -c $DIR/main.ini &
	polybar -q apps-text-2 -c $DIR/main.ini &
	# polybar -q top -c $DIR/main.ini &
	# Workspace
	polybar -q workspace-base-1 -c $DIR/main.ini &
	polybar -q workspace-base-2 -c $DIR/main.ini &
	polybar -q workspace-text-1 -c $DIR/main.ini &
	polybar -q workspace-text-2 -c $DIR/main.ini &
	# System 
	polybar -q system-base-1 -c $DIR/main.ini &
	polybar -q system-base-2 -c $DIR/main.ini &
	#polybar -q secondary -c $DIR/system.ini &
	#mpd
	#polybar -q primary -c $DIR/mpd.ini &
	#polybar -q secondary -c $DIR/mpd.ini &
	# Cpu
	#polybar -q primary -c $DIR/cpu.ini &
	#polybar -q secondary -c $DIR/cpu.ini &
	# Memory	
	#polybar -q primary -c $DIR/memory.ini &
	#polybar -q secondary -c $DIR/memory.ini &
	# Filesystem	
	#polybar -q primary -c $DIR/fs.ini &
	#polybar -q secondary -c $DIR/fs.ini &

## Apps
elif [[ "$1" == "--apps" ]]; then
	kill_bar
	polybar -q primary -c $DIR/apps.ini &
	polybar -q secondary -c $DIR/apps.ini &

## System
elif [[ "$1" == "--system" ]]; then
	kill_bar
	polybar -q primary -c $DIR/system.ini &
	polybar -q secondary -c $DIR/system.ini &

## Mpd
elif [[ "$1" == "--mpd" ]]; then
	kill_bar
	polybar -q primary -c $DIR/mpd.ini &
	polybar -q secondary -c $DIR/mpd.ini &

## Workspaces
elif [[ "$1" == "--ws" ]]; then
	kill_bar
	polybar -q primary -c $DIR/workspace.ini &
	polybar -q secondary -c $DIR/workspace.ini &

## CPU
elif [[ "$1" == "--cpu" ]]; then
	kill_bar
	polybar -q primary -c $DIR/cpu.ini &
	polybar -q secondary -c $DIR/cpu.ini &

## Memory
elif [[ "$1" == "--memory" ]]; then
	kill_bar
	polybar -q primary -c $DIR/memory.ini &
	polybar -q secondary -c $DIR/memory.ini &

## Filesystem
elif [[ "$1" == "--fs" ]]; then
	kill_bar
	polybar -q primary -c $DIR/fs.ini &
	polybar -q secondary -c $DIR/fs.ini &

else
	cat <<- _EOF_
	No widget specified, Available widgets:
	--main    --apps    --system    --mpd
	--ws      --cpu     --memory    --fs
	_EOF_
fi
