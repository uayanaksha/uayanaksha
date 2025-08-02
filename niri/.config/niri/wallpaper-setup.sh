find ~/pic/wall/ -type f | fuzzel -d -p wallpaper | \
    xargs -I{} /usr/bin/swww img \
        --transition-type grow \
        --transition-pos bottom \
        --transition-fps 90 \
        --transition-duration 1 {}

