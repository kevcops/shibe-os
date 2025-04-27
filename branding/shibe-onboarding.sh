#!/usr/bin/env bash
set -e

echo "🐕 Shibe OS Setup Starting..."

WALLPAPER_PATH="/etc/ublue-config/branding/wallpaper.jpg"
if [ -f "$WALLPAPER_PATH" ]; then
    plasma-apply-wallpaperimage "$WALLPAPER_PATH"
    echo "✅ Wallpaper applied."
else
    echo "⚠️ Wallpaper not found, skipping."
fi

kwriteconfig5 --file kdeglobals --group General --key ColorScheme "Breeze"
kwriteconfig5 --file kdeglobals --group KDE --key widgetStyle "Breeze"

if [ -f /etc/ublue-config/branding/carestack.desktop ]; then
    mkdir -p ~/Desktop
    cp /etc/ublue-config/branding/carestack.desktop ~/Desktop/
    chmod +x ~/Desktop/carestack.desktop
    echo "✅ CareStack Shortcut placed."
fi

echo "🎉 Shibe OS Setup Complete! Please reboot to finish."
