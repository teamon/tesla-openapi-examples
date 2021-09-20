defmodule Docusign do
  use Tesla.OpenApi,
    spec: "priv/specs/docusign.json",
    definitions: [
      extra: %{
        # See https://github.com/docusign/OpenAPI-Specifications/issues/36
        "offlineAttributes" => %{
          "type" => "object"
        }
      }
    ],
    operations: [
      only: [
        :envelopes__post_envelopes,
        :envelopes__get_envelope,
        :views__post_envelope_recipient_view
      ]
    ],
    dump: "dump/docusign.exs"
end
