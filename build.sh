#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install screen 

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket

# Install Cosmic Desktop
curl -Lo /etc/yum.repos.d/_copr_ryanabx-cosmic.repo https://copr.fedorainfracloud.org/coprs/ryanabx/cosmic-epoch/repo/fedora-$(rpm -E %fedora)/ryanabx-cosmic-epoch-fedora-$(rpm -E %fedora).repo
rpm-ostree install cosmic-desktop power-profiles-daemon
rpm-ostree install gnome-keyring NetworkManager-tui NetworkManager-openvpn
systemctl disable gdm || true
systemctl disable sddm || true
systemctl enable cosmic-greeter
systemctl enable power-profiles-daemon
ostree container commit
mkdir -p /var/tmp
chmod -R 1777 /var/tmp
