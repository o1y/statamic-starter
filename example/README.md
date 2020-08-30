# Quickstart

Download this example to your current working directory.

The only thing you need to get started is a `docker-compose.yml` file:

```yml
version: '3.7'

networks:
  statamic:
    driver: bridge

services:
  statamic:
    image: o1y/statamic
    cap_add:
      - SYS_ADMIN
    devices:
      - /dev/fuse
    ports:
      - 8080:80
      - 443:443
    volumes:
      - ./data:/app
    networks:
      - statamic
    environment:
      - CACHE_DRIVER=redis
      - REDIS_HOST=redis
      - REDIS_PORT=6379
      - MAIL_HOST=mail
      - MAIL_PORT=1025
volumes:
  data:
```

## Running the example

1.  Run the following command in the root of the example directory.

```sh
$ docker-compose up -d && docker-compose logs -f statamic
```

2.  When the build is finished, hit <kbd>ctrl</kbd>-<kbd>c</kbd> to detach from the logs and visit `localhost:8080` in your browser.
