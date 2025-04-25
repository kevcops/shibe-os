FROM ghcr.io/ublue-os/silverblue-main:latest

LABEL maintainer="Kevin Coppola <kcoppola@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/kevcops/shibe-os"
LABEL ostree.bootable="true"

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

COPY branding/ /etc/ublue-config/branding/
COPY yafti.yml /etc/ublue-config/yafti.yml

RUN install -Dm644 systemd/shibe-onboarding.service /etc/systemd/system/shibe-onboarding.service && \
    touch /etc/shibe-os-firstboot && \
    systemctl enable shibe-onboarding.service

RUN systemctl set-default graphical.target
RUN gtk-update-icon-cache /usr/share/icons/hicolor || true
