defmodule(Petstore) do
  (
    @external_resource "priv/specs/petstore.json"
    @moduledoc "#{"Swagger Petstore"}
    
    #{nil}
    
    Version #{"1.0.0"}
    "
  )

  defmodule(Error) do
    @moduledoc "#{nil}
    "
    defstruct(code: nil, message: nil)
    @type t :: %__MODULE__{code: integer, message: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, code} <-
          case(data["code"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["code"]}}
          end,
        {:ok, message} <-
          case(data["message"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["message"]}}
          end
      ) do
        {:ok, %__MODULE__{code: code, message: message}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Error" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"code" => data.code, "message" => data.message}
    end
  end

  defmodule(Pet) do
    @moduledoc "#{nil}
    "
    defstruct(id: nil, name: nil, tag: nil)
    @type t :: %__MODULE__{id: integer, name: binary, tag: binary | nil}
    @doc false
    def(decode(data)) do
      with(
        {:ok, id} <-
          case(data["id"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["id"]}}
          end,
        {:ok, name} <-
          case(data["name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["name"]}}
          end,
        {:ok, tag} <-
          case(data["tag"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["tag"]}}
          end
      ) do
        {:ok, %__MODULE__{id: id, name: name, tag: tag}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Pet" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"id" => data.id, "name" => data.name, "tag" => data.tag}
    end
  end

  defmodule(Pets) do
    @type t :: [Petstore.Pet.t()]
    def(decode(items)) do
      items
      |> Enum.reverse()
      |> Enum.reduce({:ok, []}, fn
        data, {:ok, items} ->
          with({:ok, item} <- Petstore.Pet.decode(data)) do
            {:ok, [item | items]}
          end

        _, error ->
          error
      end)
    end
  end

  (
    @doc "#{"List all pets"}
    
    #{nil}
    
    #{"### Query parameters\n\n- `limit`: How many items to return at one time (max 100)\n"}
    
    #{""}
    "
    @spec list_pets(Tesla.Client.t(), [opt]) ::
            {:ok, [Petstore.Pet.t()]} | {:error, Petstore.Error.t()} | {:error, any}
          when opt: {:limit, integer}
    def(list_pets(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/pets",
          query: Tesla.OpenApi.encode_query(query, limit: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} when is_list(body) ->
          body
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Petstore.Pet.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Petstore.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(list_pets: 2)
  )

  (
    @doc "#{"Create a pet"}
    
    #{nil}
    
    #{""}
    
    #{""}
    "
    @spec create_pets(Tesla.Client.t()) :: :ok | {:error, Petstore.Error.t()} | {:error, any}
    def(create_pets(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/pets")) do
        {:ok, %{status: 201, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: body}} ->
          with({:ok, data} <- Petstore.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(create_pets: 1)
  )

  (
    @doc "#{"Info for a specific pet"}
    
    #{nil}
    
    #{""}
    
    #{""}
    "
    @spec show_pet_by_id(Tesla.Client.t(), binary) ::
            {:ok, [Petstore.Pet.t()]} | {:error, Petstore.Error.t()} | {:error, any}
    def(show_pet_by_id(client \\ new(), pet_id)) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/pets/:pet_id",
          opts: [path_params: [pet_id: pet_id]]
        )
      ) do
        {:ok, %{status: 200, body: body}} when is_list(body) ->
          body
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Petstore.Pet.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Petstore.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(show_pet_by_id: 2)
  )

  (
    @middleware [
      {Tesla.Middleware.BaseUrl, "http://petstore.swagger.io/v1"},
      Tesla.Middleware.PathParams,
      Tesla.Middleware.EncodeJson,
      Tesla.Middleware.DecodeJson,
      Tesla.Middleware.DecodeFormUrlencoded
    ]
    @doc "See `new/2`.\n"
    @spec new() :: Tesla.Client.t()
    def(new()) do
      new([], nil)
    end

    @doc "Get new API client instance\n"
    @spec new([Tesla.Client.middleware()], Tesla.Client.adapter()) :: Tesla.Client.t()
    def(new(middleware, adapter)) do
      Tesla.client(@middleware ++ middleware, adapter)
    end

    defoverridable(new: 0, new: 2)
  )
end