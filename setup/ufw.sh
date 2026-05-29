#!/bin/bash

INTERFACE=$(ip route | awk '/default/ {print $5}')

ufw default deny incoming
ufw default allow outgoing
ufw allow in on $INTERFACE to any port 80
ufw allow in on $INTERFACE to any port 443
ufw allow in on tailscale0
ufw enable
