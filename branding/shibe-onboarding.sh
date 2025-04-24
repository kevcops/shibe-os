#!/usr/bin/env bash
set -e

# Set up branding: wallpaper and logo
bash /etc/ublue-config/branding/setup_wallpaper.sh
bash /etc/ublue-config/branding/setup_logo.sh

# Place CareStack shortcut on Desktop and in launcher
DESKTOP_FILE="/etc/ublue-config/branding/carestack.desktop"
USER_HOME="/home/$USER"

if [ -d "$USER_HOME/Desktop" ]; then
  cp "$DESKTOP_FILE" "$USER_HOME/Desktop/"
  chown $USER:$USER "$USER_HOME/Desktop/carestack.desktop"
  chmod +x "$USER_HOME/Desktop/carestack.desktop"
fi

mkdir -p "$USER_HOME/.local/share/applications"
cp "$DESKTOP_FILE" "$USER_HOME/.local/share/applications/"
chown $USER:$USER "$USER_HOME/.local/share/applications/carestack.desktop"
chmod +x "$USER_HOME/.local/share/applications/carestack.desktop"

# Copy Shibe KDE launcher icon
install -Dm644 /etc/ublue-config/branding/shibe-launcher.png /usr/share/icons/hicolor/128x128/apps/shibe-launcher.png

# Apply KDE launcher config for new users
mkdir -p /etc/skel/.config
cp /etc/ublue-config/branding/plasma-org.kde.plasma.desktop-appletsrc /etc/skel/.config/

# Optional: preserve permissions and update icon cache (for KDE recognition)
gtk-update-icon-cache /usr/share/icons/hicolor || true
