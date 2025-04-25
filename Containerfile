FROM ghcr.io/ublue-os/silverblue-main:latest

LABEL maintainer="Kevin Coppola <kcoppola@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/kevcops/shibe-os"
LABEL ostree.bootable="true"

# Install RPM packages individually for troubleshooting and tracking
RUN rpm-ostree install libreoffice --apply-live
RUN rpm-ostree install simple-scan --apply-live
RUN rpm-ostree install tailscale --apply-live
RUN rpm-ostree install vlc --apply-live
RUN rpm-ostree install gimp --apply-live
RUN rpm-ostree install blender --apply-live
RUN rpm-ostree install thunderbird --apply-live
RUN rpm-ostree install xournalpp --apply-live
RUN rpm-ostree install chromium --apply-live
RUN rpm-ostree install firefox --apply-live
RUN rpm-ostree install gnome-boxes --apply-live
RUN rpm-ostree install flameshot --apply-live

# Add Flathub remote (no flatpak installs during build)
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Copy onboarding scripts and branding assets
COPY branding/ /etc/ublue-config/branding/
COPY yafti.yml /etc/ublue-config/yafti.yml

# Install onboarding systemd service file only (NO systemctl enable during build!)
RUN install -Dm644 systemd/shibe-onboarding.service /etc/systemd/system/shibe-onboarding.service

# Create first boot marker
RUN touch /etc/shibe-os-firstboot

# Set default target to graphical desktop
RUN systemctl set-default graphical.target

# Refresh GTK icon cache for any new icons (like CareStack shortcut)
RUN gtk-update-icon-cache /usr/share/icons/hicolor || true
