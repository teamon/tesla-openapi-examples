defmodule Realworld do
  use Tesla.OpenApi, spec: "priv/specs/realworld.json", dump: "dump/realworld.ex"
end
