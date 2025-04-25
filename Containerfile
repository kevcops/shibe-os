FROM ghcr.io/ublue-os/silverblue-main:latest

LABEL maintainer="Kevin Coppola <kcoppola@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/kevcops/shibe-os"
LABEL ostree.bootable="true"

# Install RPM packages individually for easier troubleshooting
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

# Add Flathub repo
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Flatpak apps individually for visibility
RUN flatpak install -y flathub org.winehq.Wine
RUN flatpak install -y flathub com.usebottles.bottles
RUN flatpak install -y flathub com.brave.Browser

# Copy onboarding and branding files
COPY branding/ /etc/ublue-config/branding/
COPY yafti.yml /etc/ublue-config/yafti.yml

# First-boot onboarding service
RUN install -Dm644 systemd/shibe-onboarding.service /etc/systemd/system/shibe-onboarding.service && \
    touch /etc/shibe-os-firstboot && \
    systemctl enable shibe-onboarding.service

RUN systemctl set-default graphical.target
RUN gtk-update-icon-cache /usr/share/icons/hicolor || true
