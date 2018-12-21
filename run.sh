#!/bin/sh
set -e

cd /docs && git clone "$1" .
mkdocs build -d /usr/share/nginx/html
nginx -g "daemon off;"