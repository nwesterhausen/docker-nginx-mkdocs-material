#!/bin/sh
set -e

cd /docs && git clone "$DOC_REPO" .
mkdocs build -d /usr/share/nginx/html
nginx -g "daemon off;"