# Red-docker
The Red Discord bot, packaged with alpine

[![Docker Pulls](https://img.shields.io/docker/pulls/vilgotf/red-discordbot)](https://hub.docker.com/r/vilgotf/red-discordbot)
[![Image Size](https://images.microbadger.com/badges/image/vilgotf/red-discordbot.svg)](https://microbadger.com/images/vilgotf/red-discordbot)

## How to run
```
podman run -it --label "io.containers.autoupdate=image" --name red -v red-discordbot:/data:Z vilgotf/red-discordbot:audio (CTRL C after done with setup)
podman generate systemd --restart-policy=always --new --files --name red
cp container-red.service ~/.config/systemd/user
systemctl enable --now container-red.service
```

If you want the container to continue run even when your not logged in:
```
loginctl enable-linger <username>
```
