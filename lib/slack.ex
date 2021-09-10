defmodule Slack do
  use Tesla.OpenApi, spec: "priv/specs/slack.json", dump: "doc/slack.ex"
end
