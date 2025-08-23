# Arch Linux System configuration

## Setup config symlinks

```bash
git clone gl:uayanaksha/sys ~/sys
cd ~/sys 
stow -R */
```

## Update & Iterations

Forward increments will be added soon.
 - Main SwayWM 
 - Alt Niri/WM conf is being cooked.

## Packages install: core/extra

  - install core/extra packages: `cat ~/.misc/paru-Qqm | xargs paru -S --noconfirm`
  - install AUR packages: `cat ~/.misc/paru-Qq  | xargs paru -S --noconfirm`

## Python setup

  - setup global version: `pyenv global 3.13.4`
  - setup local version: `pyenv local 3.13.4`
  - upgrade pip packages: `pip freeze | cut -d= -f1 | xargs pip install --upgrade`

## Systemd daemon setup 

  - Startup custom systemd services inside `~/.config/systemd/user/` directory. Enable all these files using `systemctl --user daemon-reload && systemctl --user enable <my_service.service>`

## Using Tar

  - create tar zip file - `tar -cvzf my_project.tar.gz my_project`
  - unzip tar - `tar -xzvf <zip name>.tar.gz`

## Setup GTK/gnome theme settings

  - set theme (manual):
    ```
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-Dark"
    gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-Dark"
    gsettings set org.gnome.desktop.wm.preferences theme "WhiteSur-Dark"
    ```
  - Edit `$HOME/.config/gtk-4.0/settings.ini` :
    ``` 
    [Settings]
    gtk-application-prefer-dark-theme=1
    ```
  - Setup wm theme (auto-script): `gh repo clone vinceliuice/WhiteSur-gtk-theme` 
  - Setup icon theme (auto-script): `gh repo clone vinceliuice/WhiteSur-icon-theme` 

## Download Easy Effect Presents

  - Easy effects profiles (auto-script): `bash -c "$(curl -fsSL https://raw.githubusercontent.com/JackHack96/PulseEffects-Presets/master/install.sh)"`

## Enable ssh-agent 

  - Enable `systemctl enable --user ssh-agent.socket` to avoid `eval $(ssh-agent -s)` BS.

## Git quarks

  - It's designed for situations where you need to make local changes to a tracked file that you never intend to commit.
    `git update-index --skip-worktree <your-file>`
  - To revert this and start tracking changes again, use:
    `git update-index --no-skip-worktree <your-file>`
