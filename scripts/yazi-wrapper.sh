#!/usr/bin/env sh
set -e

multiple="$1"
directory="$2"
save="$3"
path="$4"
out="$5"

if [ "$directory" = "1" ]; then
    set -- --chooser-file="$out" --cwd-file="$out" "$path"
else
    set -- --chooser-file="$out" "$path"
fi

kitty --class=file_chooser -e yazi "$@"
