#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install Packages

ostree container commit
