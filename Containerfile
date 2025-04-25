FROM ghcr.io/ublue-os/silverblue-main:latest

LABEL maintainer="Kevin Coppola <kcoppola@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/kevcops/shibe-os"
LABEL ostree.bootable="true"

# Install RPMs that work with the Silverblue base
RUN rpm-ostree install \
    libreoffice \
    simple-scan \
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

# Enable Flathub and install Flatpak apps
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Wine and Bottles from Flatpak
RUN flatpak install -y flathub org.winehq.Wine
RUN flatpak install -y flathub com.usebottles.bottles

# Branding and onboarding setup
COPY branding/ /etc/ublue-config/branding/
COPY yafti.yml /etc/ublue-config/yafti.yml

RUN install -Dm644 systemd/shibe-onboarding.service /etc/systemd/system/shibe-onboarding.service && \
    touch /etc/shibe-os-firstboot && \
    systemctl enable shibe-onboarding.service

RUN systemctl set-default graphical.target
RUN gtk-update-icon-cache /usr/share/icons/hicolor || true
