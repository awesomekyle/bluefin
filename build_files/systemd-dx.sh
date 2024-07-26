#!/usr/bin/bash

set -ouex pipefail

systemctl enable swtpm-workaround.service
systemctl enable bluefin-dx-groups.service
systemctl enable incus-workaround.service
systemctl enable --global bluefin-dx-user-vscode.service
systemctl disable pmie.service
systemctl disable pmlogger.service
