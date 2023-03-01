FROM ruby:3.1.2
LABEL maintainer="tony.senik@gmail.com"

RUN apt-get update -qq \
    && apt-get install -y ca-certificates build-essential tzdata shared-mime-info cron libpq-dev postgresql-client\
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem update --system
RUN bundle update --bundler
RUN bundle install
COPY . /myapp

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
