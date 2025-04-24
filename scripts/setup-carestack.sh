#!/usr/bin/env bash
set -e
mkdir -p /etc/skel/.config/shibe
echo "$OFFICE_ID" > /etc/skel/.config/shibe/office-id.txt

cat > /etc/skel/Desktop/carestack.desktop <<EOF
[Desktop Entry]
Name=CareStack
Exec=google-chrome --app=https://$OFFICE_ID.carestack.com
Icon=google-chrome
Terminal=false
Type=Application
Categories=Office;
EOF

chmod +x /etc/skel/Desktop/carestack.desktop
