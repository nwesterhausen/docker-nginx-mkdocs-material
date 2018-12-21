FROM nginx:stable-alpine


ENV DOC_REPO https://github.com/nwesterhausen/howto-wiki

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

CMD /run.sh "$DOC_REPO"