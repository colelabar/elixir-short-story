use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :short_story, ShortStory.Endpoint,
  secret_key_base: "hokyLDUdIv/qTc5jcd0ar+XEbBxjwm9ZJpwLktjqTmto9gMboVeLQv5OHJbM/vBe"

# Configure your database
config :short_story, ShortStory.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "short_story_prod",
  pool_size: 20
