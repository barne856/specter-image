#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install Packages
curl -Lo /etc/yum.repos.d/_copr_the4runner-firefox-dev.repo https://copr.fedorainfracloud.org/coprs/the4runner/firefox-dev/repo/fedora-$RELEASE/the4runner-firefox-dev-fedora-$RELEASE.repo
rpm-ostree install firefox-dev
ostree container commit
