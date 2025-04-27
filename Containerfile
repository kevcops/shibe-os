FROM ghcr.io/ublue-os/silverblue-main:latest

LABEL maintainer="Kevin Coppola <kcoppola@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/kevcops/shibe-os"
LABEL ostree.bootable="true"

RUN rpm-ostree install libreoffice simple-scan tailscale vlc thunderbird chromium firefox gnome-boxes flameshot pinta --apply-live

RUN rpm-ostree install plasma-desktop sddm kde-settings kscreen plasma-workspace plasma-nm plasma-pa kwalletmanager dolphin konsole ark --apply-live

RUN ln -sf /usr/lib/systemd/system/sddm.service /etc/systemd/system/display-manager.service

RUN mkdir -p /etc/sddm.conf.d
RUN echo -e "[Autologin]\nSession=plasma.desktop" > /etc/sddm.conf.d/autologin.conf

RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

COPY branding/ /etc/ublue-config/branding/
COPY yafti.yml /etc/ublue-config/yafti.yml
COPY systemd/shibe-upgrade.service /etc/systemd/system/shibe-upgrade.service
COPY systemd/shibe-upgrade.timer /etc/systemd/system/shibe-upgrade.timer

RUN gtk-update-icon-cache /usr/share/icons/hicolor || true
