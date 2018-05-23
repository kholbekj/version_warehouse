FROM bitwalker/alpine-elixir-phoenix:6.2
LABEL maintainer='seerup@autobutler.dk'
ENV MIX_ENV dev

ENV app /version-warehouse
RUN mkdir -p $app
WORKDIR $app

COPY mix.exs mix.lock ./

ENV PATH ./bin:$PATH
RUN mix deps.get

COPY . $app

ENTRYPOINT ["./docker-entrypoint.sh"]
RUN chmod +x $app/docker-entrypoint.sh
