# Statamic Starter
Statamic Starter is a Docker development environment to make [Statamic](https://www.statamic.com) development even more fun and easy. This is all you need to easily build a Statamic website using Apache and PHP.

This setup is currently tested on macOS.

[![Build Status](https://github.com/o1y/statamic-starter/actions/workflows/main.yml/badge.svg)](https://github.com/o1y/statamic-starter/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

## Requirements

* Docker Engine >= 20.10.3
* Docker Compose >= 1.28.5
* npm >= 6.14.10

## Installation

To quickly get started, you can run the following commands:

```
git clone --depth=1 git@github.com:o1y/statamic-starter.git
cd example
docker-compose up
```

Wait until you see the output `Statamic is ready`.

Open a browser of your choice and access your new local Statamic website:

```
http://localhost:8080
```

## Statamic Development

To run [CLI](https://statamic.dev/cli) get an interactive prompt first:

```
docker-compose exec app bash
```

Run `php artisan` or `php please` inside the app service.


Alternatively, the commands can also be executed directly on the host.

```
docker-compose exec app ./artisan
```

## Build Image

```
npm run build
```

## License

© MIT Oliver Mesieh