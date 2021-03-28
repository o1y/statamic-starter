# Statamic V3 Starter
Statamic Starter is a Docker development environment to make [Statamic V3](https://www.statamic.com) development even more fun and easy. This is all you need to easily build a Statamic website using Apache and PHP 7.4.

This setup is currently tested on macOS.

[![Build Status](https://github.com/o1y/statamic-starter/actions/workflows/main.yml/badge.svg)](https://github.com/o1y/statamic-starter/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

## [FAQ] Why another development environment? There is already [Laravel Valet](https://laravel.com/docs/8.x/valet) or [Laravel Sail](https://laravel.com/docs/8.x/sail) or ... !

Of course you can use the mentioned development environments. I'm sure they are perfectly suited to work with Statamic V3!

So why another development environment? For me there are two reasons:
1. I want to use my local development environment in such a way that I don't have to install any dependencies on my system with the exception of Docker :)

2. I want to use an environment for testing that almost matches the remote environment. Many of my customers use Apache web servers on shared hosting environments. Laravel Sail uses only the Built-in PHP web server in which it is not possible to test real web server configurations, like modifications to `.htaccess`.

## Requirements

* Docker Engine >= 20.10.3
* Docker Compose >= 1.28.5

## Installation

To quickly get started, you can run the following commands:

```
git clone --depth=1 git@github.com:o1y/statamic-starter.git
cd statamic-starter/example
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
docker-compose exec statamic bash
```

Run `php artisan` or `php please` inside the statamic service.


Alternatively, the commands can also be executed directly on the host.

```
docker-compose exec statamic php please
```

## Build Images
Of course you can modify the existing `Dockerfile`. These are located inside `images/*/Dockerfile`. To build the images you can run the `build.sh` script using [npm](https://www.npmjs.com/).

```
npm run build
```

## License

© MIT Oliver Mesieh