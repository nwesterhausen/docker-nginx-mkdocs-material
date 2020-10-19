# docker-nginx-mkdocs-material

[![](https://images.microbadger.com/badges/image/nwesterhausen/static-mkdocs-material.svg)](https://microbadger.com/images/nwesterhausen/static-mkdocs-material "Get your own image badge on microbadger.com")

Pulls raw mkdocs, builds, then serves with nginx

## Usage

Set up a git repository that can be cloned. This will house your mkdocs raw markdown and configuration ([Github hosted example]()).

This container uses the default nxinx:alpine as a base, so the final documentation site is run on port 80 in the container.

To run the container exposing the mkdocs site on localhost:8900:

```
docker run \
  --env "DOC_REPO=<your_reposity>" \
  --publish 172.0.0.1:8900:80 \
  nwesterhausen/static-mkdocs-material
```

## Environment Variables

| Name     | Usage                                                                                              |
| -------- | -------------------------------------------------------------------------------------------------- |
| DOC_REPO | This should point the location of a git repository that can be pulled at runtime of the container. |
