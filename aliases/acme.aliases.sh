#!/usr/bin/env bash
function instcert() {
    if [ ! -f ~/.acme.sh ]; then
	echo Please Install acme.sh first!
        return
    fi
    if [ $# != 1 ] ; then
        echo Usage: instcert [domain]
    else
        DOMAIN="$1"
        . "/root/.acme.sh/acme.sh.env"
        /root/.acme.sh/acme.sh --install-cert -d "$DOMAIN" \
          --key-file "/data/web/webcert/${DOMAIN}.key" \
          --fullchain-file "/data/web/webcert/${DOMAIN}.crt" \
          --reloadcmd "docker-compose -f /data/docker-compose.yml restart nginx"
   fi
}
