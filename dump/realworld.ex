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
      %__MODULE__{
        author: Realworld.Profile.decode(data["author"]),
        body: data["body"],
        created_at: data["createdAt"],
        description: data["description"],
        favorited: data["favorited"],
        favorites_count: data["favoritesCount"],
        slug: data["slug"],
        tag_list: Enum.map(data["tagList"], fn item -> item end),
        title: data["title"],
        updated_at: data["updatedAt"]
      }
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
      %__MODULE__{
        author: Realworld.Profile.decode(data["author"]),
        body: data["body"],
        created_at: data["createdAt"],
        id: data["id"],
        updated_at: data["updatedAt"]
      }
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
      %__MODULE__{errors: %{body: Enum.map(data["errors"]["body"], fn item -> item end)}}
    end

    @doc false
    def(encode(data)) do
      %{"errors" => %{body: Enum.map(data.errors["body"], fn item -> item end)}}
    end
  end

  defmodule(LoginUser) do
    @moduledoc "#{nil}
    "
    defstruct(email: nil, password: nil)
    @type t :: %__MODULE__{email: binary, password: binary}
    @doc false
    def(decode(data)) do
      %__MODULE__{email: data["email"], password: data["password"]}
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
      %__MODULE__{user: Realworld.LoginUser.decode(data["user"])}
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
      %__MODULE__{
        articles: Enum.map(data["articles"], fn item -> Realworld.Article.decode(item) end),
        articles_count: data["articlesCount"]
      }
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
      %__MODULE__{
        comments: Enum.map(data["comments"], fn item -> Realworld.Comment.decode(item) end)
      }
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
      %__MODULE__{
        body: data["body"],
        description: data["description"],
        tag_list:
          case(data["tagList"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["tagList"], fn item -> item end)
          end,
        title: data["title"]
      }
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
      %__MODULE__{article: Realworld.NewArticle.decode(data["article"])}
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
      %__MODULE__{body: data["body"]}
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
      %__MODULE__{comment: Realworld.NewComment.decode(data["comment"])}
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
      %__MODULE__{email: data["email"], password: data["password"], username: data["username"]}
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
      %__MODULE__{user: Realworld.NewUser.decode(data["user"])}
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
      %__MODULE__{
        bio: data["bio"],
        following: data["following"],
        image: data["image"],
        username: data["username"]
      }
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
      %__MODULE__{profile: Realworld.Profile.decode(data["profile"])}
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
      %__MODULE__{article: Realworld.Article.decode(data["article"])}
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
      %__MODULE__{comment: Realworld.Comment.decode(data["comment"])}
    end

    @doc false
    def(encode(data)) do
      %{"comment" => Realworld.Comment.encode(data.comment)}
    end
  end

  defmodule(TagsResponse) do
    @moduledoc "#{nil}
    "
    defstruct(tags: nil)
    @type t :: %__MODULE__{tags: [binary]}
    @doc false
    def(decode(data)) do
      %__MODULE__{tags: Enum.map(data["tags"], fn item -> item end)}
    end

    @doc false
    def(encode(data)) do
      %{
        "tags" =>
          case(data.tags) do
            nil ->
              nil

            _ ->
              Enum.map(data.tags, fn item -> item end)
          end
      }
    end
  end

  defmodule(UpdateArticle) do
    @moduledoc "#{nil}
    "
    defstruct(body: nil, description: nil, title: nil)
    @type t :: %__MODULE__{body: binary | nil, description: binary | nil, title: binary | nil}
    @doc false
    def(decode(data)) do
      %__MODULE__{body: data["body"], description: data["description"], title: data["title"]}
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
      %__MODULE__{article: Realworld.UpdateArticle.decode(data["article"])}
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
      %__MODULE__{
        bio: data["bio"],
        email: data["email"],
        image: data["image"],
        token: data["token"],
        username: data["username"]
      }
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
      %__MODULE__{user: Realworld.UpdateUser.decode(data["user"])}
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
      %__MODULE__{
        bio: data["bio"],
        email: data["email"],
        image: data["image"],
        token: data["token"],
        username: data["username"]
      }
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
      %__MODULE__{user: Realworld.User.decode(data["user"])}
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
          {:ok, Realworld.MultipleArticlesResponse.decode(body)}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          {:ok, Realworld.SingleArticleResponse.decode(body)}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          {:ok, Realworld.MultipleArticlesResponse.decode(body)}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          :ok

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          {:ok, Realworld.SingleArticleResponse.decode(body)}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          {:ok, Realworld.SingleArticleResponse.decode(body)}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          {:ok, Realworld.MultipleCommentsResponse.decode(body)}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          {:ok, Realworld.SingleCommentResponse.decode(body)}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          :ok

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          {:ok, Realworld.SingleArticleResponse.decode(body)}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          {:ok, Realworld.SingleArticleResponse.decode(body)}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          {:ok, Realworld.ProfileResponse.decode(body)}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          {:ok, Realworld.ProfileResponse.decode(body)}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          {:ok, Realworld.ProfileResponse.decode(body)}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          {:ok, Realworld.UserResponse.decode(body)}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          {:ok, Realworld.UserResponse.decode(body)}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          {:ok, Realworld.UserResponse.decode(body)}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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
          {:ok, Realworld.UserResponse.decode(body)}

        {:ok, %{status: 401, body: _any}} ->
          {:error, 401}

        {:ok, %{status: 422, body: body}} ->
          {:error, Realworld.GenericErrorModel.decode(body)}

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