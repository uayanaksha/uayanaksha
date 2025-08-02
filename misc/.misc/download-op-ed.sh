#!/bin/env bash

set x
while read d ; do
    x="$(echo $d | cut -d'|' -f 1 | xargs)";
    yt-dlp \
        -S "ext,res:1440,proto" \
        --paths "$XDG_VIDEOS_DIR/op-ed/"
        -o "$x.%(ext)s" \
        "$(echo $d | cut -d'|' -f 2 | xargs)"; \
    done < ./op-ed.txt
unset x
