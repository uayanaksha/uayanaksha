#!/bin/sh

find ~/av/{op-ed,music-mix} ~/a -type f | \
    fuzzel -d -p VDO -i  | \
    xargs -I{} mpv --profile=fast {}
