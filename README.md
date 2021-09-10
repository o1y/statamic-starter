# Statamic Development Environment
Statamic Starter is a Docker development environment to make [Statamic V3](https://www.statamic.com) development even more fun and easy.

[![Build Status](https://github.com/o1y/statamic-starter/actions/workflows/main.yml/badge.svg)](https://github.com/o1y/statamic-starter/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

## Requirements

* Docker Desktop >= 3.4

## How do I create a new Docker Statamic development environment?

1. To create a new Statamic development environment, put the following configuration to your `docker-compose.yml`:

```yml
services:
  statamic:
    image: ghcr.io/o1y/statamic-starter:latest-php7.4
    ports:
      - 8080:8080
    volumes:
      - ./:/var/www/
```

2. Start the container:

```sh
docker compose up
```

After starting the container for the very first time the startup script checks if a Statamic project is available. If not, it will install a fresh copy.

3. Wait until you see `Statamic is ready` and open a browser of your choice and access your Statamic development environment:

```
http://localhost:8080
```

## How do I run `please` or `artisan`?

To run [please](https://statamic.dev/cli) get a bash shell in the container first:

```
docker compose exec statamic bash
```

Now you can run `php artisan` or `php please`.


An alternative way to run `please` or `artisan` commands in your container is:

```
docker compose exec statamic php please
docker compose exec statamic php artisan
```

## How do I create a new Statamic User?
The easiest way to create your first user is by running

```
docker compose exec statamic php please make:user
```

## Where should I put my `.env` variables for local development?
You should put your environment variables for local development into your `.env` file. Whenever you change that file, the php server will perform a reload. 

However, you should not commit your local `.env` into your project. Instead use the file `.env.docker`, which we create during the initial Statamic installation.

## How do I update Statamic?
In your `composer.json`, change the `statamic/cms` version to the version number of your choice, e.g:

```
"statamic/cms": "3.2.*"
```

Then run:
```
docker compose exec statamic composer update statamic/cms --with-dependencies
```

## Can I use your Statamic Image in production?
The image is not ready for production use yet. Feel free to create a PR :)

## License

© MIT Oliver Mesieh