FROM ruby:2.4.2

RUN apt-get update -qq && apt-get install -y build-essential nodejs npm nodejs-legacy libpq-dev postgresql-client

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs

COPY . .

LABEL maintainer="Aditya Tiwari <adityatiwari01933@gmail.com>"

CMD puma -C config/puma.rb