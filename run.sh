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
	if [[ ! -f /var/www/config/app.php ]]; then
		h2 'No Statamic found. Begin Statamic Installation ...'
		composer create-project statamic/statamic /tmp/statamic --prefer-dist --no-progress
		mv -n /tmp/statamic/* /var/www/
		sudo ln -s /var/www/please /usr/local/bin/please && chown +x /usr/local/bin/please /var/www/please
	else
		h2 'Statamic already installed.'
	fi
}

init() {
	h1 'Prepare Statamic'

	h2 'Check installation'
	check_statamic

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

main
