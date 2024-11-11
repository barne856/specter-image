#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install Packages
# env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia  --enable-unsafe-webgpu --enable-features=Vulkan
