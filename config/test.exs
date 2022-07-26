import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :gpx_phoenix, GpxPhoenix.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "gpx_phoenix_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :gpx_phoenix, GpxPhoenixWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "V4/1bk5DjpPY+ulC3WylPKVH/jmjAldx9kZl7w0mxE4XTiJVtnDO4JGhL8HWbT3S",
  server: false

# In test we don't send emails.
config :gpx_phoenix, GpxPhoenix.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
