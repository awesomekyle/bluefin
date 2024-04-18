#!/usr/bin/bash

set -oue pipefail

systemctl enable swtpm-workaround.service
systemctl enable bluefin-dx-groups.service
systemctl enable --global bluefin-dx-user-vscode.service
systemctl disable pmie.service
systemctl disable pmlogger.service