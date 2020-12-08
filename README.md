# Red-container
Minimal rootless implementation of the Red Discord bot

[![Docker Pulls](https://img.shields.io/docker/pulls/vilgotf/red-discordbot)](https://hub.docker.com/r/vilgotf/red-discordbot)
[![Image Size](https://images.microbadger.com/badges/image/vilgotf/red-discordbot.svg)](https://microbadger.com/images/vilgotf/red-discordbot)
![build](https://github.com/vilgotf/Red-container/workflows/build/badge.svg?branch=main)

## List of tags
1. `minimal` (no audio support)
2. `audio` / `latest`
3. `audio-debian`

(1 and 2 are based on Alpine)

## How to run
```
podman run -it --label "io.containers.autoupdate=image" --name red -v red-discordbot:/data:Z vilgotf/red-discordbot (CTRL C after done with setup)
podman generate systemd --restart-policy=always --new --files --name red
cp container-red.service ~/.config/systemd/user
systemctl --user enable --now container-red.service
```

If you want the container to continue run even when your not logged in:
```
loginctl enable-linger <username>
```

### Envinormental variables
| ENV | default value |
| --- | ---
| `PREFIX` | -
| `TOKEN` | -
| `UID` | 1000

## Comparisons as of 24/10/20
### Ram usage
| | minimal/noaudio | audio |
| --- | --- | ---
| vilgotf/red-discordbot | 62MB | 472MB
| vilgotf/red-discordbot(debian) | | 509MB
| phasecorex/red-discordbot<sup>[1](#phasecorex-ram)</sup> | 68MB | 519MB

### Image size
| | minimal/noaudio | audio
| --- | --- | ---
| vilgotf/red-discordbot | 132MB | 300MB
| vilgotf/red-discordbot(debian | | 501MB
| phasecorex/red-discordbot<sup>[2](#phasecorex-image)</sup> | 365MB | 572MB

<a name="phasecorex-ram">1</a>: Note that phasecorex's image will, on first launch, be larger by ~200MB since it installs Red-Discordbot inside of the container.

<a name="phasecorex-image">2</a>: Note that phasecorex's image doesn't include Red-Discordbot whereas mine does
