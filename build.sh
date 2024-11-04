#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install Packages
curl -Lo /etc/yum.repos.d/_copr_ryanabx-cosmic.repo https://copr.fedorainfracloud.org/coprs/ryanabx/cosmic-epoch/repo/fedora-$RELEASE/ryanabx-cosmic-epoch-fedora-$RELEASE.repo
curl -Lo /etc/yum.repos.d/_copr_proletarius101-firefox-nightly.repo https://copr.fedorainfracloud.org/coprs/proletarius101/firefox-nightly/repo/fedora-$RELEASE/proletarius101-firefox-nightly-fedora-$RELEASE.repo
rpm-ostree install cosmic-desktop
rpm-ostree install gnome-keyring NetworkManager-tui NetworkManager-openvpn firefox-nightly
systemctl disable gdm || true
systemctl disable sddm || true
systemctl enable cosmic-greeter
ostree container commit
mkdir -p /var/tmp
chmod -R 1777 /var/tmp
