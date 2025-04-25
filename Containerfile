FROM quay.io/fedora-ostree-desktops/kinoite:latest

LABEL maintainer="Kevin Coppola <kcoppola@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/kevcops/shibe-os"
LABEL ostree.bootable="true"

# Install additional packages
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

# Copy branding and onboarding files
COPY branding/ /etc/ublue-config/branding/
COPY yafti.yml /etc/ublue-config/yafti.yml

# Enable onboarding on first boot
RUN install -Dm644 systemd/shibe-onboarding.service /etc/systemd/system/shibe-onboarding.service && \
    touch /etc/shibe-os-firstboot && \
    systemctl enable shibe-onboarding.service

# Set default target to graphical
RUN systemctl set-default graphical.target

# Update icon cache
RUN gtk-update-icon-cache /usr/share/icons/hicolor || true
