#!/bin/sh
set -eu

[ ! -f /root/.config/Red-DiscordBot/config.json ] && cp /config.json /root/.config/Red-DiscordBot/config.json

exec redbot container
