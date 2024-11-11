#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install Packages
# Brave Browser
curl -Lo /etc/yum.repos.d/brave-browser.repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
curl -Lo /etc/pki/rpm-gpg/brave-core.asc https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
rpm-ostree install brave-browser
ostree container commit
# env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia  --enable-unsafe-webgpu --enable-features=Vulkan
