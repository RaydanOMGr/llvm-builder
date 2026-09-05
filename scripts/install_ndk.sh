#!/usr/bin/env bash
set -euo pipefail

NDK_VERSION="r29"
NDK_ARCHIVE="android-ndk-${NDK_VERSION}-linux.zip"
NDK_DIR="android-ndk-${NDK_VERSION}"
NDK_URL="https://dl.google.com/android/repository/${NDK_ARCHIVE}"

install_ndk() {
    echo "Installing Android NDK ${NDK_VERSION}"

    curl -fL "$NDK_URL" -o "$NDK_ARCHIVE"
    unzip -q "$NDK_ARCHIVE"

    export ANDROID_NDK_HOME="$(pwd)/${NDK_DIR}"

    echo "ANDROID_NDK_HOME=${ANDROID_NDK_HOME}" >> "$GITHUB_ENV"

    rm -f "$NDK_ARCHIVE"
}

if [[ -n "${ANDROID_NDK_HOME:-}" && -d "${ANDROID_NDK_HOME}" ]]; then
    echo "Using preinstalled NDK at ${ANDROID_NDK_HOME}"
else
    echo "NDK not found. Installing Android NDK ${NDK_VERSION}..."
    install_ndk
fi

echo "Will use NDK at ${ANDROID_NDK_HOME}"
echo "NDK version: ${NDK_VERSION}"
echo "Arch (matrix): ${MATRIX_ARCH:-unknown}"
