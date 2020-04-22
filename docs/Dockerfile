FROM openjdk:13.0.1-jdk
ARG HUGO_VERSION=0.69.0
RUN mkdir /hugo && \
  cd hugo && \
  curl -L -O https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz && \
  tar -xzvf hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz && \
  mv hugo /usr/local/bin && \
  cd / && \
  rm -rf hugo/
WORKDIR /docs
COPY . .
ENTRYPOINT hugo server --enableGitInfo=false -v --debug --minify --bind 0.0.0.0 