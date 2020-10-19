# SPDX-License-Identifier: AGPL-3.0-or-later

FROM python:3.8-alpine

LABEL org.opencontainers.image.description="The Red Discord bot, packaged with alpine"
LABEL org.opencontainers.image.source="https://github.com/vilgotf/Red-docker"
LABEL org.opencontainers.image.licenses="GPL-3.0-only"

RUN apk --no-cache add git openjdk11-jre-headless
RUN apk --no-cache add -t build-dependencies build-base \
	&& pip install Red-Discordbot \
	&& apk del build-dependencies

RUN set -eu; \
	mkdir -p /root/.config/Red-DiscordBot && \
	ln -s /data/config.json /root/.config/Red-DiscordBot/config.json

COPY root/ /

VOLUME /data

CMD ["/app/helper.sh"]
