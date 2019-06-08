FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /webapp
WORKDIR /webapp

COPY ./back/Gemfile /webapp/Gemfile
COPY ./back/Gemfile.lock /webapp/Gemfile.lock

RUN gem install bundler:2.0.1
RUN cd /webapp
RUN bundle install

COPY ./back /webapp
