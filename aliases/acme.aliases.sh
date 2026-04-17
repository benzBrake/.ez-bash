#!/usr/bin/env bash
function instcert() {
    local ACME_DIR="${LE_WORKING_DIR:-$HOME/.acme.sh}"
    local ACME_ENV="$ACME_DIR/acme.sh.env"
    local ACME_BIN="$ACME_DIR/acme.sh"

    if [ ! -f "$ACME_BIN" ]; then
        echo "Please Install acme.sh first!"
        return 1
    fi

    if [ ! -f "$ACME_ENV" ]; then
        echo "Missing acme.sh env file: $ACME_ENV"
        return 1
    fi

    if [ $# -ne 1 ]; then
        echo "Usage: instcert [domain]"
        return 1
    fi

    local DOMAIN="$1"
    local CERT_DIR="${EZ_CERT_DIR:-/data/web/webcert}"
    local RELOAD_CMD="${EZ_RELOAD_CMD:-if command -v docker-compose >/dev/null 2>&1; then docker-compose -f /data/docker-compose.yml restart nginx; else docker compose -f /data/docker-compose.yml restart nginx; fi}"

    # Ensure certificate directory exists
    mkdir -p "$CERT_DIR"

    # Source acme.sh environment and install cert
    . "$ACME_ENV"
    "$ACME_BIN" --install-cert -d "$DOMAIN" \
        --key-file "${CERT_DIR%/}/${DOMAIN}.key" \
        --fullchain-file "${CERT_DIR%/}/${DOMAIN}.crt" \
        --reloadcmd "$RELOAD_CMD"
}
