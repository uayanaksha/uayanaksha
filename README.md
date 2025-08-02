# Arch Linux System configuration

## Update & Iterations

Forward increments will be added soon.
Niri/WM conf is being cooked.

## Inside the box

  - Primary WM : Sway WM
  - Deps. : Waybar, Swaylock, rofi, foot
  - Extras : Tmux, vim, mpv, mpd

All other files related to the setup are to be found inside the `utils` directory.

## Misc

  - list/store external/AUR packages - `pacman -Qqe > ./utils/pkgs-paru.txt`
  - list/store installed pip packages - `pip freeze | cut -d "=" -f 1 > requirement.txt`
  - Startup custom systemd services inside `~/.config/systemd/user/` directory. Enable all these files using `systemctl --user daemon-reload && systemctl --user enable <my_service.service>`
  - create tar zip file - `tar -cvzf my_project.tar.gz my_project`
  - unzip tar - `tar -xzvf <zip name>.tar.gz`
  - set theme (manual):
    ```
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-Dark"
    gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-Dark"
    gsettings set org.gnome.desktop.wm.preferences theme "WhiteSur-Dark"
    ```
  - Edit `/home/ayanaksha/.config/gtk-4.0/settings.ini` :
    ``` 
    [Settings]
    gtk-application-prefer-dark-theme=1
    ```
  - Setup wm theme (auto-script): `gh repo clone vinceliuice/WhiteSur-gtk-theme` 
  - Setup icon theme (auto-script): `gh repo clone vinceliuice/WhiteSur-icon-theme` 
  - Easy effects profiles (auto-script): `bash -c "$(curl -fsSL https://raw.githubusercontent.com/JackHack96/PulseEffects-Presets/master/install.sh)"`
  - Enable `systemctl enable --user ssh-agent.socket` to avoid `eval $(ssh-agent -s)` BS.

## Git quarks

  - It's designed for situations where you need to make local changes to a tracked file that you never intend to commit.
    `git update-index --skip-worktree <your-file>`
    To revert this and start tracking changes again, use:
    `git update-index --no-skip-worktree <your-file>`
