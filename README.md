# Rom Example

## `.env`

```
IMGUR_CLIENT_ID: <fill>
IMGUR_CLIENT_SECRET: <fill>
DATABASE_URL: postgres://localhost/star_wars_development
```

## Migrations

```
sequel -m lib/migrations postgres://localhost/star_wars_development
```
