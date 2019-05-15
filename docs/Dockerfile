FROM ruby:2.6-alpine3.8 AS build-env
RUN apk update && apk add --no-cache build-base git nodejs-npm
RUN gem update bundler
RUN mkdir -p /app
WORKDIR /app
COPY Gemfile Gemfile.lock package.json ./
RUN bundle install -j 4 && \
    npm install
ENV JEKYLL_ENV=production
COPY . ./
RUN bundle exec jekyll build --verbose
VOLUME /app

FROM nginx:1.13.0-alpine
WORKDIR /usr/share/nginx/html
COPY --from=build-env /app/_site ./
EXPOSE 80
