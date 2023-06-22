#!/usr/bin/env bash
if [ -f /var/lib/bluemap/web/index.html ]; then
    rm --verbose --force /var/lib/bluemap/web/index.html
fi

exec $(which bluemapctl) \
    --verbose \
    --webserver \
    ${BLUEMAP_ARGS}
