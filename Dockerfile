FROM ruby:3.3.0

MAINTAINER Dan Lynn <docker@danlynn.org>

RUN gem install bundler-audit

WORKDIR /myapp

CMD bundle-audit check --update

