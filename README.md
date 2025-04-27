# 🐕 Shibe OS

Welcome to **Shibe OS** — your secure, polished Linux for dental offices.

## Features

- Immutable Fedora Silverblue Base
- KDE Plasma Desktop Only (No GNOME)
- First Boot Setup Wizard (Yafti)
- Optional Apps (Zoom, Slack, GIMP, etc.)
- CareStack Portal Integration
- Automatic Nightly Updates

## Quick Install

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/kevcops/shibe-os:latest
sudo systemctl reboot
```

## Updates

Updates are managed automatically.  
You can manually update with:

```bash
sudo bootc upgrade
```

---

Secure. Simple. Reliable. 🐕
