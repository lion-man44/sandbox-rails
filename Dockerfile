FROM ruby:2.6.0-alpine

ENV LANG=C.UTF-8 \
    PROJECT_ROOT=/usr/src/sandbox-rails

RUN mkdir -p /usr/local/etc \
  && { \
    echo 'install: --no-document'; \
    echo 'update: --no-document'; \
  } >> /usr/local/etc/gemrc

WORKDIR $PROJECT_ROOT

ADD Gemfile $PROJECT_ROOT/Gemfile
ADD Gemfile.lock $PROJECT_ROOT/Gemfile.lock

RUN apk update ; \
    apk upgrade ; \
    apk add --update --no-cache \
      build-base \
      curl-dev \
      libxml2-dev \
      libxslt-dev \
      mariadb-dev \
      ruby-dev \
      yaml-dev \
      zlib-dev \
      curl \
      vim \
      git \
      ruby-json \
      nodejs-current \
      nodejs-npm \
      tzdata \
      tree \
      the_silver_searcher \
      less \
      yaml ; \
    bundle install -j4 ; \
    rm -rf /var/cache/apk/* ; \
    rm -rf ~/.gem
