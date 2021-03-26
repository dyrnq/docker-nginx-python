#!/bin/bash
set -eo pipefail

_main() {
    if [ -n "$TZ" ]; then
        ( ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime && echo "$TZ" > /etc/timezone ) || true
    fi
    exec "$@"
}

_main "$@"