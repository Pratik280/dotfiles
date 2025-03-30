# Setting up my Open(sus)e Tumbleweed System (KDE plasma)

## Initial tweaks

### Enable customization using KDE widget customization saver.

### Disable baloo and other background services.
```
balooctl disable && balooctl purge
```

Other services to turn off:
- Autostart background services -> turn off: Night color location, Kscreen, Search folder updater, bluetooth.

## Installing necessary [flatpak](https://flatpak.org/setup/Fedora) apps
```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

```
flatpak install flathub com.brave.Browser com.discordapp.Discord \
com.google.Chrome com.spotify.Client \
org.mozilla.firefox org.qbittorrent.qBittorrent \
org.telegram.desktop io.mpv.Mpv com.github.iwalton3.jellyfin-media-player \
com.valvesoftware.Steam com.heroicgameslauncher.hgl io.github.seadve.Kooha \
com.obsproject.Studio 
```

```
sudo zypper install --no-recommends opi kitty git starship
sudo zypper install docker docker-compose docker-compose-switch
sudo zypper install --no-recommends hyprland wofi hyprpaper hyprlock hyprland-devel
```

## Setting up [Docker](https://docs.docker.com/engine/install/fedora/)

Install docker from YAST

## Setting up [Distrobox](https://github.com/89luca89/distrobox) 
```
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --prefix ~/.local
```

```
distrobox-create -i docker.io/library/ubuntu:22.04 -n ubuntu
```

```
distrobox-create --absolutely-disable-root-password-i-am-really-positively-sure -i docker.io/library/archlinux:latest -n arch
```

Install necessary packages in arch distrobox
```
distrobox enter arch
```

Install yay-bin
```
sudo pacman -S --needed git base-devel
```
```
git clone https://aur.archlinux.org/yay-bin.git
```
```
makepkg -si
```

```
yay -S neofetch neovim jdk21-openjdk code kitty starship
distrobox-export --app code
distrobox-export --app kitty
distrobox-export --bin /usr/sbin/neofetch --export-path ~/.local/bin/
distrobox-export --bin /usr/sbin/nvim ~/.local/bin/
distrobox-export --bin /usr/sbin/starship ~/.local/bin/
```

```
pip install pillow
```

From inside distrobox [Use docker from within distrobox](https://github.com/89luca89/distrobox/blob/main/docs/useful_tips.md#using-podman-or-docker-inside-a-distrobox)
```
sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/docker
```

#### Yay cheatsheet
```
yay -Syu                 : updates entire system and AUR packages
yay <package_name>       : Searches package in pacman repos and AUR repos
yay -S <package_name>    : Installs a package

yay -Rns <package_name>  : Deletes package completely
yay -c                   : Removes unused dependencies
yay -Sc                  : Removes pacman and AUR cache
```

**Useful guides**
- [Archwiki Java OpenJDK](https://wiki.archlinux.org/title/java)
- [Yay guide youtube](https://youtu.be/NzNuFN9hqjI)


## Setting up KVM 

- YAST -> Install hypervisor tools.

```
sudo systemctl start libvirtd
```
```
sudo systemctl enable libvirtd
```
```
sudo usermod -a -G libvirt $(whoami)
```
```
sudo virsh net-start default
```

## Symbolic links for dotfiles

- Install [vim-plug](https://github.com/junegunn/vim-plug) for neovim in arch distrobox

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

```bash
rm -rf ~/.bashrc &&
ln -s ~/dotfiles/.bashrc ~/ &&
ln -s ~/dotfiles/config/ranger/ ~/.config/ &&
ln -s ~/dotfiles/config/kitty/ ~/.config/ &&
ln -s ~/dotfiles/config/nvim/ ~/.config/ &&
ln -s ~/dotfiles/config/starship.toml ~/.config/ &&
ln -s ~/dotfiles/config/vscode/keybindings.json ~/.config/VSCodium/User/ &&
ln -s ~/dotfiles/config/vscode/settings.json ~/.config/VSCodium/User/ 
ln -s ~/dotfiles/config/hypr/ ~/.config
```
