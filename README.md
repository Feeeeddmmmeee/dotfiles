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
| `SUPER + [1-9]` | Switch workspace |
| `SUPER + SHIFT + [1-9]` | Move active window to workspace |
| `SUPER + ARROWS` | Move to next/previous workspace |
| `SUPER + [H, J, K, L]` | Switch window focus |
| `SUPER + SHIFT + [H, J, K, L]` | Move window within workspace |
| `SUPER + Q` | Kill window |
| `SUPER + SHIFT + Q` | Quit Hyprland |
| `SUPER + F` | Fullscreen |
| `SUPER + V` | Toggle floating/tiling for active window |
| `SUPER + SHIFT + ENTER` | Swap active window with master |

### 🛠️ Applications + Scripts
| Keybind    | Action    |
|------------|-----------|
| `SUPER + ENTER` | Open terminal (Kitty) |
| `SUPER + B` | Open browser (Firefox) |
| `SUPER + SHIFT + S` | Screenshot a selected area |
| `SUPER + SHIFT + F` | Screenshot the entire screen |
| `SUPER + W` | Select a random wallpaper |
| `SUPER + D` | Open Discord |
| `SUPER + M` | Open Spotify |
| `SUPER + S` | Open Steam |

## :hammer: TODO
- [x] fonts
- [x] razer pywal
- [x] simple bar
- [x] nvim config refresh
- [ ] app launcher
- [ ] nvidia-open, nvidia-utils
- [ ] ~~pc case pywal~~ unlikely to work ://

<br>

<p align="center">
    <img src="https://github.com/catppuccin/catppuccin/blob/main/assets/footers/gray0_ctp_on_line.png?raw=true"
</p>
