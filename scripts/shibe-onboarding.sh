#!/usr/bin/env bash
# Shibe OS first-run onboarding
set -e
bash /etc/ublue-config/branding/setup_wallpaper.sh
bash /etc/ublue-config/branding/setup_logo.sh

# Place CareStack shortcut on desktop and in launcher
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
