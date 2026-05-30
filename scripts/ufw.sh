#!/bin/bash

ufw default deny incoming
ufw default allow outgoing
ufw allow in on tailscale0
ufw enable
