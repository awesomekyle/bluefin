#!/usr/bin/bash

set -ouex pipefail
fc-cache -f /usr/share/fonts/ubuntu
fc-cache -f /usr/share/fonts/inter

curl -s 'https://api.github.com/repos/be5invis/Iosevka/releases/latest' | \
    jq -r ".assets[] | \
    .browser_download_url" | \
    grep "PkgTTC-Iosevka-" | \
    xargs -n 1 curl -L -o /tmp/PkgTTC-Iosevka.zip --fail --silent --show-error
unzip /tmp/PkgTTC-Iosevka.zip -d /usr/share/fonts/iosevka
