# Quickstart

The only thing you need to get started is a `docker-compose.yml` file:

```yml
version: '3.7'

services:
  statamic:
    image: ghcr.io/o1y/statamic-starter:latest-php7.4
    ports:
      - 8080:8080
    volumes:
      - ./:/var/www/
```

## Running the example

Run the following command in the root of the example directory.

```sh
$ docker compose up
```
