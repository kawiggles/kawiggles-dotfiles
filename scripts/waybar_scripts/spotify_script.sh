#!/bin/bash
if playerctl -p spotify status 2> /dev/null | grep -q "Playing\|Paused"; then
    artist=$(playerctl -p spotify metadata artist)
    title=$(playerctl -p spotify metadata title)
    echo "{\"text\": \"$artist - $title\", \"class\": \"playing\"}"
else
    echo "{\"text\": \"Spotify\", \"class\": \"paused\"}"
fi

