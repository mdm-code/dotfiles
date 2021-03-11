#!/bin/sh
set -e

#  _____                    _
# |  __ \                  | |
# | |  \/ ___      ___  ___| |_ _   _ _ __
# | | __ / _ \    / __|/ _ \ __| | | | '_ \
# | |_\ \ (_) |   \__ \  __/ |_| |_| | |_) |
#  \____/\___/    |___/\___|\__|\__,_| .__/
#                                    | |
#                                    |_|
#
# This setup lets you easily add other versions of Go
# and switch between them by changing the `current` symlink.
#
# After running the script remember to set up PATH:
# 1. goroot/current/bin
# 2. gopath/bin
# 3. set `go env -w "GOPATH=gopath`"

DEFAULT_VER="1.16"
VERSION="${1:-$DEFAULT_VER}"
DEFAULT_DIR="$HOME/go"
TARGET_DIR="${2:-$DEFAULT_DIR}"
OS="$(uname -s)"
ARCH="$(uname -m)"

# ==== PLATFORM ====
case $OS in
	"Darwin")
		PLATFORM="darwin-amd64"
	;;
	"Linux")
		case $ARCH in
		"x86_64")
			ARCH=amd64
			;;
		"aarch64")
			ARCH=arm64
			;;
		"armv6" | "armv7l")
			ARCH=armv6l
			;;
		"armv8")
			ARCH=arm64
			;;
		.*386.*)
			ARCH=386
			;;
			esac
        PLATFORM="linux-$ARCH"
esac
[ -z "$PLATFORM" ] && echo "$0: $OS Unsupported platform" && exit 1

# ==== DOWNLOAD ====
PKG="go$VERSION.$PLATFORM.tar.gz"
TMPDIR="$(mktemp -d)"
echo "Downloading $PKG ..."
curl -o "$TMPDIR/go.tar.gz" https://storage.googleapis.com/golang/$PKG
if [ $? -ne 0 ]; then
    echo "Download failed! Exiting."
    exit 2
fi

# ==== EXTRACTION AND DIR STRUCTURE ====
GOROOT="$TARGET_DIR/goroot"
GOPATH="$TARGET_DIR/gopath"

echo "Extracting File..."
mkdir -p "$GOROOT/go" || echo "Target directory already exists"
tar -C "$GOROOT/go" --strip-components=1 -xzf "$TMPDIR/go.tar.gz"
mv "$GOROOT/go" "$GOROOT/$VERSION"
ln -sf "$GOROOT/$VERSION" "$GOROOT/current"
mkdir -p "${GOPATH}/"{src,pkg,bin}
rm -f "$TEMP_DIRECTORY/go.tar.gz"

