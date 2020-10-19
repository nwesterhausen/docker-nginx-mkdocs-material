FROM nginx:alpine
LABEL maintainer="Nicholas Westerhausen"

## Install Packages
RUN apk add --no-cache \
    python3 \
    py3-pip \
    git \
## Install Build dependencies (for some mkdocs requirements)
  && apk add --no-cache --virtual .build-deps \
      build-base \
      curl \
      wget \
      make \
      python3-dev \
## Install mkdocs
  && pip3 install mkdocs pygments \
      mkdocs-material \
      mkdocs-rtd-dropdown \
      mkdocs-safe-text-plugin \
      mkdocs-mermaid-plugin \
## Delete possible PIP cache
  && rm -rf "$HOME/.cache" \
## Remove build-dep packages
  && apk del .build-deps

## Expose the web port used by nginx
EXPOSE 80

## By default, use this project's own git repo for the wiki
ENV DOC_REPO https://github.com/nwesterhausen/docker-nginx-mkdocs-material

## run.sh is executed when running the docker image
COPY run.sh /run.sh
RUN chmod +x /run.sh \
  && mkdir /docs

CMD /run.sh
