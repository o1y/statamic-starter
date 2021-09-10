# Statamic V3 Starter
Statamic Starter is a Docker development environment to make [Statamic V3](https://www.statamic.com) development even more fun and easy.

This setup is currently tested on macOS.

[![Build Status](https://github.com/o1y/statamic-starter/actions/workflows/main.yml/badge.svg)](https://github.com/o1y/statamic-starter/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

## Requirements

* Docker Engine >= 20.10.3
* Docker Compose >= 1.28.5

## Installation

To quickly get started, you can run the following commands:

```
git clone --depth=1 git@github.com:o1y/statamic-starter.git
cd statamic-starter/example
docker compose up
```

Wait until you see the output `Statamic is ready`.

Open a browser of your choice and access your new local Statamic website:

```
http://localhost:8080
```

## Statamic Development

To run [CLI](https://statamic.dev/cli) get an interactive prompt first:

```
docker-compose exec statamic bash
```

Run `php artisan` or `php please` inside the statamic service.


Alternatively, the commands can also be executed directly on the host.

```
docker-compose exec statamic php please
```

## Build Images
All Dockerfiles are located inside `images/*/Dockerfile`. To build the images you can run the `build.sh` script using [npm](https://www.npmjs.com/).

```
npm run build
```

## License

© MIT Oliver Mesieh