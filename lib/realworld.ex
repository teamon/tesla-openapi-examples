defmodule Realworld do
  use Tesla.OpenApi, spec: "priv/specs/realworld.json", dump: "doc/realworld.ex"
end
