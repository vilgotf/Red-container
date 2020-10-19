# Red-docker
The Red Discord bot, packaged with alpine

## How to run
```
podman run -it --label "io.containers.autoupdate=image" --name red -v /persistence_folder:/data:Z vilgotf/red-discordbot:latest (CTRL C after done with setup)
podman generate systemd --restart-policy=always --new --files --name red
cp container-red.service ~/.config/systemd/user
systemctl enable --now container-red.service
```

If you want the container to continue run even when your not logged in:
```
loginctl enable-linger <username>
```
