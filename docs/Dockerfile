FROM ruby:2.3-alpine
RUN apk add --update nodejs g++ make
COPY Gemfile Gemfile.lock /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install
COPY . /usr/src/app
VOLUME /usr/src/app
EXPOSE 4567
CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]
