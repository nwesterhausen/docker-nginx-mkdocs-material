FROM nginx:stable-alpine

LABEL maintainer="Nicholas Westerhausen"

# By default, use this project's own git repo for the wiki
ENV DOC_REPO https://github.com/nwesterhausen/docker-nginx-mkdocs-material

RUN apk update && \
  apk add --no-cache \ 
          python2 \
          py2-pip \
          git

RUN pip install --upgrade pip && \
  pip install mkdocs mkdocs-material

WORKDIR /docs

EXPOSE 80

COPY run.sh /run.sh

CMD /run.sh