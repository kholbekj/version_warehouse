# VersionWarehouse

### This service is made to offload main databases and applications from storing versions from the papertrail gem.

To start the service:

  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Start Phoenix endpoint with `mix phoenix.server`

OR use Docker

```
docker-compose build
docker-compose run --rm web mix deps.get
docker-compose run --rm web mix ecto.create
docker-compose run --rm web mix ecto.migrate
docker-compose up
```

Now you can query [`localhost:4000/api/versions`](http://localhost:4000/api/versions).

You can post to `api/versions`. Require fields are `item_type`, `item_id`, and `event`.
You can find all versions for an item by GET'ing `/api/versions?item_type=ClassName&item_id=1337`.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
