defmodule(Realworld) do
  (
    @external_resource "priv/specs/realworld.json"
    @moduledoc "#{"Conduit API"}
    
    #{"Conduit API"}
    
    Version #{"1.0.0"}
    "
  )

  defmodule(Article) do
    @moduledoc "#{nil}
    "
    defstruct(
      author: nil,
      body: nil,
      created_at: nil,
      description: nil,
      favorited: nil,
      favorites_count: nil,
      slug: nil,
      tag_list: nil,
      title: nil,
      updated_at: nil
    )

    @type t :: %__MODULE__{
            author: Realworld.Profile.t(),
            body: binary,
            created_at: binary,
            description: binary,
            favorited: boolean,
            favorites_count: integer,
            slug: binary,
            tag_list: [binary],
            title: binary,
            updated_at: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, author} <- Realworld.Profile.decode(data["author"]),
        {:ok, body} <-
          case(data["body"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["body"]}}
          end,
        {:ok, created_at} <-
          case(data["createdAt"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["createdAt"]}}
          end,
        {:ok, description} <-
          case(data["description"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["description"]}}
          end,
        {:ok, favorited} <-
          case(data["favorited"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["favorited"]}}
          end,
        {:ok, favorites_count} <-
          case(data["favoritesCount"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["favoritesCount"]}}
          end,
        {:ok, slug} <-
          case(data["slug"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["slug"]}}
          end,
        {:ok, tag_list} <-
          data["tagList"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with(
                {:ok, item} <-
                  case(data) do
                    x when is_binary(x) ->
                      {:ok, x}

                    x ->
                      {:error, {:decode, {:invalid_string, x}, [nil]}}
                  end
              ) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, title} <-
          case(data["title"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["title"]}}
          end,
        {:ok, updated_at} <-
          case(data["updatedAt"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["updatedAt"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           author: author,
           body: body,
           created_at: created_at,
           description: description,
           favorited: favorited,
           favorites_count: favorites_count,
           slug: slug,
           tag_list: tag_list,
           title: title,
           updated_at: updated_at
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Article" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "author" => Realworld.Profile.encode(data.author),
        "body" => data.body,
        "createdAt" => data.created_at,
        "description" => data.description,
        "favorited" => data.favorited,
        "favoritesCount" => data.favorites_count,
        "slug" => data.slug,
        "tagList" =>
          case(data.tag_list) do
            nil ->
              nil

            _ ->
              Enum.map(data.tag_list, fn item -> item end)
          end,
        "title" => data.title,
        "updatedAt" => data.updated_at
      }
    end
  end

  defmodule(Comment) do
    @moduledoc "#{nil}
    "
    defstruct(author: nil, body: nil, created_at: nil, id: nil, updated_at: nil)

    @type t :: %__MODULE__{
            author: Realworld.Profile.t(),
            body: binary,
            created_at: binary,
            id: integer,
            updated_at: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, author} <- Realworld.Profile.decode(data["author"]),
        {:ok, body} <-
          case(data["body"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["body"]}}
          end,
        {:ok, created_at} <-
          case(data["createdAt"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["createdAt"]}}
          end,
        {:ok, id} <-
          case(data["id"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["id"]}}
          end,
        {:ok, updated_at} <-
          case(data["updatedAt"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["updatedAt"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           author: author,
           body: body,
           created_at: created_at,
           id: id,
           updated_at: updated_at
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Comment" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "author" => Realworld.Profile.encode(data.author),
        "body" => data.body,
        "createdAt" => data.created_at,
        "id" => data.id,
        "updatedAt" => data.updated_at
      }
    end
  end

  defmodule(GenericErrorModel) do
    @moduledoc "#{nil}
    "
    defstruct(errors: nil)
    @type t :: %__MODULE__{errors: %{body: [binary]}}
    @doc false
    def(decode(data)) do
      with(
        {:ok, errors} <-
          with(
            {:ok, body} <-
              data["errors"]["body"]
              |> Enum.reverse()
              |> Enum.reduce({:ok, []}, fn
                data, {:ok, items} ->
                  with(
                    {:ok, item} <-
                      case(data) do
                        x when is_binary(x) ->
                          {:ok, x}

                        x ->
                          {:error, {:decode, {:invalid_string, x}, [nil]}}
                      end
                  ) do
                    {:ok, [item | items]}
                  end

                _, error ->
                  error
              end)
          ) do
            {:ok, %{body: body}}
          end
      ) do
        {:ok, %__MODULE__{errors: errors}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["GenericErrorModel" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "errors" => %{
          "body" =>
            case(data.errors.body) do
              nil ->
                nil

              _ ->
                Enum.map(data.errors.body, fn item -> item end)
            end
        }
      }
    end
  end

  defmodule(LoginUser) do
    @moduledoc "#{nil}
    "
    defstruct(email: nil, password: nil)
    @type t :: %__MODULE__{email: binary, password: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, email} <-
          case(data["email"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["email"]}}
          end,
        {:ok, password} <-
          case(data["password"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["password"]}}
          end
      ) do
        {:ok, %__MODULE__{email: email, password: password}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["LoginUser" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"email" => data.email, "password" => data.password}
    end
  end

  defmodule(LoginUserRequest) do
    @moduledoc "#{nil}
    "
    defstruct(user: nil)
    @type t :: %__MODULE__{user: Realworld.LoginUser.t()}
    @doc false
    def(decode(data)) do
      with({:ok, user} <- Realworld.LoginUser.decode(data["user"])) do
        {:ok, %__MODULE__{user: user}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["LoginUserRequest" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"user" => Realworld.LoginUser.encode(data.user)}
    end
  end

  defmodule(MultipleArticlesResponse) do
    @moduledoc "#{nil}
    "
    defstruct(articles: nil, articles_count: nil)
    @type t :: %__MODULE__{articles: [Realworld.Article.t()], articles_count: integer}
    @doc false
    def(decode(data)) do
      with(
        {:ok, articles} <-
          data["articles"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Realworld.Article.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, articles_count} <-
          case(data["articlesCount"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["articlesCount"]}}
          end
      ) do
        {:ok, %__MODULE__{articles: articles, articles_count: articles_count}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["MultipleArticlesResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "articles" =>
          case(data.articles) do
            nil ->
              nil

            _ ->
              Enum.map(data.articles, fn item -> Realworld.Article.encode(item) end)
          end,
        "articlesCount" => data.articles_count
      }
    end
  end

  defmodule(MultipleCommentsResponse) do
    @moduledoc "#{nil}
    "
    defstruct(comments: nil)
    @type t :: %__MODULE__{comments: [Realworld.Comment.t()]}
    @doc false
    def(decode(data)) do
      with(
        {:ok, comments} <-
          data["comments"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Realworld.Comment.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok, %__MODULE__{comments: comments}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["MultipleCommentsResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "comments" =>
          case(data.comments) do
            nil ->
              nil

            _ ->
              Enum.map(data.comments, fn item -> Realworld.Comment.encode(item) end)
          end
      }
    end
  end

  defmodule(NewArticle) do
    @moduledoc "#{nil}
    "
    defstruct(body: nil, description: nil, tag_list: nil, title: nil)

    @type t :: %__MODULE__{
            body: binary,
            description: binary,
            tag_list: [binary] | nil,
            title: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, body} <-
          case(data["body"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["body"]}}
          end,
        {:ok, description} <-
          case(data["description"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["description"]}}
          end,
        {:ok, tag_list} <-
          case(data["tagList"]) do
            nil ->
              nil

            _ ->
              data["tagList"]
              |> Enum.reverse()
              |> Enum.reduce({:ok, []}, fn
                data, {:ok, items} ->
                  with(
                    {:ok, item} <-
                      case(data) do
                        x when is_binary(x) ->
                          {:ok, x}

                        x ->
                          {:error, {:decode, {:invalid_string, x}, [nil]}}
                      end
                  ) do
                    {:ok, [item | items]}
                  end

                _, error ->
                  error
              end)
          end,
        {:ok, title} <-
          case(data["title"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["title"]}}
          end
      ) do
        {:ok, %__MODULE__{body: body, description: description, tag_list: tag_list, title: title}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["NewArticle" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "body" => data.body,
        "description" => data.description,
        "tagList" =>
          case(data.tag_list) do
            nil ->
              nil

            _ ->
              Enum.map(data.tag_list, fn item -> item end)
          end,
        "title" => data.title
      }
    end
  end

  defmodule(NewArticleRequest) do
    @moduledoc "#{nil}
    "
    defstruct(article: nil)
    @type t :: %__MODULE__{article: Realworld.NewArticle.t()}
    @doc false
    def(decode(data)) do
      with({:ok, article} <- Realworld.NewArticle.decode(data["article"])) do
        {:ok, %__MODULE__{article: article}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["NewArticleRequest" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"article" => Realworld.NewArticle.encode(data.article)}
    end
  end

  defmodule(NewComment) do
    @moduledoc "#{nil}
    "
    defstruct(body: nil)
    @type t :: %__MODULE__{body: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, body} <-
          case(data["body"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["body"]}}
          end
      ) do
        {:ok, %__MODULE__{body: body}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["NewComment" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"body" => data.body}
    end
  end

  defmodule(NewCommentRequest) do
    @moduledoc "#{nil}
    "
    defstruct(comment: nil)
    @type t :: %__MODULE__{comment: Realworld.NewComment.t()}
    @doc false
    def(decode(data)) do
      with({:ok, comment} <- Realworld.NewComment.decode(data["comment"])) do
        {:ok, %__MODULE__{comment: comment}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["NewCommentRequest" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"comment" => Realworld.NewComment.encode(data.comment)}
    end
  end

  defmodule(NewUser) do
    @moduledoc "#{nil}
    "
    defstruct(email: nil, password: nil, username: nil)
    @type t :: %__MODULE__{email: binary, password: binary, username: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, email} <-
          case(data["email"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["email"]}}
          end,
        {:ok, password} <-
          case(data["password"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["password"]}}
          end,
        {:ok, username} <-
          case(data["username"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["username"]}}
          end
      ) do
        {:ok, %__MODULE__{email: email, password: password, username: username}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["NewUser" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"email" => data.email, "password" => data.password, "username" => data.username}
    end
  end

  defmodule(NewUserRequest) do
    @moduledoc "#{nil}
    "
    defstruct(user: nil)
    @type t :: %__MODULE__{user: Realworld.NewUser.t()}
    @doc false
    def(decode(data)) do
      with({:ok, user} <- Realworld.NewUser.decode(data["user"])) do
        {:ok, %__MODULE__{user: user}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["NewUserRequest" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"user" => Realworld.NewUser.encode(data.user)}
    end
  end

  defmodule(Profile) do
    @moduledoc "#{nil}
    "
    defstruct(bio: nil, following: nil, image: nil, username: nil)
    @type t :: %__MODULE__{bio: binary, following: boolean, image: binary, username: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, bio} <-
          case(data["bio"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["bio"]}}
          end,
        {:ok, following} <-
          case(data["following"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["following"]}}
          end,
        {:ok, image} <-
          case(data["image"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["image"]}}
          end,
        {:ok, username} <-
          case(data["username"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["username"]}}
          end
      ) do
        {:ok, %__MODULE__{bio: bio, following: following, image: image, username: username}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Profile" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "bio" => data.bio,
        "following" => data.following,
        "image" => data.image,
        "username" => data.username
      }
    end
  end

  defmodule(ProfileResponse) do
    @moduledoc "#{nil}
    "
    defstruct(profile: nil)
    @type t :: %__MODULE__{profile: Realworld.Profile.t()}
    @doc false
    def(decode(data)) do
      with({:ok, profile} <- Realworld.Profile.decode(data["profile"])) do
        {:ok, %__MODULE__{profile: profile}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ProfileResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"profile" => Realworld.Profile.encode(data.profile)}
    end
  end

  defmodule(SingleArticleResponse) do
    @moduledoc "#{nil}
    "
    defstruct(article: nil)
    @type t :: %__MODULE__{article: Realworld.Article.t()}
    @doc false
    def(decode(data)) do
      with({:ok, article} <- Realworld.Article.decode(data["article"])) do
        {:ok, %__MODULE__{article: article}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SingleArticleResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"article" => Realworld.Article.encode(data.article)}
    end
  end

  defmodule(SingleCommentResponse) do
    @moduledoc "#{nil}
    "
    defstruct(comment: nil)
    @type t :: %__MODULE__{comment: Realworld.Comment.t()}
    @doc false
    def(decode(data)) do
      with({:ok, comment} <- Realworld.Comment.decode(data["comment"])) do
        {:ok, %__MODULE__{comment: comment}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SingleCommentResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"comment" => Realworld.Comment.encode(data.comment)}
    end
  end

  defmodule(UpdateArticle) do
    @moduledoc "#{nil}
    "
    defstruct(body: nil, description: nil, title: nil)
    @type t :: %__MODULE__{body: binary | nil, description: binary | nil, title: binary | nil}
    @doc false
    def(decode(data)) do
      with(
        {:ok, body} <-
          case(data["body"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["body"]}}
          end,
        {:ok, description} <-
          case(data["description"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["description"]}}
          end,
        {:ok, title} <-
          case(data["title"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["title"]}}
          end
      ) do
        {:ok, %__MODULE__{body: body, description: description, title: title}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["UpdateArticle" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"body" => data.body, "description" => data.description, "title" => data.title}
    end
  end

  defmodule(UpdateArticleRequest) do
    @moduledoc "#{nil}
    "
    defstruct(article: nil)
    @type t :: %__MODULE__{article: Realworld.UpdateArticle.t()}
    @doc false
    def(decode(data)) do
      with({:ok, article} <- Realworld.UpdateArticle.decode(data["article"])) do
        {:ok, %__MODULE__{article: article}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["UpdateArticleRequest" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"article" => Realworld.UpdateArticle.encode(data.article)}
    end
  end

  defmodule(UpdateUser) do
    @moduledoc "#{nil}
    "
    defstruct(bio: nil, email: nil, image: nil, token: nil, username: nil)

    @type t :: %__MODULE__{
            bio: binary | nil,
            email: binary | nil,
            image: binary | nil,
            token: binary | nil,
            username: binary | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, bio} <-
          case(data["bio"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["bio"]}}
          end,
        {:ok, email} <-
          case(data["email"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["email"]}}
          end,
        {:ok, image} <-
          case(data["image"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["image"]}}
          end,
        {:ok, token} <-
          case(data["token"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["token"]}}
          end,
        {:ok, username} <-
          case(data["username"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["username"]}}
          end
      ) do
        {:ok, %__MODULE__{bio: bio, email: email, image: image, token: token, username: username}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["UpdateUser" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "bio" => data.bio,
        "email" => data.email,
        "image" => data.image,
        "token" => data.token,
        "username" => data.username
      }
    end
  end

  defmodule(UpdateUserRequest) do
    @moduledoc "#{nil}
    "
    defstruct(user: nil)
    @type t :: %__MODULE__{user: Realworld.UpdateUser.t()}
    @doc false
    def(decode(data)) do
      with({:ok, user} <- Realworld.UpdateUser.decode(data["user"])) do
        {:ok, %__MODULE__{user: user}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["UpdateUserRequest" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"user" => Realworld.UpdateUser.encode(data.user)}
    end
  end

  defmodule(User) do
    @moduledoc "#{nil}
    "
    defstruct(bio: nil, email: nil, image: nil, token: nil, username: nil)

    @type t :: %__MODULE__{
            bio: binary,
            email: binary,
            image: binary,
            token: binary,
            username: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, bio} <-
          case(data["bio"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["bio"]}}
          end,
        {:ok, email} <-
          case(data["email"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["email"]}}
          end,
        {:ok, image} <-
          case(data["image"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["image"]}}
          end,
        {:ok, token} <-
          case(data["token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["token"]}}
          end,
        {:ok, username} <-
          case(data["username"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["username"]}}
          end
      ) do
        {:ok, %__MODULE__{bio: bio, email: email, image: image, token: token, username: username}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["User" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "bio" => data.bio,
        "email" => data.email,
        "image" => data.image,
        "token" => data.token,
        "username" => data.username
      }
    end
  end

  defmodule(UserResponse) do
    @moduledoc "#{nil}
    "
    defstruct(user: nil)
    @type t :: %__MODULE__{user: Realworld.User.t()}
    @doc false
    def(decode(data)) do
      with({:ok, user} <- Realworld.User.decode(data["user"])) do
        {:ok, %__MODULE__{user: user}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["UserResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"user" => Realworld.User.encode(data.user)}
    end
  end

  (
    @doc "#{"Get recent articles globally"}
    
    #{"Get most recent articles globally. Use query parameters to filter results. Auth is optional"}
    
    #{"### Query parameters\n\n- `tag`: Filter by tag\n- `author`: Filter by author (username)\n- `favorited`: Filter by favorites of a user (username)\n- `limit`: Limit number of articles returned (default is 20)\n- `offset`: Offset/skip number of articles (default is 0)\n"}
    
    #{""}
    "
    @spec get_articles(Tesla.Client.t(), [opt]) ::
            {:ok, Realworld.MultipleArticlesResponse.t()}
            | {:error, integer}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
          when opt:
                 {:tag, binary}
                 | {:author, binary}
                 | {:favorited, binary}
                 | {:limit, integer}
                 | {:offset, integer}
    def(get_articles(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/articles",
          query:
            Tesla.OpenApi.encode_query(query,
              tag: nil,
              author: nil,
              favorited: nil,
              limit: nil,
              offset: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          Realworld.MultipleArticlesResponse.decode(body)

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(get_articles: 2)
  )

  (
    @doc "#{"Create an article"}
    
    #{"Create an article. Auth is required"}
    
    #{""}
    
    #{""}
    "
    @spec create_article(Tesla.Client.t(), Realworld.NewArticleRequest.t()) ::
            {:ok, Realworld.SingleArticleResponse.t()}
            | {:error, integer}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
    def(create_article(client \\ new(), article)) do
      case(
        Tesla.request(client,
          method: :post,
          url: "/articles",
          body: Realworld.NewArticleRequest.encode(article)
        )
      ) do
        {:ok, %{status: 201, body: body}} ->
          Realworld.SingleArticleResponse.decode(body)

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(create_article: 2)
  )

  (
    @doc "#{"Get recent articles from users you follow"}
    
    #{"Get most recent articles from users you follow. Use query parameters to limit. Auth is required"}
    
    #{"### Query parameters\n\n- `limit`: Limit number of articles returned (default is 20)\n- `offset`: Offset/skip number of articles (default is 0)\n"}
    
    #{""}
    "
    @spec get_articles_feed(Tesla.Client.t(), [opt]) ::
            {:ok, Realworld.MultipleArticlesResponse.t()}
            | {:error, integer}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
          when opt: {:limit, integer} | {:offset, integer}
    def(get_articles_feed(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/articles/feed",
          query: Tesla.OpenApi.encode_query(query, limit: nil, offset: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          Realworld.MultipleArticlesResponse.decode(body)

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(get_articles_feed: 2)
  )

  (
    @doc "#{"Delete an article"}
    
    #{"Delete an article. Auth is required"}
    
    #{""}
    
    #{""}
    "
    @spec delete_article(Tesla.Client.t(), binary) ::
            :ok | {:error, integer} | {:error, Realworld.GenericErrorModel.t()} | {:error, any}
    def(delete_article(client \\ new(), slug)) do
      case(
        Tesla.request(client,
          method: :delete,
          url: "/articles/:slug",
          opts: [path_params: [slug: slug]]
        )
      ) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(delete_article: 2)
  )

  (
    @doc "#{"Get an article"}
    
    #{"Get an article. Auth not required"}
    
    #{""}
    
    #{""}
    "
    @spec get_article(Tesla.Client.t(), binary) ::
            {:ok, Realworld.SingleArticleResponse.t()}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
    def(get_article(client \\ new(), slug)) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/articles/:slug",
          opts: [path_params: [slug: slug]]
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          Realworld.SingleArticleResponse.decode(body)

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(get_article: 2)
  )

  (
    @doc "#{"Update an article"}
    
    #{"Update an article. Auth is required"}
    
    #{""}
    
    #{""}
    "
    @spec update_article(Tesla.Client.t(), binary, Realworld.UpdateArticleRequest.t()) ::
            {:ok, Realworld.SingleArticleResponse.t()}
            | {:error, integer}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
    def(update_article(client \\ new(), slug, article)) do
      case(
        Tesla.request(client,
          method: :put,
          url: "/articles/:slug",
          opts: [path_params: [slug: slug]],
          body: Realworld.UpdateArticleRequest.encode(article)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          Realworld.SingleArticleResponse.decode(body)

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(update_article: 3)
  )

  (
    @doc "#{"Get comments for an article"}
    
    #{"Get the comments for an article. Auth is optional"}
    
    #{""}
    
    #{""}
    "
    @spec get_article_comments(Tesla.Client.t(), binary) ::
            {:ok, Realworld.MultipleCommentsResponse.t()}
            | {:error, integer}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
    def(get_article_comments(client \\ new(), slug)) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/articles/:slug/comments",
          opts: [path_params: [slug: slug]]
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          Realworld.MultipleCommentsResponse.decode(body)

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(get_article_comments: 2)
  )

  (
    @doc "#{"Create a comment for an article"}
    
    #{"Create a comment for an article. Auth is required"}
    
    #{""}
    
    #{""}
    "
    @spec create_article_comment(Tesla.Client.t(), binary, Realworld.NewCommentRequest.t()) ::
            {:ok, Realworld.SingleCommentResponse.t()}
            | {:error, integer}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
    def(create_article_comment(client \\ new(), slug, comment)) do
      case(
        Tesla.request(client,
          method: :post,
          url: "/articles/:slug/comments",
          opts: [path_params: [slug: slug]],
          body: Realworld.NewCommentRequest.encode(comment)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          Realworld.SingleCommentResponse.decode(body)

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(create_article_comment: 3)
  )

  (
    @doc "#{"Delete a comment for an article"}
    
    #{"Delete a comment for an article. Auth is required"}
    
    #{""}
    
    #{""}
    "
    @spec delete_article_comment(Tesla.Client.t(), binary, integer) ::
            :ok | {:error, integer} | {:error, Realworld.GenericErrorModel.t()} | {:error, any}
    def(delete_article_comment(client \\ new(), slug, id)) do
      case(
        Tesla.request(client,
          method: :delete,
          url: "/articles/:slug/comments/:id",
          opts: [path_params: [slug: slug, id: id]]
        )
      ) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(delete_article_comment: 3)
  )

  (
    @doc "#{"Unfavorite an article"}
    
    #{"Unfavorite an article. Auth is required"}
    
    #{""}
    
    #{""}
    "
    @spec delete_article_favorite(Tesla.Client.t(), binary) ::
            {:ok, Realworld.SingleArticleResponse.t()}
            | {:error, integer}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
    def(delete_article_favorite(client \\ new(), slug)) do
      case(
        Tesla.request(client,
          method: :delete,
          url: "/articles/:slug/favorite",
          opts: [path_params: [slug: slug]]
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          Realworld.SingleArticleResponse.decode(body)

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(delete_article_favorite: 2)
  )

  (
    @doc "#{"Favorite an article"}
    
    #{"Favorite an article. Auth is required"}
    
    #{""}
    
    #{""}
    "
    @spec create_article_favorite(Tesla.Client.t(), binary) ::
            {:ok, Realworld.SingleArticleResponse.t()}
            | {:error, integer}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
    def(create_article_favorite(client \\ new(), slug)) do
      case(
        Tesla.request(client,
          method: :post,
          url: "/articles/:slug/favorite",
          opts: [path_params: [slug: slug]]
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          Realworld.SingleArticleResponse.decode(body)

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(create_article_favorite: 2)
  )

  (
    @doc "#{"Get a profile"}
    
    #{"Get a profile of a user of the system. Auth is optional"}
    
    #{""}
    
    #{""}
    "
    @spec get_profile_by_username(Tesla.Client.t(), binary) ::
            {:ok, Realworld.ProfileResponse.t()}
            | {:error, integer}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
    def(get_profile_by_username(client \\ new(), username)) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/profiles/:username",
          opts: [path_params: [username: username]]
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          Realworld.ProfileResponse.decode(body)

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(get_profile_by_username: 2)
  )

  (
    @doc "#{"Unfollow a user"}
    
    #{"Unfollow a user by username"}
    
    #{""}
    
    #{""}
    "
    @spec unfollow_user_by_username(Tesla.Client.t(), binary) ::
            {:ok, Realworld.ProfileResponse.t()}
            | {:error, integer}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
    def(unfollow_user_by_username(client \\ new(), username)) do
      case(
        Tesla.request(client,
          method: :delete,
          url: "/profiles/:username/follow",
          opts: [path_params: [username: username]]
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          Realworld.ProfileResponse.decode(body)

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(unfollow_user_by_username: 2)
  )

  (
    @doc "#{"Follow a user"}
    
    #{"Follow a user by username"}
    
    #{""}
    
    #{""}
    "
    @spec follow_user_by_username(Tesla.Client.t(), binary) ::
            {:ok, Realworld.ProfileResponse.t()}
            | {:error, integer}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
    def(follow_user_by_username(client \\ new(), username)) do
      case(
        Tesla.request(client,
          method: :post,
          url: "/profiles/:username/follow",
          opts: [path_params: [username: username]]
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          Realworld.ProfileResponse.decode(body)

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(follow_user_by_username: 2)
  )

  (
    @doc "#{"Get current user"}
    
    #{"Gets the currently logged-in user"}
    
    #{""}
    
    #{""}
    "
    @spec get_current_user(Tesla.Client.t()) ::
            {:ok, Realworld.UserResponse.t()}
            | {:error, integer}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
    def(get_current_user(client \\ new())) do
      case(Tesla.request(client, method: :get, url: "/user")) do
        {:ok, %{status: 200, body: body}} ->
          Realworld.UserResponse.decode(body)

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(get_current_user: 1)
  )

  (
    @doc "#{"Update current user"}
    
    #{"Updated user information for current user"}
    
    #{""}
    
    #{""}
    "
    @spec update_current_user(Tesla.Client.t(), Realworld.UpdateUserRequest.t()) ::
            {:ok, Realworld.UserResponse.t()}
            | {:error, integer}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
    def(update_current_user(client \\ new(), body)) do
      case(
        Tesla.request(client,
          method: :put,
          url: "/user",
          body: Realworld.UpdateUserRequest.encode(body)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          Realworld.UserResponse.decode(body)

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(update_current_user: 2)
  )

  (
    @doc "#{"Register a new user"}
    
    #{"Register a new user"}
    
    #{""}
    
    #{""}
    "
    @spec create_user(Tesla.Client.t(), Realworld.NewUserRequest.t()) ::
            {:ok, Realworld.UserResponse.t()}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
    def(create_user(client \\ new(), body)) do
      case(
        Tesla.request(client,
          method: :post,
          url: "/users",
          body: Realworld.NewUserRequest.encode(body)
        )
      ) do
        {:ok, %{status: 201, body: body}} ->
          Realworld.UserResponse.decode(body)

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(create_user: 2)
  )

  (
    @doc "#{"Existing user login"}
    
    #{"Login for existing user"}
    
    #{""}
    
    #{""}
    "
    @spec login(Tesla.Client.t(), Realworld.LoginUserRequest.t()) ::
            {:ok, Realworld.UserResponse.t()}
            | {:error, integer}
            | {:error, Realworld.GenericErrorModel.t()}
            | {:error, any}
    def(login(client \\ new(), body)) do
      case(
        Tesla.request(client,
          method: :post,
          url: "/users/login",
          body: Realworld.LoginUserRequest.encode(body)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          Realworld.UserResponse.decode(body)

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          with({:ok, data} <- Realworld.GenericErrorModel.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(login: 2)
  )

  (
    @middleware [
      {Tesla.Middleware.BaseUrl, "/api"},
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