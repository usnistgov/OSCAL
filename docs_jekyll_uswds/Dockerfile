FROM ruby:2.5.1-alpine3.7 AS build-env
RUN apk update && apk add --no-cache build-base git
RUN gem update bundler
RUN mkdir -p /app
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install -j 4
ENV JEKYLL_ENV=production
COPY . ./
RUN bundle exec jekyll build --verbose
VOLUME /app

FROM nginx:1.13.0-alpine
WORKDIR /usr/share/nginx/html
COPY --from=build-env /app/_site ./
EXPOSE 80
