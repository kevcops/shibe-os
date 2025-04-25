#!/usr/bin/env bash
set -e

# Set up wallpaper and logo (if additional setup scripts exist)
if [ -f /etc/ublue-config/branding/setup_wallpaper.sh ]; then
  bash /etc/ublue-config/branding/setup_wallpaper.sh
fi

if [ -f /etc/ublue-config/branding/setup_logo.sh ]; then
  bash /etc/ublue-config/branding/setup_logo.sh
fi

# Create user Desktop path and place CareStack shortcut
USER_HOME="/home/$USER"
DESKTOP_FILE="/etc/ublue-config/branding/carestack.desktop"

mkdir -p "$USER_HOME/Desktop"
cp "$DESKTOP_FILE" "$USER_HOME/Desktop/"
chmod +x "$USER_HOME/Desktop/carestack.desktop"
chown "$USER:$USER" "$USER_HOME/Desktop/carestack.desktop"

# Add to user's launcher menu as well
mkdir -p "$USER_HOME/.local/share/applications"
cp "$DESKTOP_FILE" "$USER_HOME/.local/share/applications/"
chmod +x "$USER_HOME/.local/share/applications/carestack.desktop"
chown "$USER:$USER" "$USER_HOME/.local/share/applications/carestack.desktop"

# Install Shibe launcher icon for KDE Start menu
install -Dm644 /etc/ublue-config/branding/shibe-launcher.png /usr/share/icons/hicolor/128x128/apps/shibe-launcher.png

# Apply KDE default launcher icon for new users
install -Dm644 /etc/ublue-config/branding/plasma-org.kde.plasma.desktop-appletsrc /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc

# Install custom CareStack icon
install -Dm644 /etc/ublue-config/branding/icons/carestack.png /usr/share/icons/hicolor/128x128/apps/carestack.png

# Refresh icon cache
gtk-update-icon-cache /usr/share/icons/hicolor || true

# Install Wine and Bottles via Flatpak during onboarding
flatpak install -y flathub org.winehq.Wine || true
flatpak install -y flathub com.usebottles.bottles || true

