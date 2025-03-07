#!/bin/sh

if pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes"; then
    mute_sink_status="  Unmute "
else
    mute_sink_status="  Mute "
fi

if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q "yes"; then
    mute_source_status="  Unmute "
else
    mute_source_status="  Mute "
fi

if playerctl status | grep -q "Playing"; then
	player_status="  Pause "
else
	player_status="  Play "
fi
xmenu <<EOF | sh &
   Apps	rofi -show drun 

   Run
	 󰈹  Web Browser   	firefox
	   nvim (nvchad)	alacritty -e nvim
	   Discord	discord
   Terminal		alacritty
   Explore	thunar

   Media
	   Next		playerctl next 
	 $player_status	playerctl play-pause 
	   Prew		playerctl previous
	 $mute_sink_status	pactl set-sink-mute @DEFAULT_SINK@ toggle
	 $mute_source_status	pactl set-source-mute @DEFAULT_SOURCE@ toggle
	   Controll 	pavucontrol

   Powermenu	$HOME/.local/bin/launch_powermenu.sh 
EOF

