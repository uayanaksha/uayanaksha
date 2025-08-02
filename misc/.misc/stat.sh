__ps_prompt() {
    local fg_color="$(tput setaf 110)"
    local fg_color_reset="$(tput sgr0)"
    local date="$(date +%b/%d-%T)"
    local batt_state="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | awk '{ print $2 }')"
    local batt_percent="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percent | awk '{ print $2 }')"

    local rcol_out="$fg_color$date >> $batt_percent [$batt_state]$fg_color_reset"
    local visible_rcol_out="$(echo -e "$rcol_out" | sed 's/\x1B\[[0-9;]*[A-Za-z]//g')"
    local rcol_pos="$(( $(tput cols) - ${#visible_rcol_out} ))"

    printf "\033[%dG" "$rcol_pos"
    printf "%s" "$rcol_out"
    printf "\033[0G"
}
__ps_prompt
