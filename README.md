### Docker Run
```
docker run \
--detach \
--name bluemap \
--restart unless-stopped \
--publish 8100:8100 \
--volume bluemap-data:/var/lib/bluemap \
--volume minecraft-data:/var/lib/minecraft:ro \
bmoorman/bluemap:latest
```

### Docker Compose
```
version: "3.7"
services:
  bluemap:
    image: bmoorman/bluemap:latest
    container_name: bluemap
    restart: unless-stopped
    ports:
      - "8100:8100"
    volumes:
      - bluemap-data:/var/lib/bluemap
      - minecraft-data:/var/lib/minecraft:ro

volumes:
  bluemap-data:
  minecraft-data:
```

### Environment Variables
|Variable|Description|Default|
|--------|-----------|-------|
|TZ|Sets the timezone|`America/Denver`|
|BLUEMAP_ARGS|Sets custom args passed to BlueMap|`<empty>`|
