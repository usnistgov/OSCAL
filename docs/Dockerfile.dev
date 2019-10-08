FROM ruby:2.6-alpine3.8 AS build-env
RUN apk update && apk add --no-cache build-base git nodejs-npm
RUN gem update bundler
RUN mkdir -p /app
WORKDIR /app
COPY Gemfile Gemfile.lock package.json ./
RUN bundle install -j 4 && \
    npm install
EXPOSE 4000
COPY . ./
CMD bundle exec jekyll serve -H 0.0.0.0 -I --verbose
VOLUME /app
