# Statamic Docker Image

A development docker image to make [Statamic](https://www.statamic.com) development even more fun and easy. Please use this image only for local development. This project was inspired by [visiblevc/wordpress-starter](https://github.com/visiblevc/wordpress-starter).


## Requirements

* Docker Engine >= 20.10.3
* Docker Compose >= 1.28.5

### Optional
* npm >= 6.14.10

## Usage
1. Make sure your `docker-compose.yml` contains the following service configuration:
```
app:
  image: o1y/statamic:latest-php7.4
  cap_add:
    - SYS_ADMIN
  devices:
    - /dev/fuse
  ports:
    - 8080:80
    - 443:443
  volumes:
    - ./data:/app
```

In this example the service will mount the directory `./data` on the host into the containers `/app` directory. This docker image internally uses `bindfs` to mount all folder and files with correct user and group permissions.

2. When starting development on a daily base you have to run the following command to start development environment:

```
docker-compose up
```

Wait until you see the output

````
======================================================================
                           Statamic is ready                           
======================================================================
````

3. Open the app in a browser of your choice:

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