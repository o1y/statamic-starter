#!/bin/bash

if ! sudo mount -a 2> /dev/null; then
	printf '\e[1;31mERROR:\e[0m %s' \
		'Container running with improper privileges.

	Be sure your service is configured with the following options:
	___
	services:
	  statamic:
		cap_add:
		  - SYS_ADMIN
		devices:
		  - /dev/fuse
		# needed on certain cloud hosts
		security_opt:
		  - apparmor:unconfined
	___

	OR (use first option if possible)
	___
	services:
	statamic:
		privileged: true
	___

	' | sed 's/^    //'
	exit 1
fi

# Environment
# ------------
declare -x TERM="${TERM:-xterm}"

main() {
	init

	sudo rm -f /var/run/apache2/apache2.pid
	sudo apache2-foreground
}

# Config Functions
# ---------------------

init() {
	# Install Statamic
	if [[ ! -f /app/config/app.php ]]; then
		h1 'No Statamic found. Begin Statamic Installation ...'
		composer create-project statamic/statamic /app --prefer-dist --no-progress --stability=dev
		sudo ln -s /app/please /usr/local/bin/please && chown +x /usr/local/bin/please /app/please
	fi

	# Apache config adustments
	sudo sed -i \
		-e "/^[[:blank:]]*.ServerName www.example.com/{c\\" \
		-e "\\tServerName ${SERVER_NAME:-localhost} \\" \
		-e "\\tServerAlias www.${SERVER_NAME:-localhost}" \
		-e '}' /etc/apache2/sites-available/000-default.conf

	# Apache set Document Root
	sudo sed -i "s@DocumentRoot.*\$@DocumentRoot ${DOCUMENT_ROOT:-/var/www/html/public}@g" \
		/etc/apache2/sites-available/*.conf
	
	# Apache pass environment variables
	sudo tee /etc/apache2/conf-enabled/environment.conf > /dev/null <<-EOF
	SetEnv CACHE_DRIVER ${CACHE_DRIVER:-file}    
	SetEnv REDIS_HOST ${REDIS_HOST:-redis} 
	SetEnv REDIS_PORT ${REDIS_PORT:-6379} 
	SetEnv MAIL_HOST ${MAIL_HOST:-mail}
	SetEnv MAIL_PORT ${MAIL_PORT:-1025}
	SetEnv COMPOSER_HOME ${COMPOSER_HOME:-/usr/bin/composer}
	EOF

	# Fix file permissions
	if [[ -f /app/ ]]; then
		sudo find /app ! \( -user admin -group admin \) -exec chown admin:admin {} \;
	fi

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
