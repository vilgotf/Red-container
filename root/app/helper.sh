#!/bin/sh
set -eu

[ ! -f /data/config.json ] && cp /config.json /data/config.json

exec redbot container
