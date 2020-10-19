#!/bin/sh
set -e

cd /docs

if [ -d .git ]; then
    CURR_REMOTE=$(git remote show origin | grep 'Fetch URL' | sed -E 's/(.+: )//g')
    echo "Existing repo $CURR_REMOTE";
    git pull;
else
    echo "DOC_REPO=$DOC_REPO";
    git clone "$DOC_REPO" .;
fi;

mkdocs build -d /usr/share/nginx/html
nginx -g "daemon off;"
