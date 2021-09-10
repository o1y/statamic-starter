#!/bin/bash

# Environment
# ------------
declare -x TERM="${TERM:-xterm}"

main() {
	init

	php artisan serve --host 0.0.0.0 --port 8080
}

# Config Functions
# ---------------------

check_statamic() {
	if [[ ! -f config/app.php ]]; then
		h2 'No Statamic found. Begin Statamic Installation ...'
		composer create-project statamic/statamic /tmp/statamic --prefer-dist --no-progress
		shopt -s dotglob nullglob && mv -n /tmp/statamic/* .
		chmod +x please artisan
		cp -n .env.example .env && cp -n .env.example .env.docker
	else
		h2 'Statamic already installed.'
	fi
}

set_env() {
	if [[ ! -f .env.docker ]]; then
    fatal '.env.docker not found.'
    exit
  fi

  cp -n .env.docker .env
}

install_composer_dependencies() {
	if [[ -f composer.json ]]; then
		composer install --no-progress
	fi
}

init() {
	h1 'Prepare Statamic'

	h2 'Check installation'
	check_statamic

	h2 'Set .env'
  set_env

	h2 'Install composer dependencies'
	install_composer_dependencies

	h1 'Statamic is ready'
}

# Helpers
# ---------------------

declare -i term_width=70

h1() {
	declare border padding text
	border='\e[1;34m'"$(printf '=%.0s' $(seq 1 "$term_width"))"'\e[0m'
	padding="$(printf ' %.0s' $(seq 1 $(((term_width - $(wc -m <<< "$*")) / 2))))"
	text="\\e[1m$*\\e[0m"
	echo -e "$border"
	echo -e "${padding}${text}${padding}"
	echo -e "$border"
}

h2() {
	printf '\e[1;33m==>\e[37;1m %s\e[0m\n' "$*"
}

fatal() {
  printf '\e[1;31mFATAL:\e[37;1m %s\e[0m\n' "$*"
}

main
