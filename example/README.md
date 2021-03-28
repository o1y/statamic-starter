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
    image: ghcr.io/o1y/statamic-starter:latest-php7.4
    cap_add:
      - SYS_ADMIN
    devices:
      - /dev/fuse
    ports:
      - 8080:80
      - 443:443
    volumes:
      - ./statamic:/app
    networks:
      - statamic
volumes:
  data:
```

## Running the example

1.  Run the following command in the root of the example directory.

```sh
$ docker-compose up -d && docker-compose logs -f statamic
```

2.  When the build is finished, hit <kbd>ctrl</kbd>-<kbd>c</kbd> to detach from the logs and visit `localhost:8080` in your browser.
