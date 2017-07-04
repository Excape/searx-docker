#!/bin/sh
set -e

# run filtron
/go/bin/filtron -target app:${APP_PORT} -rules ${RULES_FILE} -listen 0.0.0.0:4004
