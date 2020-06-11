FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN apt-get clean

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install bundler -v 2.0.1

RUN mkdir /ready-set-jet-api
WORKDIR /ready-set-jet-api

COPY Gemfile /ready-set-jet-api/Gemfile
COPY Gemfile.lock /ready-set-jet-api/Gemfile.lock

RUN bundle install
COPY . /ready-set-jet-api

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3001

# CMD ["rails", "s", "-b", "0.0.0.0", "-p", "3001"]