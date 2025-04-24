# Containerfile for Shibe OS
FROM registry.fedoraproject.org/fedora:latest

LABEL org.opencontainers.image.title="Shibe OS"
LABEL org.opencontainers.image.description="Custom immutable Linux distro for pediatric dental offices - Shibe OS"

RUN dnf install -y rpm-ostree && dnf clean all

COPY ublue-config /etc/ublue-config
CMD ["bash", "-c", "rpm-ostree compose tree --repo=/ostree/repo --write-build-metadata --json /etc/ublue-config/packages.txt"]
