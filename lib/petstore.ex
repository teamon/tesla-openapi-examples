defmodule Petstore do
  use Tesla.OpenApi, spec: "priv/specs/petstore.json", dump: "dump/petstore.ex"
end
