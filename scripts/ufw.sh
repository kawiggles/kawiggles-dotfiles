#!/bin/bash

systemctl enable ufw.service
ufw default deny incoming
ufw default allow outgoing
ufw allow in on tailscale0
ufw enable
