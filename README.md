# Setting up my Fedora Workstation System

## Setting up[Distrobox](https://github.com/89luca89/distrobox) 
```
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --prefix ~/.local
```

```
distrobox-create -i docker.io/library/ubuntu:22.04 -n ubuntu
distrobox-create -i docker.io/library/archlinux:latest -n arch
```

## Setting up [Docker](https://docs.docker.com/engine/install/fedora/)
```
sudo dnf -y install dnf-plugins-core

sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo systemctl start docker
sudo systemctl enable docker

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

sudo docker run hello-world

```

## Installing necessary flatpak apps
```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.brave.Browser com.discordapp.Discord \
com.github.GradienceTeam.Gradience com.github.tchx84.Flatseal \
com.google.Chrome com.mattjakeman.ExtensionManager \
com.spotify.Client org.mozilla.firefox org.qbittorrent.qBittorrent 
org.telegram.desktop org.x.Warpinator
```

## Setting up Hyprland WM
[Fedora copr repository for hyprland](https://copr.fedorainfracloud.org/coprs/bzaidan/Hyprland/)
```
dnf copr enable bzaidan/Hyprland
```

```
sudo dnf install hyprland swaybg wofi \
qt5ct qt6ct kitty lxappearance \
ranger neovim pavucontrol 
```

