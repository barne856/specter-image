#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install Packages
curl -Lo /etc/yum.repos.d/_copr_proletarius101-firefox-nightly.repo https://copr.fedorainfracloud.org/coprs/proletarius101/firefox-nightly/repo/fedora-$RELEASE/proletarius101-firefox-nightly-fedora-$RELEASE.repo
rpm-ostree install firefox-nightly
ostree container commit
