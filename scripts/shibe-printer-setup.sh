#!/usr/bin/env bash
# Shibe OS printer auto-setup
set -e
lpadmin -p SHIBE_Printer -E -v socket://192.168.1.100 -P /usr/share/ppd/HP/hp-laserjet.ppd
