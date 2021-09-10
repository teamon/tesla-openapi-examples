defmodule Slack do
  use Tesla.OpenApi, spec: "priv/specs/slack.json", dump: "dump/slack.ex"
end
