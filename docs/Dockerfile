FROM ubuntu:20.04
ARG HUGO_VERSION=0.83.1

RUN mkdir /hugo && \
  cd /hugo && \
  apt-get update && \
  apt-get install -y apt-utils curl && \
  curl -L -O https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.deb && \
  apt-get install ./hugo_extended_${HUGO_VERSION}_Linux-64bit.deb
WORKDIR /docs
COPY . .
ENTRYPOINT hugo server --enableGitInfo=false -v --debug --minify --bind 0.0.0.0
