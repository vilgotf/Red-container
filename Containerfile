# SPDX-License-Identifier: AGPL-3.0-or-later

FROM python:3.8-alpine AS minimal

LABEL org.opencontainers.image.description The Red Discord bot, packaged with alpine
LABEL org.opencontainers.image.source https://github.com/vilgotf/Red-docker
LABEL org.opencontainers.image.licenses GPL-3.0-only

COPY root/config.json /root/.config/Red-DiscordBot/config.json

RUN apk --no-cache add git
RUN apk --no-cache add -t build-dependencies build-base \
	&& pip install Red-Discordbot \
	&& apk del build-dependencies

VOLUME /data

CMD redbot container

FROM minimal AS audio

RUN apk --no-cache add \
	openjdk11-jre-headless \
	libstdc++
