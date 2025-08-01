<div align="center" style="font-family: monospace">
    <pre>
                     .__          .___      __    _____.__.__                 
_____ _______   ____ |  |__     __| _/_____/  |__/ ____\__|  |   ____   ______
\__  \\_  __ \_/ ___\|  |  \   / __ |/  _ \   __\   __\|  |  | _/ __ \ /  ___/
 / __ \|  | \/\  \___|   Y  \ / /_/ (  <_> )  |  |  |  |  |  |_\  ___/ \___ \ 
(____  /__|    \___  >___|  / \____ |\____/|__|  |__|  |__|____/\___  >____  >
     \/            \/     \/       \/                               \/     \/ 
 </pre>
</div>
     
<br>

<div align="center">
    <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/Feeeeddmmmeee/dotfiles?style=for-the-badge&logo=apachespark&logoColor=%23c3c3c3&labelColor=%230f0f10&color=%23993364">
    <img alt="GitHub commit activity" src="https://img.shields.io/github/commit-activity/m/Feeeeddmmmeee/dotfiles?style=for-the-badge&logo=github&logoColor=%23c3c3c3&labelColor=%230f0f10&color=%23993364">
    <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/Feeeeddmmmeee/dotfiles?style=for-the-badge&logo=archlinux&logoColor=%23c3c3c3&labelColor=%230f0f10&color=%23993364">
</div>

<br>

<h1 align="center">
    <a href="#desktop_computer-screenshots">Screenshots</a> ･
    <a href="#inbox_tray-installation">Installation</a> ･
    <a href="#%EF%B8%8F-keybinds">Keybinds</a>
</h1>

<img alt="screenshot" src="https://github.com/user-attachments/assets/b1a7c293-77d5-4723-8896-86446747a0bb" align="right" width="400px">


Thanks for dropping by! This is my personal Arch Linux configuration repository.

The installation process can be automated with the install script. Nothing but a working internet connection and arch installation is required.

Here is more information about my setup:

- **Distribution:** [arch](https://archlinux.org/)
- **Window Manager:** [hyprland](https://github.com/hyprwm/Hyprland)
- **Terminal:** [kitty](https://github.com/kovidgoyal/kitty)
- **Shell:** [zsh](https://www.zsh.org/)
- **Bar:** [waybar](https://github.com/Alexays/Waybar)
- **Color schemes:** [pywal16](https://github.com/eylles/pywal16)
- **Editor:** [neovim](https://github.com/neovim/neovim)
- **Browser:** [firefox](https://www.mozilla.org/en-US/firefox)
- **Wallpaper Daemon:** [swww](https://github.com/LGFae/swww)
    
## :desktop_computer: Screenshots
Coming soon :3

## :inbox_tray: Installation
Just clone the repo and use the install script :3
```bash
git clone https://github.com/Feeeeddmmmeee/dotfiles
cd dotfiles
./install
```
> [!NOTE]
> This config uses GNU stow for easier git management, which means some of your folders in .config will become symlinks pointing to this repository's location on your machine.

## ⌨️ Keybinds
### 🖱️ Windows + WM
| Keybind    | Action    |
|------------|-----------|
| <kbd>SUPER + [1-9]</kbd> | Switch workspace |
| <kbd>SUPER + SHIFT + [1-9]</kbd> | Move active window to workspace |
| <kbd>SUPER + ARROWS</kbd> | Move to next/previous workspace |
| <kbd>SUPER + [H, J, K, L]</kbd> | Switch window focus |
| <kbd>SUPER + SHIFT + [H, J, K, L]</kbd> | Move window within workspace |
| <kbd>SUPER + Q</kbd> | Kill window |
| <kbd>SUPER + SHIFT + Q</kbd> | Quit Hyprland |
| <kbd>SUPER + F</kbd> | Fullscreen |
| <kbd>SUPER + V</kbd> | Toggle floating/tiling for active window |
| <kbd>SUPER + SHIFT + ENTER</kbd> | Swap active window with master |

### 🛠️ Applications + Scripts
| Keybind    | Action    |
|------------|-----------|
| <kbd>SUPER + ENTER</kbd> | Open terminal (Kitty) |
| <kbd>SUPER + B</kbd> | Open browser (Firefox) |
| <kbd>SUPER + SHIFT + S</kbd> | Screenshot a selected area |
| <kbd>SUPER + SHIFT + F</kbd> | Screenshot the entire screen |
| <kbd>SUPER + W</kbd> | Select a random wallpaper |
| <kbd>SUPER + D</kbd> | Open Discord |
| <kbd>SUPER + M</kbd> | Open Spotify |
| <kbd>SUPER + S</kbd> | Open Steam |
| <kbd>SUPER + O</kbd> | Open OBS |

<br>

> [!NOTE]
> By default screenshots are saved to `~/Pictures/screenshots/` and copied to your clipboard.

## :hammer: TODO
- [x] fonts
- [x] razer pywal
- [x] simple bar
- [x] nvim config refresh
- [ ] bar with more features (possbily eww)
- [ ] more things in the install script (locale, time etc.)
- [ ] fingerprint auth
- [ ] app launcher
- [ ] nvidia-open, nvidia-utils
- [ ] ~~pc case pywal~~ unlikely to work ://

## :exclamation: Known Issues
- Every once in a while after changing my keyboard's backlight settings it turns off and stops responding for a few seconds.

<br>

<p align="center">
    <img src="https://github.com/catppuccin/catppuccin/blob/main/assets/footers/gray0_ctp_on_line.png?raw=true"
</p>
