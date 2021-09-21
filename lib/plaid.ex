defmodule Plaid do
  use Tesla.OpenApi, spec: "priv/specs/plaid.json", dump: "dump/plaid.ex"
end
