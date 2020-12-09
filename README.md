# Red-container
Minimal rootless implementation of the Red Discord bot.

[![Docker Pulls](https://img.shields.io/docker/pulls/vilgotf/red-discordbot)](https://hub.docker.com/r/vilgotf/red-discordbot)
[![Image Size](https://images.microbadger.com/badges/image/vilgotf/red-discordbot.svg)](https://microbadger.com/images/vilgotf/red-discordbot)
![build](https://github.com/vilgotf/Red-container/workflows/build/badge.svg?branch=main)

## List of tags
1. `minimal` (no audio support)
2. `audio` / `latest`
3. `full` (gcc etcetera)
4. `audio-debian`
5. `full-debian`

(1, 2 and 3 are based on Alpine)

## How to run
```
podman run -it --label "io.containers.autoupdate=image" --name red -v red-discordbot:/data:Z docker.io/vilgotf/red-discordbot (CTRL C after done with setup)
podman generate systemd --restart-policy=always --new --files --name red
mv container-red.service ~/.config/systemd/user
systemctl --user enable --now container-red.service
```

The environmental variables `PREFIX` and `TOKEN` can be set for noninteractive setup

If you want the container to continue run even when your not logged in:
```
loginctl enable-linger <username>
```
