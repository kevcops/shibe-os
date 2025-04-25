FROM ghcr.io/ublue-os/silverblue-main:latest

LABEL maintainer="Kevin Coppola <kcoppola@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/kevcops/shibe-os"
LABEL ostree.bootable="true"


RUN rpm-ostree install libreoffice \
RUN rpm-ostree install simple-scan \
RUN rpm-ostree install wine \
RUN rpm-ostree install tailscale \
RUN rpm-ostree install vlc \
RUN rpm-ostree install gimp \
RUN rpm-ostree install blender \
RUN rpm-ostree install thunderbird \
RUN rpm-ostree install xournalpp \
RUN rpm-ostree install google-chrome \
RUN rpm-ostree install firefox \
RUN rpm-ostree install brave-browser \
RUN rpm-ostree install bitwarden \
RUN rpm-ostree install gnome-boxes \
RUN rpm-ostree install flameshot \
    --apply-live

COPY branding/ /etc/ublue-config/branding/
COPY yafti.yml /etc/ublue-config/yafti.yml

RUN install -Dm644 systemd/shibe-onboarding.service /etc/systemd/system/shibe-onboarding.service && \
    touch /etc/shibe-os-firstboot && \
    systemctl enable shibe-onboarding.service

RUN systemctl set-default graphical.target
RUN gtk-update-icon-cache /usr/share/icons/hicolor || true
