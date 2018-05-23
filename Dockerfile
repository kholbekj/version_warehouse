FROM bitwalker/alpine-elixir-phoenix:6.2
LABEL maintainer='seerup@autobutler.dk'
ENV MIX_ENV dev

RUN apk --update add postgresql-client && rm -rf /var/cache/apk/*

ENV app /version-warehouse
RUN mkdir -p $app
WORKDIR $app

COPY mix.exs mix.lock ./

ENV PATH ./bin:$PATH
RUN mix deps.get

COPY . $app
