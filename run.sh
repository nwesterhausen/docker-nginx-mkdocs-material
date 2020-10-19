#!/bin/sh
set -e

cd /docs

if [ -d .git ]; then
    git pull;
else
    git clone "$DOC_REPO" .;
fi;

mkdocs build -d /usr/share/nginx/html
nginx -g "daemon off;"