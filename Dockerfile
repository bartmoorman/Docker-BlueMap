FROM bmoorman/ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

ENV BLUEMAP_PORT=8100

WORKDIR /var/lib/bluemap

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    default-jre-headless \
    jq \
    vim \
    wget \
 && fileUrl=$(curl --silent --location "https://api.github.com/repos/BlueMap-Minecraft/BlueMap/releases" | jq --raw-output '.[0].assets[] | select(.name | endswith("cli.jar")) | .browser_download_url') \
 && wget --quiet --directory-prefix /opt/bluemap "${fileUrl}" \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY bluemap/ /etc/bluemap/
COPY bin/ /usr/local/bin/

VOLUME /var/lib/bluemap

EXPOSE ${BLUEMAP_PORT}

CMD ["/etc/bluemap/start.sh"]

HEALTHCHECK --interval=60s --timeout=5s CMD curl --insecure --silent --show-error --fail "http://localhost:${BLUEMAP_PORT}/" || exit 1
