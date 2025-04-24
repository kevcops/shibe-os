#!/usr/bin/env bash
# Shibe OS one-click VPN connection (Tailscale)
set -e
tailscale up --authkey="$TAILSCALE_AUTH_KEY"
