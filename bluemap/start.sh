#!/bin/bash
if [ ! -f core.conf -o ! -f render.conf -o ! -f webserver.conf ]; then
    $(which java) -jar /opt/bluemap/BlueMap-*-cli.jar
fi

exec $(which java) \
    -jar /opt/bluemap/BlueMap-*-cli.jar \
    --webserver
