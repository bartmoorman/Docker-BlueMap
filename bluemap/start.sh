#!/bin/bash
exec $(which bluemapctl) \
    --verbose \
    --webserver \
    ${BLUEMAP_ARGS}
