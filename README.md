# Setting up my Fedora System (KDE plasma)

## Initial tweaks

### Speeding up dnf

- References
  - [Tech Hut - 7 Things You MUST DO After Installing Fedora](https://youtu.be/RrRpXs2pkzg)
  - [The Linux Cast - 5 Things To Do After Installing Fedora](https://youtu.be/DEAzqHz9LPs)

```
sudo vi /etc/dnf/dnf.conf
```

```
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True
```

```
sudo dnf upgrade
```

### Enable extra 3rd party [rpm fusion repositories](https://rpmfusion.org/Configuration)
```
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

### Multimedia codecs
```
sudo dnf groupupdate core
```
```
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
```
```
sudo dnf groupupdate sound-and-video
```

## Installing necessary [flatpak](https://flatpak.org/setup/Fedora) apps
```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

```
flatpak install flathub com.brave.Browser com.discordapp.Discord \
com.google.Chrome com.spotify.Client \
org.mozilla.firefox org.qbittorrent.qBittorrent \
org.telegram.desktop io.mpv.Mpv flatpak install flathub org.mozilla.firefox
```

## Setting up [Distrobox](https://github.com/89luca89/distrobox) 
```
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --prefix ~/.local
```

```
distrobox-create -i docker.io/library/ubuntu:22.04 -n ubuntu
```

```
distrobox-create -i docker.io/library/archlinux:latest -n arch
```

Install necessary packages in arch distrobox
```
distrobox enter arch
```

Install yay-bin
```
git clone https://aur.archlinux.org/yay-bin.git
```
```
pacman -S --needed git base-devel
```
```
makepkg -si
```
```
sudo yay -S neofetch neovim imagemagick jdk11-openjdk vscodium-bin
```

Exporting arch packages to host machine
```
distrobox-export --app gnome-tweaks &&
distrobox-export --app vscodium &&
distrobox-export --bin /usr/sbin/convert --export-path ~/.local/bin/ &&
distrobox-export --bin /usr/sbin/mogrify --export-path ~/.local/bin/ &&
distrobox-export --bin /usr/sbin/nvim --export-path ~/.local/bin/
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

## Setting up [Docker](https://docs.docker.com/engine/install/fedora/)
```
sudo dnf -y install dnf-plugins-core
```

```
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
```

```
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

```
sudo systemctl start docker
```
```
sudo systemctl enable docker
```

```
sudo groupadd docker
```
```
sudo usermod -aG docker $USER
```
```
newgrp docker
```

```
sudo docker run hello-world
```


## Setting up KVM 
- [Guide](https://fedoramagazine.org/full-virtualization-system-on-fedora-workstation-30/)
- [Using Windows 11 in KVM | Secure Boot, Simulated TPM, & VirtIO Guest Tools - Trafotin](https://youtu.be/i-OHcENVMG0)
- [Gnome Boxes | Installing Windows 10 on Linux - Chris Titus Tech](https://youtu.be/c1c5wiQhgZU)

```
sudo dnf install @virtualization
```
```
sudo dnf install virt-manager spice-vdagent spice-gtk xf86-video-qxl virt-install virt-viewer
```
```
sudo systemctl start libvirtd
```
```
sudo systemctl enable libvirtd
```
```
sudo usermod -a -G libvirt $(whoami)
```
