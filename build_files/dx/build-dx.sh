#!/usr/bin/bash
# shellcheck disable=SC1091

set -ouex pipefail


. /tmp/build/copr-repos-dx.sh
. /tmp/build/packages-dx.sh
. /tmp/build/image-info.sh
. /tmp/build/fetch-install-dx.sh
. /tmp/build/workarounds.sh
. /tmp/build/systemd-dx.sh
. /tmp/build/branding-dx.sh
. /tmp/build/cleanup-dx.sh