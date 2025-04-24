#!/usr/bin/env bash
# Shibe OS KDE desktop configuration
set -e
plasmashell --replace &
sleep 3
dbus-send --session --dest=org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript \
    string:'var allDesktops = desktops(); for (i=0;i<allDesktops.length;i++) { d = allDesktops[i]; d.wallpaperPlugin = "org.kde.image"; d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General"); d.writeConfig("Image", "/etc/ublue-config/branding/shibe-wallpaper.png"); }'
