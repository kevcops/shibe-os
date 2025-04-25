# Use a bootable base from uBlue (Fedora Kinoite with ostree + kernel)
FROM ghcr.io/ublue-os/kinoite:latest

LABEL maintainer="Kevin Coppola <kcoppola@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/kevcops/shibe-os"
LABEL ostree.bootable="true"

# Optional: Install extra RPMs
RUN rpm-ostree install \
    libreoffice \
    simple-scan \
    wine \
    tailscale \
    vlc \
    gimp \
    blender \
    thunderbird \
    xournalpp \
    google-chrome \
    firefox \
    brave-browser \
    bitwarden \
    gnome-boxes \
    flameshot \
    --apply-live

# Copy onboarding + branding files
COPY branding/ /etc/ublue-config/branding/
COPY yafti.yml /etc/ublue-config/yafti.yml

# Optional: Set a custom hostname if desired
# RUN echo "shibeos" > /etc/hostname

# Run your onboarding script on first boot
RUN install -Dm644 systemd/shibe-onboarding.service /etc/systemd/system/shibe-onboarding.service && \
    touch /etc/shibe-os-firstboot && \
    systemctl enable shibe-onboarding.service

# Set default target to graphical (KDE)
RUN systemctl set-default graphical.target

# Ensure proper permissions on icons/config
RUN gtk-update-icon-cache /usr/share/icons/hicolor || true
