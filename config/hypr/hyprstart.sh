#!/bin/sh

cd ~

export SDL_VIDEODRIVER=wayland
export MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1

# Log WLR errors and logs to the hyprland log. Recommended
export HYPRLAND_LOG_WLR=1
#export WAYLAND_DISPLAY=wayland-0

# Tell XWayland to use a cursor theme
# export XCURSOR_THEME=Bibata-Modern-Classic

# Set a cursor size
export XCURSOR_SIZE=24

# Example IME Support: fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus


export XDG_SESSION_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=Hyprland

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

#if command -v dbus-update-activation-environment >/dev/null; then
#  dbus-update-activation-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
#fi
#systemctl --user import-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
#
## this teardown makes it easier to switch between compositors
#unset DISPLAY SWAYSOCK WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
#systemctl --user unset-environment DISPLAY SWAYSOCK WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
#if command -v dbus-update-activation-environment >/dev/null; then
#  dbus-update-activation-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
#fi

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &

exec /usr/bin/Hyprland
