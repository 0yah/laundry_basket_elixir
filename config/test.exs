import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :laundry_basket, LaundryBasket.Repo,
  username: "postgres",
  password: "postgres",
  database: "laundry_basket_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :laundry_basket, LaundryBasketWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "rk8NL1U5sFRgyhUpJvCHkhS+P7HsFzGuCZmOPlc1cO2RIUWPT9uaQO6m2C9hs+r3",
  server: false

# In test we don't send emails.
config :laundry_basket, LaundryBasket.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
