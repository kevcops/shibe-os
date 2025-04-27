# 🐕 Shibe OS

Secure. Simple. Reliable.  
The custom Linux operating system built for dental office workflows.

---

## 📋 About Shibe OS

**Shibe OS** is a custom Fedora Silverblue-based Linux distribution designed for:
- Immutable, read-only security
- First boot onboarding (CareStack Portal, optional apps)
- Professional KDE Plasma desktop environment
- Automatic nightly system updates

Built specifically for **dental offices**, **front desk staff**, and **administrators**.

---

## 🚀 Quick Install

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/kevcops/shibe-os:latest
sudo systemctl reboot
```

✅ After reboot, follow the onboarding wizard.

---

## 🖥 Included Features

| Feature | Status |
|---------|--------|
| KDE Plasma Desktop | ✅ |
| Auto Login with SDDM | ✅ |
| CareStack Desktop Integration | ✅ |
| Optional Apps Install (Zoom, Slack, GIMP, etc.) | ✅ |
| Auto System Updates (bootc nightly) | ✅ |
| Flatpak preconfigured (Flathub) | ✅ |
| Immutable Read-Only OS (rpm-ostree) | ✅ |

---

## 📈 Versioning

| Version | Notes |
|---------|-------|
| **v1** | Initial release, GNOME + KDE offered |
| **v2** | **(Current)** KDE only, polished onboarding, branding improvements |
| **v3** | *(Planned)* ISO creation, Try/Install flow, more onboarding options |

---

## 🔧 Manual System Update

You can manually trigger a system upgrade:

```bash
sudo bootc upgrade
```

✅ Then reboot to apply updates.

---

## 🛡 Technologies Used

- Fedora Silverblue / rpm-ostree
- KDE Plasma
- Flatpak ecosystem
- GitHub Actions for automatic container builds

---

## 📜 License

MIT License.  
You are free to customize, fork, and adapt Shibe OS for your office or organization!

---

# 🦷🐕 Shibe OS — built for dental offices, perfected for simplicity.
