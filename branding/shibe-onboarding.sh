#!/usr/bin/env bash
set -e

echo "🐕 Shibe OS Final Setup Starting..."

if [ -f /etc/ublue-config/branding/wallpaper.jpg ]; then
    plasma-apply-wallpaperimage /etc/ublue-config/branding/wallpaper.jpg
    echo "✅ Wallpaper applied."
else
    echo "⚠️ Wallpaper file not found, skipping."
fi

sudo rpm-ostree install -y kde-gtk-config || true

kwriteconfig5 --file kdeglobals --group General --key ColorScheme "Breeze"
kwriteconfig5 --file kdeglobals --group KDE --key widgetStyle "Breeze"
echo "✅ Breeze theme set."

if [ -f /etc/ublue-config/branding/carestack.desktop ]; then
    mkdir -p ~/Desktop
    cp /etc/ublue-config/branding/carestack.desktop ~/Desktop/
    chmod +x ~/Desktop/carestack.desktop
    echo "✅ CareStack shortcut placed on Desktop."
else
    echo "⚠️ CareStack .desktop file not found, skipping."
fi

sudo systemctl enable sddm --force
sudo systemctl disable gdm
echo "✅ Login Manager switched to SDDM."

sudo gtk-update-icon-cache /usr/share/icons/hicolor || true

echo "🎉 Shibe OS Final Setup Complete! Please reboot to finish."
