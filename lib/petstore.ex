defmodule Petstore do
  use Tesla.OpenApi, spec: "priv/specs/petstore.json", dump: "doc/petstore.ex"
end
