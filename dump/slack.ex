defmodule(Slack) do
  (
    @external_resource "priv/specs/slack.json"
    @moduledoc "#{"Slack Web API"}
    
    #{"One way to interact with the Slack platform is its HTTP RPC-based Web API, a collection of methods requiring OAuth 2.0-based user, bot, or workspace tokens blessed with related OAuth scopes."}
    
    Version #{"1.7.0"}
    "
  )

  @type defs_enterprise_user_id :: binary
  @type defs_ts :: binary
  @type defs_enterprise_id :: binary
  defmodule(ObjsPaging) do
    @moduledoc "#{"paging object"}
    "
    defstruct(count: nil, page: nil, pages: nil, per_page: nil, spill: nil, total: nil)

    @type t :: %__MODULE__{
            count: integer | nil,
            page: integer,
            pages: integer | nil,
            per_page: integer | nil,
            spill: integer | nil,
            total: integer
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        count: data["count"],
        page: data["page"],
        pages: data["pages"],
        per_page: data["per_page"],
        spill: data["spill"],
        total: data["total"]
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "count" => data.count,
        "page" => data.page,
        "pages" => data.pages,
        "per_page" => data.per_page,
        "spill" => data.spill,
        "total" => data.total
      }
    end
  end

  @type objs_comments :: list
  defmodule(ObjsUserProfile) do
    @moduledoc "#{"User profile object"}
    "
    defstruct(
      guest_invited_by: nil,
      pronouns: nil,
      last_name: nil,
      name: nil,
      image_1024: nil,
      bot_id: nil,
      first_name: nil,
      status_text: nil,
      status_default_text: nil,
      email: nil,
      display_name: nil,
      real_name_normalized: nil,
      image_original: nil,
      image_32: nil,
      image_48: nil,
      fields: nil,
      image_72: nil,
      updated: nil,
      username: nil,
      team: nil,
      image_192: nil,
      memberships_count: nil,
      user_id: nil,
      is_custom_image: nil,
      image_24: nil,
      phone: nil,
      api_app_id: nil,
      display_name_normalized: nil,
      last_avatar_image_hash: nil,
      status_expiration: nil,
      image_512: nil,
      skype: nil,
      is_app_user: nil,
      status_default_text_canonical: nil,
      avatar_hash: nil,
      is_ultra_restricted: nil,
      status_emoji: nil,
      always_active: nil,
      real_name: nil,
      status_default_emoji: nil,
      is_restricted: nil,
      status_text_canonical: nil,
      title: nil,
      guest_expiration_ts: nil
    )

    @type t :: %__MODULE__{
            guest_invited_by: binary | nil,
            pronouns: binary | nil,
            last_name: binary | nil,
            name: binary | nil,
            image_1024: binary | nil,
            bot_id: binary | nil,
            first_name: binary | nil,
            status_text: binary,
            status_default_text: binary | nil,
            email: binary | nil,
            display_name: binary,
            real_name_normalized: binary,
            image_original: binary | nil,
            image_32: binary | nil,
            image_48: binary | nil,
            fields: [%{}],
            image_72: binary | nil,
            updated: integer | nil,
            username: binary | nil,
            team: binary | nil,
            image_192: binary | nil,
            memberships_count: integer | nil,
            user_id: binary | nil,
            is_custom_image: boolean | nil,
            image_24: binary | nil,
            phone: binary,
            api_app_id: binary | nil,
            display_name_normalized: binary,
            last_avatar_image_hash: binary | nil,
            status_expiration: integer | nil,
            image_512: binary | nil,
            skype: binary,
            is_app_user: boolean | nil,
            status_default_text_canonical: binary | nil,
            avatar_hash: binary,
            is_ultra_restricted: boolean | nil,
            status_emoji: binary,
            always_active: boolean | nil,
            real_name: binary,
            status_default_emoji: binary | nil,
            is_restricted: boolean | nil,
            status_text_canonical: binary | nil,
            title: binary,
            guest_expiration_ts: integer | nil
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        guest_invited_by: data["guest_invited_by"],
        pronouns: data["pronouns"],
        last_name: data["last_name"],
        name: data["name"],
        image_1024: data["image_1024"],
        bot_id: data["bot_id"],
        first_name: data["first_name"],
        status_text: data["status_text"],
        status_default_text: data["status_default_text"],
        email: data["email"],
        display_name: data["display_name"],
        real_name_normalized: data["real_name_normalized"],
        image_original: data["image_original"],
        image_32: data["image_32"],
        image_48: data["image_48"],
        fields: data["fields"],
        image_72: data["image_72"],
        updated: data["updated"],
        username: data["username"],
        team: data["team"],
        image_192: data["image_192"],
        memberships_count: data["memberships_count"],
        user_id: data["user_id"],
        is_custom_image: data["is_custom_image"],
        image_24: data["image_24"],
        phone: data["phone"],
        api_app_id: data["api_app_id"],
        display_name_normalized: data["display_name_normalized"],
        last_avatar_image_hash: data["last_avatar_image_hash"],
        status_expiration: data["status_expiration"],
        image_512: data["image_512"],
        skype: data["skype"],
        is_app_user: data["is_app_user"],
        status_default_text_canonical: data["status_default_text_canonical"],
        avatar_hash: data["avatar_hash"],
        is_ultra_restricted: data["is_ultra_restricted"],
        status_emoji: data["status_emoji"],
        always_active: data["always_active"],
        real_name: data["real_name"],
        status_default_emoji: data["status_default_emoji"],
        is_restricted: data["is_restricted"],
        status_text_canonical: data["status_text_canonical"],
        title: data["title"],
        guest_expiration_ts: data["guest_expiration_ts"]
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "guest_invited_by" => data.guest_invited_by,
        "pronouns" => data.pronouns,
        "last_name" => data.last_name,
        "name" => data.name,
        "image_1024" => data.image_1024,
        "bot_id" => data.bot_id,
        "first_name" => data.first_name,
        "status_text" => data.status_text,
        "status_default_text" => data.status_default_text,
        "email" => data.email,
        "display_name" => data.display_name,
        "real_name_normalized" => data.real_name_normalized,
        "image_original" => data.image_original,
        "image_32" => data.image_32,
        "image_48" => data.image_48,
        "fields" => data.fields,
        "image_72" => data.image_72,
        "updated" => data.updated,
        "username" => data.username,
        "team" => data.team,
        "image_192" => data.image_192,
        "memberships_count" => data.memberships_count,
        "user_id" => data.user_id,
        "is_custom_image" => data.is_custom_image,
        "image_24" => data.image_24,
        "phone" => data.phone,
        "api_app_id" => data.api_app_id,
        "display_name_normalized" => data.display_name_normalized,
        "last_avatar_image_hash" => data.last_avatar_image_hash,
        "status_expiration" => data.status_expiration,
        "image_512" => data.image_512,
        "skype" => data.skype,
        "is_app_user" => data.is_app_user,
        "status_default_text_canonical" => data.status_default_text_canonical,
        "avatar_hash" => data.avatar_hash,
        "is_ultra_restricted" => data.is_ultra_restricted,
        "status_emoji" => data.status_emoji,
        "always_active" => data.always_active,
        "real_name" => data.real_name,
        "status_default_emoji" => data.status_default_emoji,
        "is_restricted" => data.is_restricted,
        "status_text_canonical" => data.status_text_canonical,
        "title" => data.title,
        "guest_expiration_ts" => data.guest_expiration_ts
      }
    end
  end

  nil
  @type defs_channel :: binary
  defmodule(ObjsSubteam) do
    @moduledoc "#{"Subteam/Usergroup Object"}
    "
    defstruct(
      auto_provision: nil,
      auto_type: nil,
      channel_count: nil,
      created_by: nil,
      date_create: nil,
      date_delete: nil,
      date_update: nil,
      deleted_by: nil,
      description: nil,
      enterprise_subteam_id: nil,
      handle: nil,
      id: nil,
      is_external: nil,
      is_subteam: nil,
      is_usergroup: nil,
      name: nil,
      prefs: nil,
      team_id: nil,
      updated_by: nil,
      user_count: nil,
      users: nil
    )

    @type t :: %__MODULE__{
            auto_provision: boolean,
            auto_type: binary,
            channel_count: integer | nil,
            created_by: binary,
            date_create: integer,
            date_delete: integer,
            date_update: integer,
            deleted_by: binary,
            description: binary,
            enterprise_subteam_id: binary,
            handle: binary,
            id: binary,
            is_external: boolean,
            is_subteam: boolean,
            is_usergroup: boolean,
            name: binary,
            prefs: %{channels: [binary], groups: [binary]},
            team_id: binary,
            updated_by: binary,
            user_count: integer | nil,
            users: [binary] | nil
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        auto_provision: data["auto_provision"],
        auto_type: data["auto_type"],
        channel_count: data["channel_count"],
        created_by: data["created_by"],
        date_create: data["date_create"],
        date_delete: data["date_delete"],
        date_update: data["date_update"],
        deleted_by: data["deleted_by"],
        description: data["description"],
        enterprise_subteam_id: data["enterprise_subteam_id"],
        handle: data["handle"],
        id: data["id"],
        is_external: data["is_external"],
        is_subteam: data["is_subteam"],
        is_usergroup: data["is_usergroup"],
        name: data["name"],
        prefs: %{
          channels: Enum.map(data["prefs"]["channels"], fn item -> item end),
          groups: Enum.map(data["prefs"]["groups"], fn item -> item end)
        },
        team_id: data["team_id"],
        updated_by: data["updated_by"],
        user_count: data["user_count"],
        users:
          case(data["users"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["users"], fn item -> item end)
          end
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "auto_provision" => data.auto_provision,
        "auto_type" => data.auto_type,
        "channel_count" => data.channel_count,
        "created_by" => data.created_by,
        "date_create" => data.date_create,
        "date_delete" => data.date_delete,
        "date_update" => data.date_update,
        "deleted_by" => data.deleted_by,
        "description" => data.description,
        "enterprise_subteam_id" => data.enterprise_subteam_id,
        "handle" => data.handle,
        "id" => data.id,
        "is_external" => data.is_external,
        "is_subteam" => data.is_subteam,
        "is_usergroup" => data.is_usergroup,
        "name" => data.name,
        "prefs" => %{
          channels: Enum.map(data.prefs["channels"], fn item -> item end),
          groups: Enum.map(data.prefs["groups"], fn item -> item end)
        },
        "team_id" => data.team_id,
        "updated_by" => data.updated_by,
        "user_count" => data.user_count,
        "users" =>
          case(data.users) do
            nil ->
              nil

            _ ->
              Enum.map(data.users, fn item -> item end)
          end
      }
    end
  end

  defmodule(Blocks) do
    @type t :: [%{type: binary}]
    def(decode(items)) do
      Enum.map(items, fn item -> %{type: item["type"]} end)
    end
  end

  @type defs_team :: binary
  @type defs_workspace_id :: binary
  @type defs_group_id :: binary
  defmodule(ObjsReminder) do
    @moduledoc "#{nil}
    "
    defstruct(
      complete_ts: nil,
      creator: nil,
      id: nil,
      recurring: nil,
      text: nil,
      time: nil,
      user: nil
    )

    @type t :: %__MODULE__{
            complete_ts: integer | nil,
            creator: binary,
            id: binary,
            recurring: boolean,
            text: binary,
            time: integer | nil,
            user: binary
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        complete_ts: data["complete_ts"],
        creator: data["creator"],
        id: data["id"],
        recurring: data["recurring"],
        text: data["text"],
        time: data["time"],
        user: data["user"]
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "complete_ts" => data.complete_ts,
        "creator" => data.creator,
        "id" => data.id,
        "recurring" => data.recurring,
        "text" => data.text,
        "time" => data.time,
        "user" => data.user
      }
    end
  end

  defmodule(ObjsUserProfileShort) do
    @moduledoc "#{nil}
    "
    defstruct(
      avatar_hash: nil,
      display_name: nil,
      display_name_normalized: nil,
      first_name: nil,
      image_72: nil,
      is_restricted: nil,
      is_ultra_restricted: nil,
      name: nil,
      real_name: nil,
      real_name_normalized: nil,
      team: nil
    )

    @type t :: %__MODULE__{
            avatar_hash: binary,
            display_name: binary,
            display_name_normalized: binary | nil,
            first_name: binary,
            image_72: binary,
            is_restricted: boolean,
            is_ultra_restricted: boolean,
            name: binary,
            real_name: binary,
            real_name_normalized: binary | nil,
            team: binary
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        avatar_hash: data["avatar_hash"],
        display_name: data["display_name"],
        display_name_normalized: data["display_name_normalized"],
        first_name: data["first_name"],
        image_72: data["image_72"],
        is_restricted: data["is_restricted"],
        is_ultra_restricted: data["is_ultra_restricted"],
        name: data["name"],
        real_name: data["real_name"],
        real_name_normalized: data["real_name_normalized"],
        team: data["team"]
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "avatar_hash" => data.avatar_hash,
        "display_name" => data.display_name,
        "display_name_normalized" => data.display_name_normalized,
        "first_name" => data.first_name,
        "image_72" => data.image_72,
        "is_restricted" => data.is_restricted,
        "is_ultra_restricted" => data.is_ultra_restricted,
        "name" => data.name,
        "real_name" => data.real_name,
        "real_name_normalized" => data.real_name_normalized,
        "team" => data.team
      }
    end
  end

  defmodule(ObjsScopes) do
    @type t :: [binary]
    def(decode(items)) do
      Enum.map(items, fn item -> item end)
    end
  end

  defmodule(ObjsBotProfile) do
    @moduledoc "#{"Bot Profile Object"}
    "
    defstruct(
      app_id: nil,
      deleted: nil,
      icons: nil,
      id: nil,
      name: nil,
      team_id: nil,
      updated: nil
    )

    @type t :: %__MODULE__{
            app_id: binary,
            deleted: boolean,
            icons: %{image_36: binary, image_48: binary, image_72: binary},
            id: binary,
            name: binary,
            team_id: binary,
            updated: integer
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        app_id: data["app_id"],
        deleted: data["deleted"],
        icons: %{
          image_36: data["icons"]["image_36"],
          image_48: data["icons"]["image_48"],
          image_72: data["icons"]["image_72"]
        },
        id: data["id"],
        name: data["name"],
        team_id: data["team_id"],
        updated: data["updated"]
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "app_id" => data.app_id,
        "deleted" => data.deleted,
        "icons" => %{
          image_36: data.icons["image_36"],
          image_48: data.icons["image_48"],
          image_72: data.icons["image_72"]
        },
        "id" => data.id,
        "name" => data.name,
        "team_id" => data.team_id,
        "updated" => data.updated
      }
    end
  end

  defmodule(ObjsTeamProfileField) do
    @moduledoc "#{nil}
    "
    defstruct(
      field_name: nil,
      hint: nil,
      id: nil,
      is_hidden: nil,
      label: nil,
      options: nil,
      ordering: nil,
      possible_values: nil,
      type: nil
    )

    @type t :: %__MODULE__{
            field_name: binary | nil,
            hint: binary,
            id: binary,
            is_hidden: boolean | nil,
            label: binary,
            options: Slack.ObjsTeamProfileFieldOption.t() | nil,
            ordering: number,
            possible_values: [binary] | nil,
            type: binary
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        field_name: data["field_name"],
        hint: data["hint"],
        id: data["id"],
        is_hidden: data["is_hidden"],
        label: data["label"],
        options: Slack.ObjsTeamProfileFieldOption.decode(data["options"]),
        ordering: data["ordering"],
        possible_values:
          case(data["possible_values"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["possible_values"], fn item -> item end)
          end,
        type: data["type"]
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "field_name" => data.field_name,
        "hint" => data.hint,
        "id" => data.id,
        "is_hidden" => data.is_hidden,
        "label" => data.label,
        "options" => Slack.ObjsTeamProfileFieldOption.encode(data.options),
        "ordering" => data.ordering,
        "possible_values" =>
          case(data.possible_values) do
            nil ->
              nil

            _ ->
              Enum.map(data.possible_values, fn item -> item end)
          end,
        "type" => data.type
      }
    end
  end

  @type defs_reminder_id :: binary
  @type defs_dm_id :: binary
  @type defs_ok_true :: boolean
  @type defs_file_id :: binary
  @type defs_channel_name :: binary
  defmodule(ObjsPrimaryOwner) do
    @moduledoc "#{nil}
    "
    defstruct(email: nil, id: nil)
    @type t :: %__MODULE__{email: binary, id: binary}
    @doc false
    def(decode(data)) do
      %__MODULE__{email: data["email"], id: data["id"]}
    end

    @doc false
    def(encode(data)) do
      %{"email" => data.email, "id" => data.id}
    end
  end

  defmodule(ObjsExternalOrgMigrations) do
    @moduledoc "#{"External Org Migrations"}
    "
    defstruct(current: nil, date_updated: nil)

    @type t :: %__MODULE__{
            current: [%{date_started: integer, team_id: binary}],
            date_updated: integer
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        current:
          Enum.map(data["current"], fn item ->
            %{date_started: item["date_started"], team_id: item["team_id"]}
          end),
        date_updated: data["date_updated"]
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "current" =>
          case(data.current) do
            nil ->
              nil

            _ ->
              Enum.map(data.current, fn item ->
                %{date_started: item["date_started"], team_id: item["team_id"]}
              end)
          end,
        "date_updated" => data.date_updated
      }
    end
  end

  nil

  defmodule(ObjsTeam) do
    @moduledoc "#{"Team Object"}
    "
    defstruct(
      archived: nil,
      avatar_base_url: nil,
      created: nil,
      date_create: nil,
      deleted: nil,
      description: nil,
      discoverable: nil,
      domain: nil,
      email_domain: nil,
      enterprise_id: nil,
      enterprise_name: nil,
      external_org_migrations: nil,
      has_compliance_export: nil,
      icon: nil,
      id: nil,
      is_assigned: nil,
      is_enterprise: nil,
      is_over_storage_limit: nil,
      limit_ts: nil,
      locale: nil,
      messages_count: nil,
      msg_edit_window_mins: nil,
      name: nil,
      over_integrations_limit: nil,
      over_storage_limit: nil,
      pay_prod_cur: nil,
      plan: nil,
      primary_owner: nil,
      sso_provider: nil
    )

    @type t :: %__MODULE__{
            archived: boolean | nil,
            avatar_base_url: binary | nil,
            created: integer | nil,
            date_create: integer | nil,
            deleted: boolean | nil,
            description: binary | nil,
            discoverable: binary | nil,
            domain: binary,
            email_domain: binary,
            enterprise_id: binary | nil,
            enterprise_name: binary | nil,
            external_org_migrations: Slack.ObjsExternalOrgMigrations.t() | nil,
            has_compliance_export: boolean | nil,
            icon: Slack.ObjsIcon.t(),
            id: binary,
            is_assigned: boolean | nil,
            is_enterprise: integer | nil,
            is_over_storage_limit: boolean | nil,
            limit_ts: integer | nil,
            locale: binary | nil,
            messages_count: integer | nil,
            msg_edit_window_mins: integer | nil,
            name: binary,
            over_integrations_limit: boolean | nil,
            over_storage_limit: boolean | nil,
            pay_prod_cur: binary | nil,
            plan: binary | nil,
            primary_owner: Slack.ObjsPrimaryOwner.t() | nil,
            sso_provider: %{label: binary | nil, name: binary | nil, type: binary | nil} | nil
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        archived: data["archived"],
        avatar_base_url: data["avatar_base_url"],
        created: data["created"],
        date_create: data["date_create"],
        deleted: data["deleted"],
        description: data["description"],
        discoverable: data["discoverable"],
        domain: data["domain"],
        email_domain: data["email_domain"],
        enterprise_id: data["enterprise_id"],
        enterprise_name: data["enterprise_name"],
        external_org_migrations:
          Slack.ObjsExternalOrgMigrations.decode(data["external_org_migrations"]),
        has_compliance_export: data["has_compliance_export"],
        icon: Slack.ObjsIcon.decode(data["icon"]),
        id: data["id"],
        is_assigned: data["is_assigned"],
        is_enterprise: data["is_enterprise"],
        is_over_storage_limit: data["is_over_storage_limit"],
        limit_ts: data["limit_ts"],
        locale: data["locale"],
        messages_count: data["messages_count"],
        msg_edit_window_mins: data["msg_edit_window_mins"],
        name: data["name"],
        over_integrations_limit: data["over_integrations_limit"],
        over_storage_limit: data["over_storage_limit"],
        pay_prod_cur: data["pay_prod_cur"],
        plan: data["plan"],
        primary_owner: Slack.ObjsPrimaryOwner.decode(data["primary_owner"]),
        sso_provider: %{
          label: data["sso_provider"]["label"],
          name: data["sso_provider"]["name"],
          type: data["sso_provider"]["type"]
        }
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "archived" => data.archived,
        "avatar_base_url" => data.avatar_base_url,
        "created" => data.created,
        "date_create" => data.date_create,
        "deleted" => data.deleted,
        "description" => data.description,
        "discoverable" => data.discoverable,
        "domain" => data.domain,
        "email_domain" => data.email_domain,
        "enterprise_id" => data.enterprise_id,
        "enterprise_name" => data.enterprise_name,
        "external_org_migrations" =>
          Slack.ObjsExternalOrgMigrations.encode(data.external_org_migrations),
        "has_compliance_export" => data.has_compliance_export,
        "icon" => Slack.ObjsIcon.encode(data.icon),
        "id" => data.id,
        "is_assigned" => data.is_assigned,
        "is_enterprise" => data.is_enterprise,
        "is_over_storage_limit" => data.is_over_storage_limit,
        "limit_ts" => data.limit_ts,
        "locale" => data.locale,
        "messages_count" => data.messages_count,
        "msg_edit_window_mins" => data.msg_edit_window_mins,
        "name" => data.name,
        "over_integrations_limit" => data.over_integrations_limit,
        "over_storage_limit" => data.over_storage_limit,
        "pay_prod_cur" => data.pay_prod_cur,
        "plan" => data.plan,
        "primary_owner" => Slack.ObjsPrimaryOwner.encode(data.primary_owner),
        "sso_provider" => %{
          label: data.sso_provider["label"],
          name: data.sso_provider["name"],
          type: data.sso_provider["type"]
        }
      }
    end
  end

  defmodule(ObjsReaction) do
    @moduledoc "#{"Reaction object"}
    "
    defstruct(count: nil, name: nil, users: nil)
    @type t :: %__MODULE__{count: integer, name: binary, users: [binary]}
    @doc false
    def(decode(data)) do
      %__MODULE__{
        count: data["count"],
        name: data["name"],
        users: Enum.map(data["users"], fn item -> item end)
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "count" => data.count,
        "name" => data.name,
        "users" =>
          case(data.users) do
            nil ->
              nil

            _ ->
              Enum.map(data.users, fn item -> item end)
          end
      }
    end
  end

  defmodule(ObjsTeamProfileFieldOption) do
    @moduledoc "#{nil}
    "
    defstruct(is_custom: nil, is_multiple_entry: nil, is_protected: nil, is_scim: nil)

    @type t :: %__MODULE__{
            is_custom: boolean | nil,
            is_multiple_entry: boolean | nil,
            is_protected: boolean | nil,
            is_scim: boolean | nil
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        is_custom: data["is_custom"],
        is_multiple_entry: data["is_multiple_entry"],
        is_protected: data["is_protected"],
        is_scim: data["is_scim"]
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "is_custom" => data.is_custom,
        "is_multiple_entry" => data.is_multiple_entry,
        "is_protected" => data.is_protected,
        "is_scim" => data.is_scim
      }
    end
  end

  @type defs_ok_false :: boolean
  defmodule(ObjsIcon) do
    @moduledoc "#{nil}
    "
    defstruct(
      image_102: nil,
      image_132: nil,
      image_230: nil,
      image_34: nil,
      image_44: nil,
      image_68: nil,
      image_88: nil,
      image_default: nil
    )

    @type t :: %__MODULE__{
            image_102: binary | nil,
            image_132: binary | nil,
            image_230: binary | nil,
            image_34: binary | nil,
            image_44: binary | nil,
            image_68: binary | nil,
            image_88: binary | nil,
            image_default: boolean | nil
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        image_102: data["image_102"],
        image_132: data["image_132"],
        image_230: data["image_230"],
        image_34: data["image_34"],
        image_44: data["image_44"],
        image_68: data["image_68"],
        image_88: data["image_88"],
        image_default: data["image_default"]
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "image_102" => data.image_102,
        "image_132" => data.image_132,
        "image_230" => data.image_230,
        "image_34" => data.image_34,
        "image_44" => data.image_44,
        "image_68" => data.image_68,
        "image_88" => data.image_88,
        "image_default" => data.image_default
      }
    end
  end

  @type defs_app_id :: binary
  defmodule(ObjsFile) do
    @moduledoc "#{"file object"}
    "
    defstruct(
      is_external: nil,
      state: nil,
      external_id: nil,
      is_tombstoned: nil,
      name: nil,
      thumb_480_h: nil,
      source_team: nil,
      shares: nil,
      non_owner_editable: nil,
      url_private: nil,
      pinned_to: nil,
      thumb_960: nil,
      permalink: nil,
      thumb_1024_w: nil,
      image_exif_rotation: nil,
      thumb_80: nil,
      thumb_1024: nil,
      has_rich_preview: nil,
      display_as_bot: nil,
      num_stars: nil,
      thumb_1024_h: nil,
      thumb_960_w: nil,
      public_url_shared: nil,
      url_private_download: nil,
      updated: nil,
      username: nil,
      pinned_info: nil,
      thumb_800: nil,
      size: nil,
      thumb_360_w: nil,
      mode: nil,
      external_url: nil,
      date_delete: nil,
      thumb_tiny: nil,
      filetype: nil,
      editor: nil,
      groups: nil,
      last_editor: nil,
      original_h: nil,
      is_starred: nil,
      is_public: nil,
      thumb_160: nil,
      thumb_480_w: nil,
      thumb_480: nil,
      preview: nil,
      ims: nil,
      thumb_360_h: nil,
      thumb_360: nil,
      created: nil,
      comments_count: nil,
      pretty_type: nil,
      thumb_720_w: nil,
      editable: nil,
      thumb_64: nil,
      user: nil,
      thumb_800_h: nil,
      thumb_960_h: nil,
      thumb_800_w: nil,
      thumb_720_h: nil,
      permalink_public: nil,
      reactions: nil,
      user_team: nil,
      id: nil,
      channels: nil,
      original_w: nil,
      title: nil,
      mimetype: nil,
      thumb_720: nil,
      external_type: nil,
      timestamp: nil
    )

    @type t :: %__MODULE__{
            is_external: boolean | nil,
            state: binary | nil,
            external_id: binary | nil,
            is_tombstoned: boolean | nil,
            name: binary | nil,
            thumb_480_h: integer | nil,
            source_team: binary | nil,
            shares: %{private: any | nil, public: any | nil} | nil,
            non_owner_editable: boolean | nil,
            url_private: binary | nil,
            pinned_to: [binary] | nil,
            thumb_960: binary | nil,
            permalink: binary | nil,
            thumb_1024_w: integer | nil,
            image_exif_rotation: integer | nil,
            thumb_80: binary | nil,
            thumb_1024: binary | nil,
            has_rich_preview: boolean | nil,
            display_as_bot: boolean | nil,
            num_stars: integer | nil,
            thumb_1024_h: integer | nil,
            thumb_960_w: integer | nil,
            public_url_shared: boolean | nil,
            url_private_download: binary | nil,
            updated: integer | nil,
            username: binary | nil,
            pinned_info: Slack.DefsPinnedInfo.t() | nil,
            thumb_800: binary | nil,
            size: integer | nil,
            thumb_360_w: integer | nil,
            mode: binary | nil,
            external_url: binary | nil,
            date_delete: integer | nil,
            thumb_tiny: binary | nil,
            filetype: binary | nil,
            editor: binary | nil,
            groups: [binary] | nil,
            last_editor: binary | nil,
            original_h: integer | nil,
            is_starred: boolean | nil,
            is_public: boolean | nil,
            thumb_160: binary | nil,
            thumb_480_w: integer | nil,
            thumb_480: binary | nil,
            preview: binary | nil,
            ims: [binary] | nil,
            thumb_360_h: integer | nil,
            thumb_360: binary | nil,
            created: integer | nil,
            comments_count: integer | nil,
            pretty_type: binary | nil,
            thumb_720_w: integer | nil,
            editable: boolean | nil,
            thumb_64: binary | nil,
            user: binary | nil,
            thumb_800_h: integer | nil,
            thumb_960_h: integer | nil,
            thumb_800_w: integer | nil,
            thumb_720_h: integer | nil,
            permalink_public: binary | nil,
            reactions: [Slack.ObjsReaction.t()] | nil,
            user_team: binary | nil,
            id: binary | nil,
            channels: [binary] | nil,
            original_w: integer | nil,
            title: binary | nil,
            mimetype: binary | nil,
            thumb_720: binary | nil,
            external_type: binary | nil,
            timestamp: integer | nil
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        is_external: data["is_external"],
        state: data["state"],
        external_id: data["external_id"],
        is_tombstoned: data["is_tombstoned"],
        name: data["name"],
        thumb_480_h: data["thumb_480_h"],
        source_team: data["source_team"],
        shares: %{private: data["shares"]["private"], public: data["shares"]["public"]},
        non_owner_editable: data["non_owner_editable"],
        url_private: data["url_private"],
        pinned_to:
          case(data["pinned_to"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["pinned_to"], fn item -> item end)
          end,
        thumb_960: data["thumb_960"],
        permalink: data["permalink"],
        thumb_1024_w: data["thumb_1024_w"],
        image_exif_rotation: data["image_exif_rotation"],
        thumb_80: data["thumb_80"],
        thumb_1024: data["thumb_1024"],
        has_rich_preview: data["has_rich_preview"],
        display_as_bot: data["display_as_bot"],
        num_stars: data["num_stars"],
        thumb_1024_h: data["thumb_1024_h"],
        thumb_960_w: data["thumb_960_w"],
        public_url_shared: data["public_url_shared"],
        url_private_download: data["url_private_download"],
        updated: data["updated"],
        username: data["username"],
        pinned_info: Slack.DefsPinnedInfo.decode(data["pinned_info"]),
        thumb_800: data["thumb_800"],
        size: data["size"],
        thumb_360_w: data["thumb_360_w"],
        mode: data["mode"],
        external_url: data["external_url"],
        date_delete: data["date_delete"],
        thumb_tiny: data["thumb_tiny"],
        filetype: data["filetype"],
        editor: data["editor"],
        groups:
          case(data["groups"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["groups"], fn item -> item end)
          end,
        last_editor: data["last_editor"],
        original_h: data["original_h"],
        is_starred: data["is_starred"],
        is_public: data["is_public"],
        thumb_160: data["thumb_160"],
        thumb_480_w: data["thumb_480_w"],
        thumb_480: data["thumb_480"],
        preview: data["preview"],
        ims:
          case(data["ims"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["ims"], fn item -> item end)
          end,
        thumb_360_h: data["thumb_360_h"],
        thumb_360: data["thumb_360"],
        created: data["created"],
        comments_count: data["comments_count"],
        pretty_type: data["pretty_type"],
        thumb_720_w: data["thumb_720_w"],
        editable: data["editable"],
        thumb_64: data["thumb_64"],
        user: data["user"],
        thumb_800_h: data["thumb_800_h"],
        thumb_960_h: data["thumb_960_h"],
        thumb_800_w: data["thumb_800_w"],
        thumb_720_h: data["thumb_720_h"],
        permalink_public: data["permalink_public"],
        reactions:
          case(data["reactions"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["reactions"], fn item -> Slack.ObjsReaction.decode(item) end)
          end,
        user_team: data["user_team"],
        id: data["id"],
        channels:
          case(data["channels"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["channels"], fn item -> item end)
          end,
        original_w: data["original_w"],
        title: data["title"],
        mimetype: data["mimetype"],
        thumb_720: data["thumb_720"],
        external_type: data["external_type"],
        timestamp: data["timestamp"]
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "is_external" => data.is_external,
        "state" => data.state,
        "external_id" => data.external_id,
        "is_tombstoned" => data.is_tombstoned,
        "name" => data.name,
        "thumb_480_h" => data.thumb_480_h,
        "source_team" => data.source_team,
        "shares" => %{private: data.shares["private"], public: data.shares["public"]},
        "non_owner_editable" => data.non_owner_editable,
        "url_private" => data.url_private,
        "pinned_to" =>
          case(data.pinned_to) do
            nil ->
              nil

            _ ->
              Enum.map(data.pinned_to, fn item -> item end)
          end,
        "thumb_960" => data.thumb_960,
        "permalink" => data.permalink,
        "thumb_1024_w" => data.thumb_1024_w,
        "image_exif_rotation" => data.image_exif_rotation,
        "thumb_80" => data.thumb_80,
        "thumb_1024" => data.thumb_1024,
        "has_rich_preview" => data.has_rich_preview,
        "display_as_bot" => data.display_as_bot,
        "num_stars" => data.num_stars,
        "thumb_1024_h" => data.thumb_1024_h,
        "thumb_960_w" => data.thumb_960_w,
        "public_url_shared" => data.public_url_shared,
        "url_private_download" => data.url_private_download,
        "updated" => data.updated,
        "username" => data.username,
        "pinned_info" => Slack.DefsPinnedInfo.encode(data.pinned_info),
        "thumb_800" => data.thumb_800,
        "size" => data.size,
        "thumb_360_w" => data.thumb_360_w,
        "mode" => data.mode,
        "external_url" => data.external_url,
        "date_delete" => data.date_delete,
        "thumb_tiny" => data.thumb_tiny,
        "filetype" => data.filetype,
        "editor" => data.editor,
        "groups" =>
          case(data.groups) do
            nil ->
              nil

            _ ->
              Enum.map(data.groups, fn item -> item end)
          end,
        "last_editor" => data.last_editor,
        "original_h" => data.original_h,
        "is_starred" => data.is_starred,
        "is_public" => data.is_public,
        "thumb_160" => data.thumb_160,
        "thumb_480_w" => data.thumb_480_w,
        "thumb_480" => data.thumb_480,
        "preview" => data.preview,
        "ims" =>
          case(data.ims) do
            nil ->
              nil

            _ ->
              Enum.map(data.ims, fn item -> item end)
          end,
        "thumb_360_h" => data.thumb_360_h,
        "thumb_360" => data.thumb_360,
        "created" => data.created,
        "comments_count" => data.comments_count,
        "pretty_type" => data.pretty_type,
        "thumb_720_w" => data.thumb_720_w,
        "editable" => data.editable,
        "thumb_64" => data.thumb_64,
        "user" => data.user,
        "thumb_800_h" => data.thumb_800_h,
        "thumb_960_h" => data.thumb_960_h,
        "thumb_800_w" => data.thumb_800_w,
        "thumb_720_h" => data.thumb_720_h,
        "permalink_public" => data.permalink_public,
        "reactions" =>
          case(data.reactions) do
            nil ->
              nil

            _ ->
              Enum.map(data.reactions, fn item -> Slack.ObjsReaction.encode(item) end)
          end,
        "user_team" => data.user_team,
        "id" => data.id,
        "channels" =>
          case(data.channels) do
            nil ->
              nil

            _ ->
              Enum.map(data.channels, fn item -> item end)
          end,
        "original_w" => data.original_w,
        "title" => data.title,
        "mimetype" => data.mimetype,
        "thumb_720" => data.thumb_720,
        "external_type" => data.external_type,
        "timestamp" => data.timestamp
      }
    end
  end

  @type defs_channel_id :: binary
  @type defs_comment_id :: binary
  defmodule(ObjsEnterpriseUser) do
    @moduledoc "#{nil}
    "
    defstruct(
      enterprise_id: nil,
      enterprise_name: nil,
      id: nil,
      is_admin: nil,
      is_owner: nil,
      teams: nil
    )

    @type t :: %__MODULE__{
            enterprise_id: binary,
            enterprise_name: binary,
            id: binary,
            is_admin: boolean,
            is_owner: boolean,
            teams: [binary]
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        enterprise_id: data["enterprise_id"],
        enterprise_name: data["enterprise_name"],
        id: data["id"],
        is_admin: data["is_admin"],
        is_owner: data["is_owner"],
        teams: Enum.map(data["teams"], fn item -> item end)
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "enterprise_id" => data.enterprise_id,
        "enterprise_name" => data.enterprise_name,
        "id" => data.id,
        "is_admin" => data.is_admin,
        "is_owner" => data.is_owner,
        "teams" =>
          case(data.teams) do
            nil ->
              nil

            _ ->
              Enum.map(data.teams, fn item -> item end)
          end
      }
    end
  end

  defmodule(DefsPinnedInfo) do
    @moduledoc "#{"Info for a pinned item"}
    "
    defstruct([])
    @type t :: %__MODULE__{}
    @doc false
    def(decode(data)) do
      %__MODULE__{}
    end

    @doc false
    def(encode(data)) do
      %{}
    end
  end

  @type defs_bot_id :: binary
  nil

  defmodule(ObjsResources) do
    @moduledoc "#{"resources in info from apps.permissions.info"}
    "
    defstruct(excluded_ids: nil, ids: nil, wildcard: nil)
    @type t :: %__MODULE__{excluded_ids: [binary] | nil, ids: [binary], wildcard: boolean | nil}
    @doc false
    def(decode(data)) do
      %__MODULE__{
        excluded_ids:
          case(data["excluded_ids"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["excluded_ids"], fn item -> {:TODO, :OneOfDecode} end)
          end,
        ids: Enum.map(data["ids"], fn item -> {:TODO, :OneOfDecode} end),
        wildcard: data["wildcard"]
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "excluded_ids" =>
          case(data.excluded_ids) do
            nil ->
              nil

            _ ->
              Enum.map(data.excluded_ids, fn item -> {:TODO, :OneOfEncode} end)
          end,
        "ids" =>
          case(data.ids) do
            nil ->
              nil

            _ ->
              Enum.map(data.ids, fn item -> {:TODO, :OneOfEncode} end)
          end,
        "wildcard" => data.wildcard
      }
    end
  end

  defmodule(ObjsComment) do
    @moduledoc "#{"File Comment Object"}
    "
    defstruct(
      comment: nil,
      created: nil,
      id: nil,
      is_intro: nil,
      is_starred: nil,
      num_stars: nil,
      pinned_info: nil,
      pinned_to: nil,
      reactions: nil,
      timestamp: nil,
      user: nil
    )

    @type t :: %__MODULE__{
            comment: binary,
            created: integer,
            id: binary,
            is_intro: boolean,
            is_starred: boolean | nil,
            num_stars: integer | nil,
            pinned_info: Slack.DefsPinnedInfo.t() | nil,
            pinned_to: [binary] | nil,
            reactions: [Slack.ObjsReaction.t()] | nil,
            timestamp: integer,
            user: binary
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        comment: data["comment"],
        created: data["created"],
        id: data["id"],
        is_intro: data["is_intro"],
        is_starred: data["is_starred"],
        num_stars: data["num_stars"],
        pinned_info: Slack.DefsPinnedInfo.decode(data["pinned_info"]),
        pinned_to:
          case(data["pinned_to"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["pinned_to"], fn item -> item end)
          end,
        reactions:
          case(data["reactions"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["reactions"], fn item -> Slack.ObjsReaction.decode(item) end)
          end,
        timestamp: data["timestamp"],
        user: data["user"]
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "comment" => data.comment,
        "created" => data.created,
        "id" => data.id,
        "is_intro" => data.is_intro,
        "is_starred" => data.is_starred,
        "num_stars" => data.num_stars,
        "pinned_info" => Slack.DefsPinnedInfo.encode(data.pinned_info),
        "pinned_to" =>
          case(data.pinned_to) do
            nil ->
              nil

            _ ->
              Enum.map(data.pinned_to, fn item -> item end)
          end,
        "reactions" =>
          case(data.reactions) do
            nil ->
              nil

            _ ->
              Enum.map(data.reactions, fn item -> Slack.ObjsReaction.encode(item) end)
          end,
        "timestamp" => data.timestamp,
        "user" => data.user
      }
    end
  end

  @type defs_enterprise_name :: binary
  @type defs_optional_app_id :: binary
  @type defs_topic_purpose_creator :: binary
  @type defs_user_id :: binary
  defmodule(ObjsChannel) do
    @moduledoc "#{"Channel Object"}
    "
    defstruct(
      accepted_user: nil,
      created: nil,
      creator: nil,
      id: nil,
      is_archived: nil,
      is_channel: nil,
      is_frozen: nil,
      is_general: nil,
      is_member: nil,
      is_moved: nil,
      is_mpim: nil,
      is_non_threadable: nil,
      is_org_shared: nil,
      is_pending_ext_shared: nil,
      is_private: nil,
      is_read_only: nil,
      is_shared: nil,
      is_thread_only: nil,
      last_read: nil,
      latest: nil,
      members: nil,
      name: nil,
      name_normalized: nil,
      num_members: nil,
      pending_shared: nil,
      previous_names: nil,
      priority: nil,
      purpose: nil,
      topic: nil,
      unlinked: nil,
      unread_count: nil,
      unread_count_display: nil
    )

    @type t :: %__MODULE__{
            accepted_user: binary | nil,
            created: integer,
            creator: binary,
            id: binary,
            is_archived: boolean | nil,
            is_channel: boolean,
            is_frozen: boolean | nil,
            is_general: boolean | nil,
            is_member: boolean | nil,
            is_moved: integer | nil,
            is_mpim: boolean,
            is_non_threadable: boolean | nil,
            is_org_shared: boolean,
            is_pending_ext_shared: boolean | nil,
            is_private: boolean,
            is_read_only: boolean | nil,
            is_shared: boolean,
            is_thread_only: boolean | nil,
            last_read: binary | nil,
            latest: Slack.ObjsMessage.t() | nil,
            members: [binary],
            name: binary,
            name_normalized: binary,
            num_members: integer | nil,
            pending_shared: [binary] | nil,
            previous_names: [binary] | nil,
            priority: number | nil,
            purpose: %{creator: binary, last_set: integer, value: binary},
            topic: %{creator: binary, last_set: integer, value: binary},
            unlinked: integer | nil,
            unread_count: integer | nil,
            unread_count_display: integer | nil
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        accepted_user: data["accepted_user"],
        created: data["created"],
        creator: data["creator"],
        id: data["id"],
        is_archived: data["is_archived"],
        is_channel: data["is_channel"],
        is_frozen: data["is_frozen"],
        is_general: data["is_general"],
        is_member: data["is_member"],
        is_moved: data["is_moved"],
        is_mpim: data["is_mpim"],
        is_non_threadable: data["is_non_threadable"],
        is_org_shared: data["is_org_shared"],
        is_pending_ext_shared: data["is_pending_ext_shared"],
        is_private: data["is_private"],
        is_read_only: data["is_read_only"],
        is_shared: data["is_shared"],
        is_thread_only: data["is_thread_only"],
        last_read: data["last_read"],
        latest: Slack.ObjsMessage.decode(data["latest"]),
        members: Enum.map(data["members"], fn item -> item end),
        name: data["name"],
        name_normalized: data["name_normalized"],
        num_members: data["num_members"],
        pending_shared:
          case(data["pending_shared"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["pending_shared"], fn item -> item end)
          end,
        previous_names:
          case(data["previous_names"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["previous_names"], fn item -> item end)
          end,
        priority: data["priority"],
        purpose: %{
          creator: data["purpose"]["creator"],
          last_set: data["purpose"]["last_set"],
          value: data["purpose"]["value"]
        },
        topic: %{
          creator: data["topic"]["creator"],
          last_set: data["topic"]["last_set"],
          value: data["topic"]["value"]
        },
        unlinked: data["unlinked"],
        unread_count: data["unread_count"],
        unread_count_display: data["unread_count_display"]
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "accepted_user" => data.accepted_user,
        "created" => data.created,
        "creator" => data.creator,
        "id" => data.id,
        "is_archived" => data.is_archived,
        "is_channel" => data.is_channel,
        "is_frozen" => data.is_frozen,
        "is_general" => data.is_general,
        "is_member" => data.is_member,
        "is_moved" => data.is_moved,
        "is_mpim" => data.is_mpim,
        "is_non_threadable" => data.is_non_threadable,
        "is_org_shared" => data.is_org_shared,
        "is_pending_ext_shared" => data.is_pending_ext_shared,
        "is_private" => data.is_private,
        "is_read_only" => data.is_read_only,
        "is_shared" => data.is_shared,
        "is_thread_only" => data.is_thread_only,
        "last_read" => data.last_read,
        "latest" => Slack.ObjsMessage.encode(data.latest),
        "members" =>
          case(data.members) do
            nil ->
              nil

            _ ->
              Enum.map(data.members, fn item -> item end)
          end,
        "name" => data.name,
        "name_normalized" => data.name_normalized,
        "num_members" => data.num_members,
        "pending_shared" =>
          case(data.pending_shared) do
            nil ->
              nil

            _ ->
              Enum.map(data.pending_shared, fn item -> item end)
          end,
        "previous_names" =>
          case(data.previous_names) do
            nil ->
              nil

            _ ->
              Enum.map(data.previous_names, fn item -> item end)
          end,
        "priority" => data.priority,
        "purpose" => %{
          creator: data.purpose["creator"],
          last_set: data.purpose["last_set"],
          value: data.purpose["value"]
        },
        "topic" => %{
          creator: data.topic["creator"],
          last_set: data.topic["last_set"],
          value: data.topic["value"]
        },
        "unlinked" => data.unlinked,
        "unread_count" => data.unread_count,
        "unread_count_display" => data.unread_count_display
      }
    end
  end

  @type defs_subteam_id :: binary
  defmodule(ObjsMessage) do
    @moduledoc "#{"Message object"}
    "
    defstruct(
      user_profile: nil,
      subtype: nil,
      name: nil,
      bot_id: nil,
      source_team: nil,
      thread_ts: nil,
      pinned_to: nil,
      old_name: nil,
      permalink: nil,
      reply_users: nil,
      last_read: nil,
      blocks: nil,
      file: nil,
      display_as_bot: nil,
      is_delayed_message: nil,
      upload: nil,
      parent_user_id: nil,
      username: nil,
      team: nil,
      latest_reply: nil,
      purpose: nil,
      client_msg_id: nil,
      comment: nil,
      topic: nil,
      files: nil,
      is_starred: nil,
      text: nil,
      attachments: nil,
      unread_count: nil,
      reply_users_count: nil,
      reply_count: nil,
      user: nil,
      ts: nil,
      type: nil,
      inviter: nil,
      reactions: nil,
      subscribed: nil,
      bot_profile: nil,
      is_intro: nil,
      user_team: nil,
      icons: nil
    )

    @type t :: %__MODULE__{
            user_profile: Slack.ObjsUserProfileShort.t() | nil,
            subtype: binary | nil,
            name: binary | nil,
            bot_id: binary | nil,
            source_team: binary | nil,
            thread_ts: binary | nil,
            pinned_to: [binary] | nil,
            old_name: binary | nil,
            permalink: binary | nil,
            reply_users: [binary] | nil,
            last_read: binary | nil,
            blocks: [%{type: binary}] | nil,
            file: Slack.ObjsFile.t() | nil,
            display_as_bot: boolean | nil,
            is_delayed_message: boolean | nil,
            upload: boolean | nil,
            parent_user_id: binary | nil,
            username: binary | nil,
            team: binary | nil,
            latest_reply: binary | nil,
            purpose: binary | nil,
            client_msg_id: binary | nil,
            comment: Slack.ObjsComment.t() | nil,
            topic: binary | nil,
            files: [Slack.ObjsFile.t()] | nil,
            is_starred: boolean | nil,
            text: binary,
            attachments:
              [
                %{
                  fallback: binary | nil,
                  id: integer,
                  image_bytes: integer | nil,
                  image_height: integer | nil,
                  image_url: binary | nil,
                  image_width: integer | nil
                }
              ]
              | nil,
            unread_count: integer | nil,
            reply_users_count: integer | nil,
            reply_count: integer | nil,
            user: binary | nil,
            ts: binary,
            type: binary,
            inviter: binary | nil,
            reactions: [Slack.ObjsReaction.t()] | nil,
            subscribed: boolean | nil,
            bot_profile: Slack.ObjsBotProfile.t() | nil,
            is_intro: boolean | nil,
            user_team: binary | nil,
            icons: %{emoji: binary | nil, image_64: binary | nil} | nil
          }
    @doc false
    def(decode(data)) do
      %__MODULE__{
        user_profile: Slack.ObjsUserProfileShort.decode(data["user_profile"]),
        subtype: data["subtype"],
        name: data["name"],
        bot_id: data["bot_id"],
        source_team: data["source_team"],
        thread_ts: data["thread_ts"],
        pinned_to:
          case(data["pinned_to"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["pinned_to"], fn item -> item end)
          end,
        old_name: data["old_name"],
        permalink: data["permalink"],
        reply_users:
          case(data["reply_users"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["reply_users"], fn item -> item end)
          end,
        last_read: data["last_read"],
        blocks: Enum.map(data["blocks"], fn item -> %{type: item["type"]} end),
        file: Slack.ObjsFile.decode(data["file"]),
        display_as_bot: data["display_as_bot"],
        is_delayed_message: data["is_delayed_message"],
        upload: data["upload"],
        parent_user_id: data["parent_user_id"],
        username: data["username"],
        team: data["team"],
        latest_reply: data["latest_reply"],
        purpose: data["purpose"],
        client_msg_id: data["client_msg_id"],
        comment: Slack.ObjsComment.decode(data["comment"]),
        topic: data["topic"],
        files:
          case(data["files"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["files"], fn item -> Slack.ObjsFile.decode(item) end)
          end,
        is_starred: data["is_starred"],
        text: data["text"],
        attachments:
          case(data["attachments"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["attachments"], fn item ->
                %{
                  fallback: item["fallback"],
                  id: item["id"],
                  image_bytes: item["image_bytes"],
                  image_height: item["image_height"],
                  image_url: item["image_url"],
                  image_width: item["image_width"]
                }
              end)
          end,
        unread_count: data["unread_count"],
        reply_users_count: data["reply_users_count"],
        reply_count: data["reply_count"],
        user: data["user"],
        ts: data["ts"],
        type: data["type"],
        inviter: data["inviter"],
        reactions:
          case(data["reactions"]) do
            nil ->
              nil

            _ ->
              Enum.map(data["reactions"], fn item -> Slack.ObjsReaction.decode(item) end)
          end,
        subscribed: data["subscribed"],
        bot_profile: Slack.ObjsBotProfile.decode(data["bot_profile"]),
        is_intro: data["is_intro"],
        user_team: data["user_team"],
        icons: %{emoji: data["icons"]["emoji"], image_64: data["icons"]["image_64"]}
      }
    end

    @doc false
    def(encode(data)) do
      %{
        "user_profile" => Slack.ObjsUserProfileShort.encode(data.user_profile),
        "subtype" => data.subtype,
        "name" => data.name,
        "bot_id" => data.bot_id,
        "source_team" => data.source_team,
        "thread_ts" => data.thread_ts,
        "pinned_to" =>
          case(data.pinned_to) do
            nil ->
              nil

            _ ->
              Enum.map(data.pinned_to, fn item -> item end)
          end,
        "old_name" => data.old_name,
        "permalink" => data.permalink,
        "reply_users" =>
          case(data.reply_users) do
            nil ->
              nil

            _ ->
              Enum.map(data.reply_users, fn item -> item end)
          end,
        "last_read" => data.last_read,
        "blocks" =>
          case(data.blocks) do
            nil ->
              nil

            _ ->
              Enum.map(data.blocks, fn item -> %{type: item["type"]} end)
          end,
        "file" => Slack.ObjsFile.encode(data.file),
        "display_as_bot" => data.display_as_bot,
        "is_delayed_message" => data.is_delayed_message,
        "upload" => data.upload,
        "parent_user_id" => data.parent_user_id,
        "username" => data.username,
        "team" => data.team,
        "latest_reply" => data.latest_reply,
        "purpose" => data.purpose,
        "client_msg_id" => data.client_msg_id,
        "comment" => Slack.ObjsComment.encode(data.comment),
        "topic" => data.topic,
        "files" =>
          case(data.files) do
            nil ->
              nil

            _ ->
              Enum.map(data.files, fn item -> Slack.ObjsFile.encode(item) end)
          end,
        "is_starred" => data.is_starred,
        "text" => data.text,
        "attachments" =>
          case(data.attachments) do
            nil ->
              nil

            _ ->
              Enum.map(data.attachments, fn item ->
                %{
                  fallback: item["fallback"],
                  id: item["id"],
                  image_bytes: item["image_bytes"],
                  image_height: item["image_height"],
                  image_url: item["image_url"],
                  image_width: item["image_width"]
                }
              end)
          end,
        "unread_count" => data.unread_count,
        "reply_users_count" => data.reply_users_count,
        "reply_count" => data.reply_count,
        "user" => data.user,
        "ts" => data.ts,
        "type" => data.type,
        "inviter" => data.inviter,
        "reactions" =>
          case(data.reactions) do
            nil ->
              nil

            _ ->
              Enum.map(data.reactions, fn item -> Slack.ObjsReaction.encode(item) end)
          end,
        "subscribed" => data.subscribed,
        "bot_profile" => Slack.ObjsBotProfile.encode(data.bot_profile),
        "is_intro" => data.is_intro,
        "user_team" => data.user_team,
        "icons" => %{emoji: data.icons["emoji"], image_64: data.icons["image_64"]}
      }
    end
  end

  (
    @doc "#{nil}
    
    #{"Deletes a message."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/chat.delete)"}
    "
    @spec chat_delete(Tesla.Client.t()) ::
            {:ok, %{channel: binary, ok: boolean, ts: binary}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(chat_delete(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/chat.delete")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{channel: body["channel"], ok: body["ok"], ts: body["ts"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(chat_delete: 1)
  )

  (
    @doc "#{nil}
    
    #{"Leaves a conversation."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.leave)"}
    "
    @spec conversations_leave(Tesla.Client.t()) ::
            {:ok, %{not_in_channel: boolean | nil, ok: boolean}}
            | {:error,
               %{
                 callstack: binary | nil,
                 error: binary,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
    def(conversations_leave(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/conversations.leave")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{not_in_channel: body["not_in_channel"], ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             error: body["error"],
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_leave: 1)
  )

  (
    @doc "#{nil}
    
    #{"Invites users to a channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.invite)"}
    "
    @spec conversations_invite(Tesla.Client.t()) ::
            {:ok,
             %{
               channel:
                 %{
                   accepted_user: binary | nil,
                   name: binary,
                   is_org_shared: boolean,
                   shares:
                     [
                       %{
                         accepted_user: binary | nil,
                         is_active: boolean,
                         team: Slack.ObjsTeam.t(),
                         user: binary
                       }
                     ]
                     | nil,
                   is_group: boolean,
                   has_pins: boolean | nil,
                   is_org_default: boolean | nil,
                   timezone_count: integer | nil,
                   is_read_only: boolean | nil,
                   use_case: binary | nil,
                   last_read: binary | nil,
                   creator: binary,
                   internal_team_ids: [binary] | nil,
                   is_general: boolean,
                   num_members: integer | nil,
                   is_mpim: boolean,
                   pin_count: integer | nil,
                   unread_count_display: integer | nil,
                   display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                   purpose: %{creator: binary, last_set: integer, value: binary},
                   members: [binary] | nil,
                   unlinked: integer | nil,
                   is_moved: integer | nil,
                   pending_connected_team_ids: [binary] | nil,
                   conversation_host_id: binary | nil,
                   is_private: boolean,
                   topic: %{creator: binary, last_set: integer, value: binary},
                   is_im: boolean,
                   name_normalized: binary,
                   is_starred: boolean | nil,
                   version: integer | nil,
                   is_channel: boolean,
                   enterprise_id: binary | nil,
                   shared_team_ids: [binary] | nil,
                   unread_count: integer | nil,
                   is_global_shared: boolean | nil,
                   is_pending_ext_shared: boolean | nil,
                   latest: Slack.ObjsMessage.t() | nil,
                   created: integer,
                   priority: number | nil,
                   is_non_threadable: boolean | nil,
                   previous_names: [binary] | nil,
                   is_open: boolean | nil,
                   is_thread_only: boolean | nil,
                   is_org_mandatory: boolean | nil,
                   connected_team_ids: [binary] | nil,
                   user: binary | nil,
                   is_ext_shared: boolean | nil,
                   is_frozen: boolean | nil,
                   pending_shared: [binary] | nil,
                   is_archived: boolean,
                   is_shared: boolean,
                   is_member: boolean | nil,
                   id: binary,
                   parent_conversation: binary | nil
                 }
                 | %{
                     accepted_user: binary | nil,
                     name: binary,
                     is_org_shared: boolean,
                     shares:
                       [
                         %{
                           accepted_user: binary | nil,
                           is_active: boolean,
                           team: Slack.ObjsTeam.t(),
                           user: binary
                         }
                       ]
                       | nil,
                     is_group: boolean,
                     timezone_count: integer | nil,
                     is_read_only: boolean | nil,
                     last_read: binary | nil,
                     creator: binary,
                     internal_team_ids: [binary] | nil,
                     is_general: boolean,
                     num_members: integer | nil,
                     is_mpim: boolean,
                     pin_count: integer | nil,
                     unread_count_display: integer | nil,
                     display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                     purpose: %{creator: binary, last_set: integer, value: binary},
                     members: [binary] | nil,
                     unlinked: integer | nil,
                     is_moved: integer | nil,
                     pending_connected_team_ids: [binary] | nil,
                     conversation_host_id: binary | nil,
                     is_private: boolean,
                     topic: %{creator: binary, last_set: integer, value: binary},
                     is_im: boolean,
                     name_normalized: binary,
                     is_starred: boolean | nil,
                     version: integer | nil,
                     is_channel: boolean,
                     shared_team_ids: [binary] | nil,
                     unread_count: integer | nil,
                     is_pending_ext_shared: boolean | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     created: integer,
                     priority: number | nil,
                     is_non_threadable: boolean | nil,
                     previous_names: [binary] | nil,
                     is_open: boolean | nil,
                     is_thread_only: boolean | nil,
                     connected_team_ids: [binary] | nil,
                     user: binary | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     pending_shared: [binary] | nil,
                     is_archived: boolean,
                     is_shared: boolean,
                     is_member: boolean | nil,
                     id: binary,
                     parent_conversation: binary | nil
                   }
                 | %{
                     created: integer,
                     has_pins: boolean | nil,
                     id: binary,
                     is_archived: boolean | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     is_im: boolean,
                     is_open: boolean | nil,
                     is_org_shared: boolean,
                     is_shared: boolean | nil,
                     is_starred: boolean | nil,
                     is_user_deleted: boolean | nil,
                     last_read: binary | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     parent_conversation: binary | nil,
                     pin_count: integer | nil,
                     priority: number,
                     shares:
                       [
                         %{
                           date_create: integer,
                           id: binary,
                           is_active: boolean,
                           name: binary,
                           team: Slack.ObjsTeam.t()
                         }
                       ]
                       | nil,
                     unread_count: integer | nil,
                     unread_count_display: integer | nil,
                     user: binary,
                     version: integer | nil
                   },
               ok: boolean
             }}
            | {:error,
               %{
                 callstack: binary | nil,
                 error: binary | nil,
                 errors: [%{error: binary, ok: boolean, user: binary | nil}] | nil,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
    def(conversations_invite(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/conversations.invite")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{channel: {:TODO, :OneOfDecode}, ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             error: body["error"],
             errors:
               case(body["errors"]) do
                 nil ->
                   nil

                 _ ->
                   Enum.map(body["errors"], fn item ->
                     %{error: item["error"], ok: item["ok"], user: item["user"]}
                   end)
               end,
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_invite: 1)
  )

  (
    @doc "#{nil}
    
    #{"Schedules a message to be sent to a channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/chat.scheduleMessage)"}
    "
    @spec chat_schedule_message(Tesla.Client.t()) ::
            {:ok,
             %{
               channel: binary,
               message: %{
                 bot_id: binary,
                 bot_profile: Slack.ObjsBotProfile.t() | nil,
                 team: binary,
                 text: binary,
                 type: binary,
                 user: binary,
                 username: binary | nil
               },
               ok: boolean,
               post_at: integer,
               scheduled_message_id: binary
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(chat_schedule_message(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/chat.scheduleMessage")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             channel: body["channel"],
             message: %{
               bot_id: body["message"]["bot_id"],
               bot_profile: Slack.ObjsBotProfile.decode(body["message"]["bot_profile"]),
               team: body["message"]["team"],
               text: body["message"]["text"],
               type: body["message"]["type"],
               user: body["message"]["user"],
               username: body["message"]["username"]
             },
             ok: body["ok"],
             post_at: body["post_at"],
             scheduled_message_id: body["scheduled_message_id"]
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(chat_schedule_message: 1)
  )

  (
    @doc "#{nil}
    
    #{"Joins an existing conversation."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.join)"}
    "
    @spec conversations_join(Tesla.Client.t()) ::
            {:ok,
             %{
               channel:
                 %{
                   accepted_user: binary | nil,
                   name: binary,
                   is_org_shared: boolean,
                   shares:
                     [
                       %{
                         accepted_user: binary | nil,
                         is_active: boolean,
                         team: Slack.ObjsTeam.t(),
                         user: binary
                       }
                     ]
                     | nil,
                   is_group: boolean,
                   has_pins: boolean | nil,
                   is_org_default: boolean | nil,
                   timezone_count: integer | nil,
                   is_read_only: boolean | nil,
                   use_case: binary | nil,
                   last_read: binary | nil,
                   creator: binary,
                   internal_team_ids: [binary] | nil,
                   is_general: boolean,
                   num_members: integer | nil,
                   is_mpim: boolean,
                   pin_count: integer | nil,
                   unread_count_display: integer | nil,
                   display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                   purpose: %{creator: binary, last_set: integer, value: binary},
                   members: [binary] | nil,
                   unlinked: integer | nil,
                   is_moved: integer | nil,
                   pending_connected_team_ids: [binary] | nil,
                   conversation_host_id: binary | nil,
                   is_private: boolean,
                   topic: %{creator: binary, last_set: integer, value: binary},
                   is_im: boolean,
                   name_normalized: binary,
                   is_starred: boolean | nil,
                   version: integer | nil,
                   is_channel: boolean,
                   enterprise_id: binary | nil,
                   shared_team_ids: [binary] | nil,
                   unread_count: integer | nil,
                   is_global_shared: boolean | nil,
                   is_pending_ext_shared: boolean | nil,
                   latest: Slack.ObjsMessage.t() | nil,
                   created: integer,
                   priority: number | nil,
                   is_non_threadable: boolean | nil,
                   previous_names: [binary] | nil,
                   is_open: boolean | nil,
                   is_thread_only: boolean | nil,
                   is_org_mandatory: boolean | nil,
                   connected_team_ids: [binary] | nil,
                   user: binary | nil,
                   is_ext_shared: boolean | nil,
                   is_frozen: boolean | nil,
                   pending_shared: [binary] | nil,
                   is_archived: boolean,
                   is_shared: boolean,
                   is_member: boolean | nil,
                   id: binary,
                   parent_conversation: binary | nil
                 }
                 | %{
                     accepted_user: binary | nil,
                     name: binary,
                     is_org_shared: boolean,
                     shares:
                       [
                         %{
                           accepted_user: binary | nil,
                           is_active: boolean,
                           team: Slack.ObjsTeam.t(),
                           user: binary
                         }
                       ]
                       | nil,
                     is_group: boolean,
                     timezone_count: integer | nil,
                     is_read_only: boolean | nil,
                     last_read: binary | nil,
                     creator: binary,
                     internal_team_ids: [binary] | nil,
                     is_general: boolean,
                     num_members: integer | nil,
                     is_mpim: boolean,
                     pin_count: integer | nil,
                     unread_count_display: integer | nil,
                     display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                     purpose: %{creator: binary, last_set: integer, value: binary},
                     members: [binary] | nil,
                     unlinked: integer | nil,
                     is_moved: integer | nil,
                     pending_connected_team_ids: [binary] | nil,
                     conversation_host_id: binary | nil,
                     is_private: boolean,
                     topic: %{creator: binary, last_set: integer, value: binary},
                     is_im: boolean,
                     name_normalized: binary,
                     is_starred: boolean | nil,
                     version: integer | nil,
                     is_channel: boolean,
                     shared_team_ids: [binary] | nil,
                     unread_count: integer | nil,
                     is_pending_ext_shared: boolean | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     created: integer,
                     priority: number | nil,
                     is_non_threadable: boolean | nil,
                     previous_names: [binary] | nil,
                     is_open: boolean | nil,
                     is_thread_only: boolean | nil,
                     connected_team_ids: [binary] | nil,
                     user: binary | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     pending_shared: [binary] | nil,
                     is_archived: boolean,
                     is_shared: boolean,
                     is_member: boolean | nil,
                     id: binary,
                     parent_conversation: binary | nil
                   }
                 | %{
                     created: integer,
                     has_pins: boolean | nil,
                     id: binary,
                     is_archived: boolean | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     is_im: boolean,
                     is_open: boolean | nil,
                     is_org_shared: boolean,
                     is_shared: boolean | nil,
                     is_starred: boolean | nil,
                     is_user_deleted: boolean | nil,
                     last_read: binary | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     parent_conversation: binary | nil,
                     pin_count: integer | nil,
                     priority: number,
                     shares:
                       [
                         %{
                           date_create: integer,
                           id: binary,
                           is_active: boolean,
                           name: binary,
                           team: Slack.ObjsTeam.t()
                         }
                       ]
                       | nil,
                     unread_count: integer | nil,
                     unread_count_display: integer | nil,
                     user: binary,
                     version: integer | nil
                   },
               ok: boolean,
               response_metadata: %{warnings: [binary] | nil} | nil,
               warning: binary | nil
             }}
            | {:error,
               %{
                 callstack: binary | nil,
                 error: binary,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
    def(conversations_join(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/conversations.join")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             channel: {:TODO, :OneOfDecode},
             ok: body["ok"],
             response_metadata: %{
               warnings:
                 case(body["response_metadata"]["warnings"]) do
                   nil ->
                     nil

                   _ ->
                     Enum.map(body["response_metadata"]["warnings"], fn item -> item end)
                 end
             },
             warning: body["warning"]
           }}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             error: body["error"],
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_join: 1)
  )

  (
    @doc "#{nil}
    
    #{"Lists stars for a user."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `stars:read`\n- `count`: \n- `page`: \n- `cursor`: Parameter for pagination. Set `cursor` equal to the `next_cursor` attribute returned by the previous request's `response_metadata`. This parameter is optional, but pagination is mandatory: the default value simply fetches the first \"page\" of the collection. See [pagination](/docs/pagination) for more details.\n- `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the list hasn't been reached.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/stars.list)"}
    "
    @spec stars_list(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               items: [
                 %{
                   channel: binary,
                   date_create: integer,
                   message: Slack.ObjsMessage.t(),
                   type: binary
                 }
                 | %{date_create: integer, file: Slack.ObjsFile.t(), type: binary}
                 | %{
                     comment: Slack.ObjsComment.t(),
                     date_create: integer,
                     file: Slack.ObjsFile.t(),
                     type: binary
                   }
                 | %{channel: binary, date_create: integer, type: binary}
               ],
               ok: boolean,
               paging: Slack.ObjsPaging.t() | nil
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt:
                 {:token, binary}
                 | {:count, binary}
                 | {:page, binary}
                 | {:cursor, binary}
                 | {:limit, integer}
    def(stars_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/stars.list",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              count: nil,
              page: nil,
              cursor: nil,
              limit: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             items: Enum.map(body["items"], fn item -> {:TODO, :OneOfDecode} end),
             ok: body["ok"],
             paging: Slack.ObjsPaging.decode(body["paging"])
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(stars_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Create a public or private channel-based conversation."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.create)"}
    "
    @spec admin_conversations_create(Tesla.Client.t()) ::
            {:ok, %{channel_id: binary | nil, ok: boolean}}
            | {:error, %{error: binary, ok: boolean}}
            | {:error, any}
    def(admin_conversations_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.conversations.create")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{channel_id: body["channel_id"], ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_create: 1)
  )

  (
    @doc "#{nil}
    
    #{"Sends an ephemeral message to a user in a channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/chat.postEphemeral)"}
    "
    @spec chat_post_ephemeral(Tesla.Client.t()) ::
            {:ok, %{message_ts: binary, ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(chat_post_ephemeral(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/chat.postEphemeral")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{message_ts: body["message_ts"], ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(chat_post_ephemeral: 1)
  )

  (
    @doc "#{nil}
    
    #{"Retrieves a user's profile information."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `users.profile:read`\n- `include_labels`: Include labels for each ID in custom profile fields\n- `user`: User to retrieve profile info for\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/users.profile.get)"}
    "
    @spec users_profile_get(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean, profile: Slack.ObjsUserProfile.t()}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:include_labels, boolean} | {:user, binary}
    def(users_profile_get(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/users.profile.get",
          query: Tesla.OpenApi.encode_query(query, token: nil, include_labels: nil, user: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"], profile: Slack.ObjsUserProfile.decode(body["profile"])}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(users_profile_get: 2)
  )

  (
    @doc "#{nil}
    
    #{"Closes a direct message or multi-person direct message."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.close)"}
    "
    @spec conversations_close(Tesla.Client.t()) ::
            {:ok, %{already_closed: boolean | nil, no_op: boolean | nil, ok: boolean}}
            | {:error,
               %{
                 callstack: binary | nil,
                 error: binary,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
    def(conversations_close(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/conversations.close")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{already_closed: body["already_closed"], no_op: body["no_op"], ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             error: body["error"],
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_close: 1)
  )

  (
    @doc "#{nil}
    
    #{"List restricted apps for an org or workspace."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `admin.apps:read`\n- `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.\n- `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page\n- `team_id`: \n- `enterprise_id`: \n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.apps.restricted.list)"}
    "
    @spec admin_apps_restricted_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt:
                 {:token, binary}
                 | {:limit, integer}
                 | {:cursor, binary}
                 | {:team_id, binary}
                 | {:enterprise_id, binary}
    def(admin_apps_restricted_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.apps.restricted.list",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              limit: nil,
              cursor: nil,
              team_id: nil,
              enterprise_id: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_apps_restricted_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Retrieve a thread of messages posted to a conversation"}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `conversations:history`\n- `channel`: Conversation ID to fetch thread from.\n- `ts`: Unique identifier of a thread's parent message. `ts` must be the timestamp of an existing message with 0 or more replies. If there are no replies then just the single message referenced by `ts` will return - it is just an ordinary, unthreaded message.\n- `latest`: End of time range of messages to include in results.\n- `oldest`: Start of time range of messages to include in results.\n- `inclusive`: Include messages with latest or oldest timestamp in results only when either timestamp is specified.\n- `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the users list hasn't been reached.\n- `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first \"page\" of the collection. See [pagination](/docs/pagination) for more detail.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.replies)"}
    "
    @spec conversations_replies(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               has_more: boolean | nil,
               messages: [
                 %{
                   last_read: binary | nil,
                   latest_reply: binary | nil,
                   reply_count: integer,
                   reply_users: [binary] | nil,
                   reply_users_count: integer | nil,
                   source_team: binary | nil,
                   subscribed: boolean,
                   team: binary | nil,
                   text: binary,
                   thread_ts: binary,
                   ts: binary,
                   type: binary,
                   unread_count: integer | nil,
                   user: binary,
                   user_profile: Slack.ObjsUserProfileShort.t() | nil,
                   user_team: binary | nil
                 }
                 | %{
                     is_starred: boolean | nil,
                     parent_user_id: binary,
                     source_team: binary | nil,
                     team: binary | nil,
                     text: binary,
                     thread_ts: binary,
                     ts: binary,
                     type: binary,
                     user: binary,
                     user_profile: Slack.ObjsUserProfileShort.t() | nil,
                     user_team: binary | nil
                   }
               ],
               ok: boolean
             }}
            | {:error,
               %{
                 callstack: binary | nil,
                 error: binary,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
          when opt:
                 {:token, binary}
                 | {:channel, binary}
                 | {:ts, number}
                 | {:latest, number}
                 | {:oldest, number}
                 | {:inclusive, boolean}
                 | {:limit, integer}
                 | {:cursor, binary}
    def(conversations_replies(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/conversations.replies",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              channel: nil,
              ts: nil,
              latest: nil,
              oldest: nil,
              inclusive: nil,
              limit: nil,
              cursor: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             has_more: body["has_more"],
             messages: Enum.map(body["messages"], fn item -> {:TODO, :OneOfDecode} end),
             ok: body["ok"]
           }}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             error: body["error"],
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_replies: 2)
  )

  (
    @doc "#{nil}
    
    #{"Sets the read cursor in a channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.mark)"}
    "
    @spec conversations_mark(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error,
               %{
                 callstack: binary | nil,
                 error: binary,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
    def(conversations_mark(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/conversations.mark")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             error: body["error"],
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_mark: 1)
  )

  (
    @doc "#{nil}
    
    #{"Push a view onto the stack of a root view."}
    
    #{"### Query parameters\n\n- `trigger_id`: Exchange a trigger to post to the user.\n- `view`: A [view payload](/reference/surfaces/views). This must be a JSON-encoded string.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/views.push)"}
    "
    @spec views_push(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:trigger_id, binary} | {:view, binary}
    def(views_push(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/views.push",
          query: Tesla.OpenApi.encode_query(query, trigger_id: nil, view: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(views_push: 2)
  )

  (
    @doc "#{nil}
    
    #{"Gets the integration logs for the current team."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `admin`\n- `app_id`: Filter logs to this Slack app. Defaults to all logs.\n- `change_type`: Filter logs with this change type. Defaults to all logs.\n- `count`: \n- `page`: \n- `service_id`: Filter logs to this service. Defaults to all logs.\n- `user`: Filter logs generated by this user’s actions. Defaults to all logs.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/team.integrationLogs)"}
    "
    @spec team_integration_logs(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               logs: [
                 %{
                   admin_app_id: binary | nil,
                   app_id: binary,
                   app_type: binary,
                   change_type: binary,
                   channel: binary | nil,
                   date: binary,
                   scope: binary,
                   service_id: binary | nil,
                   service_type: binary | nil,
                   user_id: binary,
                   user_name: binary
                 }
               ],
               ok: boolean,
               paging: Slack.ObjsPaging.t()
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt:
                 {:token, binary}
                 | {:app_id, binary}
                 | {:change_type, binary}
                 | {:count, binary}
                 | {:page, binary}
                 | {:service_id, binary}
                 | {:user, binary}
    def(team_integration_logs(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/team.integrationLogs",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              app_id: nil,
              change_type: nil,
              count: nil,
              page: nil,
              service_id: nil,
              user: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             logs:
               Enum.map(body["logs"], fn item ->
                 %{
                   admin_app_id: item["admin_app_id"],
                   app_id: item["app_id"],
                   app_type: item["app_type"],
                   change_type: item["change_type"],
                   channel: item["channel"],
                   date: item["date"],
                   scope: item["scope"],
                   service_id: item["service_id"],
                   service_type: item["service_type"],
                   user_id: item["user_id"],
                   user_name: item["user_name"]
                 }
               end),
             ok: body["ok"],
             paging: Slack.ObjsPaging.decode(body["paging"])
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(team_integration_logs: 2)
  )

  (
    @doc "#{nil}
    
    #{"Remove a linked IDP group linked from a private channel"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.restrictAccess.removeGroup)"}
    "
    @spec admin_conversations_restrict_access_remove_group(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_conversations_restrict_access_remove_group(client \\ new())) do
      case(
        Tesla.request(client,
          method: :post,
          url: "/admin.conversations.restrictAccess.removeGroup"
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_restrict_access_remove_group: 1)
  )

  (
    @doc "#{nil}
    
    #{"Set the name of a given workspace."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.teams.settings.setName)"}
    "
    @spec admin_teams_settings_set_name(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_teams_settings_set_name(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.teams.settings.setName")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_teams_settings_set_name: 1)
  )

  (
    @doc "#{nil}
    
    #{"Get all the workspaces a given public or private channel is connected to within this Enterprise org."}
    
    #{"### Query parameters\n\n- `channel_id`: The channel to determine connected workspaces within the organization for.\n- `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page\n- `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.getTeams)"}
    "
    @spec admin_conversations_get_teams(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{ok: boolean, response_metadata: %{next_cursor: binary} | nil, team_ids: [binary]}}
            | {:error, %{error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:channel_id, binary} | {:cursor, binary} | {:limit, integer}
    def(admin_conversations_get_teams(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.conversations.getTeams",
          query: Tesla.OpenApi.encode_query(query, channel_id: nil, cursor: nil, limit: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             ok: body["ok"],
             response_metadata: %{next_cursor: body["response_metadata"]["next_cursor"]},
             team_ids: Enum.map(body["team_ids"], fn item -> item end)
           }}

        {:ok, %{body: body}} ->
          {:error, %{error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_get_teams: 2)
  )

  (
    @doc "#{nil}
    
    #{"Set the default channels of a workspace."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.teams.settings.setDefaultChannels)"}
    "
    @spec admin_teams_settings_set_default_channels(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_teams_settings_set_default_channels(client \\ new())) do
      case(
        Tesla.request(client, method: :post, url: "/admin.teams.settings.setDefaultChannels")
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_teams_settings_set_default_channels: 1)
  )

  (
    @doc "#{nil}
    
    #{"Reverses conversation archival."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.unarchive)"}
    "
    @spec conversations_unarchive(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error,
               %{
                 callstack: binary | nil,
                 error: binary,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
    def(conversations_unarchive(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/conversations.unarchive")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             error: body["error"],
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_unarchive: 1)
  )

  (
    @doc "#{nil}
    
    #{"Un-pins an item from a channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/pins.remove)"}
    "
    @spec pins_remove(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(pins_remove(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/pins.remove")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(pins_remove: 1)
  )

  (
    @doc "#{nil}
    
    #{"Set an existing guest user, admin user, or owner to be a regular user."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.users.setRegular)"}
    "
    @spec admin_users_set_regular(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_users_set_regular(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.users.setRegular")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_users_set_regular: 1)
  )

  (
    @doc "#{nil}
    
    #{"Provide custom unfurl behavior for user-posted URLs"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/chat.unfurl)"}
    "
    @spec chat_unfurl(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(chat_unfurl(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/chat.unfurl")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(chat_unfurl: 1)
  )

  (
    @doc "#{nil}
    
    #{"Get a list of authorizations for the given event context. Each authorization represents an app installation that the event is visible to."}
    
    #{"### Query parameters\n\n- `event_context`: \n- `cursor`: \n- `limit`: \n"}
    
    #{"[API method documentation](https://api.slack.com/methods/apps.event.authorizations.list)"}
    "
    @spec apps_event_authorizations_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:event_context, binary} | {:cursor, binary} | {:limit, integer}
    def(apps_event_authorizations_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/apps.event.authorizations.list",
          query: Tesla.OpenApi.encode_query(query, event_context: nil, cursor: nil, limit: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(apps_event_authorizations_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Gets information about the current team."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `team:read`\n- `team`: Team to get info on, if omitted, will return information about the current team. Will only return team that the authenticated token is allowed to see through external shared channels\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/team.info)"}
    "
    @spec team_info(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean, team: Slack.ObjsTeam.t()}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:team, binary}
    def(team_info(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/team.info",
          query: Tesla.OpenApi.encode_query(query, token: nil, team: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"], team: Slack.ObjsTeam.decode(body["team"])}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(team_info: 2)
  )

  (
    @doc "#{nil}
    
    #{"Retrieve a permalink URL for a specific extant message"}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `none`\n- `channel`: The ID of the conversation or channel containing the message\n- `message_ts`: A message's `ts` value, uniquely identifying it within a channel\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/chat.getPermalink)"}
    "
    @spec chat_get_permalink(Tesla.Client.t(), [opt]) ::
            {:ok, %{channel: binary, ok: boolean, permalink: binary}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:channel, binary} | {:message_ts, binary}
    def(chat_get_permalink(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/chat.getPermalink",
          query: Tesla.OpenApi.encode_query(query, token: nil, channel: nil, message_ts: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{channel: body["channel"], ok: body["ok"], permalink: body["permalink"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(chat_get_permalink: 2)
  )

  (
    @doc "#{nil}
    
    #{"Rename a public or private channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.rename)"}
    "
    @spec admin_conversations_rename(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{error: binary, ok: boolean}} | {:error, any}
    def(admin_conversations_rename(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.conversations.rename")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_rename: 1)
  )

  (
    @doc "#{nil}
    
    #{"Renames a conversation."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.rename)"}
    "
    @spec conversations_rename(Tesla.Client.t()) ::
            {:ok,
             %{
               channel:
                 %{
                   accepted_user: binary | nil,
                   name: binary,
                   is_org_shared: boolean,
                   shares:
                     [
                       %{
                         accepted_user: binary | nil,
                         is_active: boolean,
                         team: Slack.ObjsTeam.t(),
                         user: binary
                       }
                     ]
                     | nil,
                   is_group: boolean,
                   has_pins: boolean | nil,
                   is_org_default: boolean | nil,
                   timezone_count: integer | nil,
                   is_read_only: boolean | nil,
                   use_case: binary | nil,
                   last_read: binary | nil,
                   creator: binary,
                   internal_team_ids: [binary] | nil,
                   is_general: boolean,
                   num_members: integer | nil,
                   is_mpim: boolean,
                   pin_count: integer | nil,
                   unread_count_display: integer | nil,
                   display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                   purpose: %{creator: binary, last_set: integer, value: binary},
                   members: [binary] | nil,
                   unlinked: integer | nil,
                   is_moved: integer | nil,
                   pending_connected_team_ids: [binary] | nil,
                   conversation_host_id: binary | nil,
                   is_private: boolean,
                   topic: %{creator: binary, last_set: integer, value: binary},
                   is_im: boolean,
                   name_normalized: binary,
                   is_starred: boolean | nil,
                   version: integer | nil,
                   is_channel: boolean,
                   enterprise_id: binary | nil,
                   shared_team_ids: [binary] | nil,
                   unread_count: integer | nil,
                   is_global_shared: boolean | nil,
                   is_pending_ext_shared: boolean | nil,
                   latest: Slack.ObjsMessage.t() | nil,
                   created: integer,
                   priority: number | nil,
                   is_non_threadable: boolean | nil,
                   previous_names: [binary] | nil,
                   is_open: boolean | nil,
                   is_thread_only: boolean | nil,
                   is_org_mandatory: boolean | nil,
                   connected_team_ids: [binary] | nil,
                   user: binary | nil,
                   is_ext_shared: boolean | nil,
                   is_frozen: boolean | nil,
                   pending_shared: [binary] | nil,
                   is_archived: boolean,
                   is_shared: boolean,
                   is_member: boolean | nil,
                   id: binary,
                   parent_conversation: binary | nil
                 }
                 | %{
                     accepted_user: binary | nil,
                     name: binary,
                     is_org_shared: boolean,
                     shares:
                       [
                         %{
                           accepted_user: binary | nil,
                           is_active: boolean,
                           team: Slack.ObjsTeam.t(),
                           user: binary
                         }
                       ]
                       | nil,
                     is_group: boolean,
                     timezone_count: integer | nil,
                     is_read_only: boolean | nil,
                     last_read: binary | nil,
                     creator: binary,
                     internal_team_ids: [binary] | nil,
                     is_general: boolean,
                     num_members: integer | nil,
                     is_mpim: boolean,
                     pin_count: integer | nil,
                     unread_count_display: integer | nil,
                     display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                     purpose: %{creator: binary, last_set: integer, value: binary},
                     members: [binary] | nil,
                     unlinked: integer | nil,
                     is_moved: integer | nil,
                     pending_connected_team_ids: [binary] | nil,
                     conversation_host_id: binary | nil,
                     is_private: boolean,
                     topic: %{creator: binary, last_set: integer, value: binary},
                     is_im: boolean,
                     name_normalized: binary,
                     is_starred: boolean | nil,
                     version: integer | nil,
                     is_channel: boolean,
                     shared_team_ids: [binary] | nil,
                     unread_count: integer | nil,
                     is_pending_ext_shared: boolean | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     created: integer,
                     priority: number | nil,
                     is_non_threadable: boolean | nil,
                     previous_names: [binary] | nil,
                     is_open: boolean | nil,
                     is_thread_only: boolean | nil,
                     connected_team_ids: [binary] | nil,
                     user: binary | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     pending_shared: [binary] | nil,
                     is_archived: boolean,
                     is_shared: boolean,
                     is_member: boolean | nil,
                     id: binary,
                     parent_conversation: binary | nil
                   }
                 | %{
                     created: integer,
                     has_pins: boolean | nil,
                     id: binary,
                     is_archived: boolean | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     is_im: boolean,
                     is_open: boolean | nil,
                     is_org_shared: boolean,
                     is_shared: boolean | nil,
                     is_starred: boolean | nil,
                     is_user_deleted: boolean | nil,
                     last_read: binary | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     parent_conversation: binary | nil,
                     pin_count: integer | nil,
                     priority: number,
                     shares:
                       [
                         %{
                           date_create: integer,
                           id: binary,
                           is_active: boolean,
                           name: binary,
                           team: Slack.ObjsTeam.t()
                         }
                       ]
                       | nil,
                     unread_count: integer | nil,
                     unread_count_display: integer | nil,
                     user: binary,
                     version: integer | nil
                   },
               ok: boolean
             }}
            | {:error,
               %{
                 callstack: binary | nil,
                 error: binary,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
    def(conversations_rename(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/conversations.rename")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{channel: {:TODO, :OneOfDecode}, ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             error: body["error"],
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_rename: 1)
  )

  (
    @doc "#{nil}
    
    #{"Retrieves the Do Not Disturb status for up to 50 users on a team."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `dnd:read`\n- `users`: Comma-separated list of users to fetch Do Not Disturb status for\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/dnd.teamInfo)"}
    "
    @spec dnd_team_info(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:token, binary} | {:users, binary}
    def(dnd_team_info(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/dnd.teamInfo",
          query: Tesla.OpenApi.encode_query(query, token: nil, users: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(dnd_team_info: 2)
  )

  (
    @doc "#{nil}
    
    #{"Ends the current user's snooze mode immediately."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/dnd.endSnooze)"}
    "
    @spec dnd_end_snooze(Tesla.Client.t()) ::
            {:ok,
             %{
               dnd_enabled: boolean,
               next_dnd_end_ts: integer,
               next_dnd_start_ts: integer,
               ok: boolean,
               snooze_enabled: boolean
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(dnd_end_snooze(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/dnd.endSnooze")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             dnd_enabled: body["dnd_enabled"],
             next_dnd_end_ts: body["next_dnd_end_ts"],
             next_dnd_start_ts: body["next_dnd_start_ts"],
             ok: body["ok"],
             snooze_enabled: body["snooze_enabled"]
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(dnd_end_snooze: 1)
  )

  (
    @doc "#{nil}
    
    #{"Adds a reaction to an item."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/reactions.add)"}
    "
    @spec reactions_add(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(reactions_add(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/reactions.add")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(reactions_add: 1)
  )

  (
    @doc "#{nil}
    
    #{"Gets information about a bot user."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `users:read`\n- `bot`: Bot user to get info on\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/bots.info)"}
    "
    @spec bots_info(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               bot: %{
                 app_id: binary,
                 deleted: boolean,
                 icons: %{image_36: binary, image_48: binary, image_72: binary},
                 id: binary,
                 name: binary,
                 updated: integer,
                 user_id: binary | nil
               },
               ok: boolean
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:bot, binary}
    def(bots_info(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/bots.info",
          query: Tesla.OpenApi.encode_query(query, token: nil, bot: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             bot: %{
               app_id: body["bot"]["app_id"],
               deleted: body["bot"]["deleted"],
               icons: %{
                 image_36: body["bot"]["icons"]["image_36"],
                 image_48: body["bot"]["icons"]["image_48"],
                 image_72: body["bot"]["icons"]["image_72"]
               },
               id: body["bot"]["id"],
               name: body["bot"]["name"],
               updated: body["bot"]["updated"],
               user_id: body["bot"]["user_id"]
             },
             ok: body["ok"]
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(bots_info: 2)
  )

  (
    @doc "#{nil}
    
    #{"Retrieve members of a conversation."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `conversations:read`\n- `channel`: ID of the conversation to retrieve members for\n- `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the users list hasn't been reached.\n- `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first \"page\" of the collection. See [pagination](/docs/pagination) for more detail.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.members)"}
    "
    @spec conversations_members(Tesla.Client.t(), [opt]) ::
            {:ok, %{members: [binary], ok: boolean, response_metadata: %{next_cursor: binary}}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:channel, binary} | {:limit, integer} | {:cursor, binary}
    def(conversations_members(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/conversations.members",
          query:
            Tesla.OpenApi.encode_query(query, token: nil, channel: nil, limit: nil, cursor: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             members: Enum.map(body["members"], fn item -> item end),
             ok: body["ok"],
             response_metadata: %{next_cursor: body["response_metadata"]["next_cursor"]}
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_members: 2)
  )

  (
    @doc "#{nil}
    
    #{"Gets information about a reminder."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `reminders:read`\n- `reminder`: The ID of the reminder\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/reminders.info)"}
    "
    @spec reminders_info(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean, reminder: Slack.ObjsReminder.t()}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:reminder, binary}
    def(reminders_info(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/reminders.info",
          query: Tesla.OpenApi.encode_query(query, token: nil, reminder: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"], reminder: Slack.ObjsReminder.decode(body["reminder"])}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(reminders_info: 2)
  )

  (
    @doc "#{nil}
    
    #{"Deletes a reminder."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/reminders.delete)"}
    "
    @spec reminders_delete(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(reminders_delete(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/reminders.delete")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(reminders_delete: 1)
  )

  (
    @doc "#{nil}
    
    #{"Revokes a token."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `none`\n- `test`: Setting this parameter to `1` triggers a _testing mode_ where the specified token will not actually be revoked.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/auth.revoke)"}
    "
    @spec auth_revoke(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean, revoked: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:test, boolean}
    def(auth_revoke(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/auth.revoke",
          query: Tesla.OpenApi.encode_query(query, token: nil, test: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"], revoked: body["revoked"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(auth_revoke: 2)
  )

  (
    @doc "#{nil}
    
    #{"Returns list of scopes this app has on a team."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `none`\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/apps.permissions.scopes.list)"}
    "
    @spec apps_permissions_scopes_list(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               ok: boolean,
               scopes: %{
                 app_home: [binary] | nil,
                 channel: [binary] | nil,
                 group: [binary] | nil,
                 im: [binary] | nil,
                 mpim: [binary] | nil,
                 team: [binary] | nil,
                 user: [binary] | nil
               }
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary}
    def(apps_permissions_scopes_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/apps.permissions.scopes.list",
          query: Tesla.OpenApi.encode_query(query, token: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             ok: body["ok"],
             scopes: %{
               app_home: Enum.map(body["scopes"]["app_home"], fn item -> item end),
               channel: Enum.map(body["scopes"]["channel"], fn item -> item end),
               group: Enum.map(body["scopes"]["group"], fn item -> item end),
               im: Enum.map(body["scopes"]["im"], fn item -> item end),
               mpim: Enum.map(body["scopes"]["mpim"], fn item -> item end),
               team: Enum.map(body["scopes"]["team"], fn item -> item end),
               user: Enum.map(body["scopes"]["user"], fn item -> item end)
             }
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(apps_permissions_scopes_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Lists custom emoji for a team."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `emoji:read`\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/emoji.list)"}
    "
    @spec emoji_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:token, binary}
    def(emoji_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/emoji.list",
          query: Tesla.OpenApi.encode_query(query, token: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(emoji_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Exchanges a temporary OAuth verifier code for an access token."}
    
    #{"### Query parameters\n\n- `client_id`: Issued when you created your application.\n- `client_secret`: Issued when you created your application.\n- `code`: The `code` param returned via the OAuth callback.\n- `redirect_uri`: This must match the originally submitted URI (if one was sent).\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/oauth.v2.access)"}
    "
    @spec oauth_v2_access(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt:
                 {:client_id, binary}
                 | {:client_secret, binary}
                 | {:code, binary}
                 | {:redirect_uri, binary}
    def(oauth_v2_access(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/oauth.v2.access",
          query:
            Tesla.OpenApi.encode_query(query,
              client_id: nil,
              client_secret: nil,
              code: nil,
              redirect_uri: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(oauth_v2_access: 2)
  )

  (
    @doc "#{nil}
    
    #{"Searches for messages matching a query."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `search:read`\n- `count`: Pass the number of results you want per \"page\". Maximum of `100`.\n- `highlight`: Pass a value of `true` to enable query highlight markers (see below).\n- `page`: \n- `query`: Search query.\n- `sort`: Return matches sorted by either `score` or `timestamp`.\n- `sort_dir`: Change sort direction to ascending (`asc`) or descending (`desc`).\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/search.messages)"}
    "
    @spec search_messages(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt:
                 {:token, binary}
                 | {:count, integer}
                 | {:highlight, boolean}
                 | {:page, integer}
                 | {:query, binary}
                 | {:sort, binary}
                 | {:sort_dir, binary}
    def(search_messages(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/search.messages",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              count: nil,
              highlight: nil,
              page: nil,
              query: nil,
              sort: nil,
              sort_dir: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(search_messages: 2)
  )

  (
    @doc "#{nil}
    
    #{"Checks authentication & identity."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/auth.test)"}
    "
    @spec auth_test(Tesla.Client.t()) ::
            {:ok,
             %{
               bot_id: binary | nil,
               is_enterprise_install: boolean | nil,
               ok: boolean,
               team: binary,
               team_id: binary,
               url: binary,
               user: binary,
               user_id: binary
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(auth_test(client \\ new())) do
      case(Tesla.request(client, method: :get, url: "/auth.test")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             bot_id: body["bot_id"],
             is_enterprise_install: body["is_enterprise_install"],
             ok: body["ok"],
             team: body["team"],
             team_id: body["team_id"],
             url: body["url"],
             user: body["user"],
             user_id: body["user_id"]
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(auth_test: 1)
  )

  (
    @doc "#{nil}
    
    #{"An API method that allows admins to set the discoverability of a given workspace"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.teams.settings.setDiscoverability)"}
    "
    @spec admin_teams_settings_set_discoverability(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_teams_settings_set_discoverability(client \\ new())) do
      case(
        Tesla.request(client, method: :post, url: "/admin.teams.settings.setDiscoverability")
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_teams_settings_set_discoverability: 1)
  )

  (
    @doc "#{nil}
    
    #{"Fetches a conversation's history of messages and events."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `conversations:history`\n- `channel`: Conversation ID to fetch history for.\n- `latest`: End of time range of messages to include in results.\n- `oldest`: Start of time range of messages to include in results.\n- `inclusive`: Include messages with latest or oldest timestamp in results only when either timestamp is specified.\n- `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the users list hasn't been reached.\n- `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first \"page\" of the collection. See [pagination](/docs/pagination) for more detail.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.history)"}
    "
    @spec conversations_history(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               channel_actions_count: integer,
               channel_actions_ts: integer,
               has_more: boolean,
               messages: [Slack.ObjsMessage.t()],
               ok: boolean,
               pin_count: integer
             }}
            | {:error,
               %{
                 callstack: binary | nil,
                 error: binary,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
          when opt:
                 {:token, binary}
                 | {:channel, binary}
                 | {:latest, number}
                 | {:oldest, number}
                 | {:inclusive, boolean}
                 | {:limit, integer}
                 | {:cursor, binary}
    def(conversations_history(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/conversations.history",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              channel: nil,
              latest: nil,
              oldest: nil,
              inclusive: nil,
              limit: nil,
              cursor: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             channel_actions_count: body["channel_actions_count"],
             channel_actions_ts: body["channel_actions_ts"],
             has_more: body["has_more"],
             messages: Enum.map(body["messages"], fn item -> Slack.ObjsMessage.decode(item) end),
             ok: body["ok"],
             pin_count: body["pin_count"]
           }}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             error: body["error"],
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_history: 2)
  )

  (
    @doc "#{nil}
    
    #{"Get a user's identity."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `identity.basic`\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/users.identity)"}
    "
    @spec users_identity(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{ok: boolean, team: %{id: binary}, user: %{id: binary, name: binary}}
             | %{
                 ok: boolean,
                 team: %{id: binary},
                 user: %{email: binary, id: binary, name: binary}
               }
             | %{
                 ok: boolean,
                 team: %{id: binary},
                 user: %{
                   id: binary,
                   image_192: binary,
                   image_24: binary,
                   image_32: binary,
                   image_48: binary,
                   image_512: binary,
                   image_72: binary,
                   name: binary
                 }
               }
             | %{
                 ok: boolean,
                 team: %{
                   domain: binary,
                   id: binary,
                   image_102: binary,
                   image_132: binary,
                   image_230: binary,
                   image_34: binary,
                   image_44: binary,
                   image_68: binary,
                   image_88: binary,
                   image_default: boolean,
                   name: binary
                 },
                 user: %{id: binary, name: binary}
               }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary}
    def(users_identity(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/users.identity",
          query: Tesla.OpenApi.encode_query(query, token: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, {:TODO, :OneOfDecode}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(users_identity: 2)
  )

  (
    @doc "#{nil}
    
    #{"Share a me message into a channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/chat.meMessage)"}
    "
    @spec chat_me_message(Tesla.Client.t()) ::
            {:ok, %{channel: binary | nil, ok: boolean, ts: binary | nil}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(chat_me_message(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/chat.meMessage")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{channel: body["channel"], ok: body["ok"], ts: body["ts"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(chat_me_message: 1)
  )

  (
    @doc "#{nil}
    
    #{"Sets the purpose for a conversation."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.setPurpose)"}
    "
    @spec conversations_set_purpose(Tesla.Client.t()) ::
            {:ok,
             %{
               channel:
                 %{
                   accepted_user: binary | nil,
                   name: binary,
                   is_org_shared: boolean,
                   shares:
                     [
                       %{
                         accepted_user: binary | nil,
                         is_active: boolean,
                         team: Slack.ObjsTeam.t(),
                         user: binary
                       }
                     ]
                     | nil,
                   is_group: boolean,
                   has_pins: boolean | nil,
                   is_org_default: boolean | nil,
                   timezone_count: integer | nil,
                   is_read_only: boolean | nil,
                   use_case: binary | nil,
                   last_read: binary | nil,
                   creator: binary,
                   internal_team_ids: [binary] | nil,
                   is_general: boolean,
                   num_members: integer | nil,
                   is_mpim: boolean,
                   pin_count: integer | nil,
                   unread_count_display: integer | nil,
                   display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                   purpose: %{creator: binary, last_set: integer, value: binary},
                   members: [binary] | nil,
                   unlinked: integer | nil,
                   is_moved: integer | nil,
                   pending_connected_team_ids: [binary] | nil,
                   conversation_host_id: binary | nil,
                   is_private: boolean,
                   topic: %{creator: binary, last_set: integer, value: binary},
                   is_im: boolean,
                   name_normalized: binary,
                   is_starred: boolean | nil,
                   version: integer | nil,
                   is_channel: boolean,
                   enterprise_id: binary | nil,
                   shared_team_ids: [binary] | nil,
                   unread_count: integer | nil,
                   is_global_shared: boolean | nil,
                   is_pending_ext_shared: boolean | nil,
                   latest: Slack.ObjsMessage.t() | nil,
                   created: integer,
                   priority: number | nil,
                   is_non_threadable: boolean | nil,
                   previous_names: [binary] | nil,
                   is_open: boolean | nil,
                   is_thread_only: boolean | nil,
                   is_org_mandatory: boolean | nil,
                   connected_team_ids: [binary] | nil,
                   user: binary | nil,
                   is_ext_shared: boolean | nil,
                   is_frozen: boolean | nil,
                   pending_shared: [binary] | nil,
                   is_archived: boolean,
                   is_shared: boolean,
                   is_member: boolean | nil,
                   id: binary,
                   parent_conversation: binary | nil
                 }
                 | %{
                     accepted_user: binary | nil,
                     name: binary,
                     is_org_shared: boolean,
                     shares:
                       [
                         %{
                           accepted_user: binary | nil,
                           is_active: boolean,
                           team: Slack.ObjsTeam.t(),
                           user: binary
                         }
                       ]
                       | nil,
                     is_group: boolean,
                     timezone_count: integer | nil,
                     is_read_only: boolean | nil,
                     last_read: binary | nil,
                     creator: binary,
                     internal_team_ids: [binary] | nil,
                     is_general: boolean,
                     num_members: integer | nil,
                     is_mpim: boolean,
                     pin_count: integer | nil,
                     unread_count_display: integer | nil,
                     display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                     purpose: %{creator: binary, last_set: integer, value: binary},
                     members: [binary] | nil,
                     unlinked: integer | nil,
                     is_moved: integer | nil,
                     pending_connected_team_ids: [binary] | nil,
                     conversation_host_id: binary | nil,
                     is_private: boolean,
                     topic: %{creator: binary, last_set: integer, value: binary},
                     is_im: boolean,
                     name_normalized: binary,
                     is_starred: boolean | nil,
                     version: integer | nil,
                     is_channel: boolean,
                     shared_team_ids: [binary] | nil,
                     unread_count: integer | nil,
                     is_pending_ext_shared: boolean | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     created: integer,
                     priority: number | nil,
                     is_non_threadable: boolean | nil,
                     previous_names: [binary] | nil,
                     is_open: boolean | nil,
                     is_thread_only: boolean | nil,
                     connected_team_ids: [binary] | nil,
                     user: binary | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     pending_shared: [binary] | nil,
                     is_archived: boolean,
                     is_shared: boolean,
                     is_member: boolean | nil,
                     id: binary,
                     parent_conversation: binary | nil
                   }
                 | %{
                     created: integer,
                     has_pins: boolean | nil,
                     id: binary,
                     is_archived: boolean | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     is_im: boolean,
                     is_open: boolean | nil,
                     is_org_shared: boolean,
                     is_shared: boolean | nil,
                     is_starred: boolean | nil,
                     is_user_deleted: boolean | nil,
                     last_read: binary | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     parent_conversation: binary | nil,
                     pin_count: integer | nil,
                     priority: number,
                     shares:
                       [
                         %{
                           date_create: integer,
                           id: binary,
                           is_active: boolean,
                           name: binary,
                           team: Slack.ObjsTeam.t()
                         }
                       ]
                       | nil,
                     unread_count: integer | nil,
                     unread_count_display: integer | nil,
                     user: binary,
                     version: integer | nil
                   },
               ok: boolean
             }}
            | {:error,
               %{
                 callstack: binary | nil,
                 error: binary,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
    def(conversations_set_purpose(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/conversations.setPurpose")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{channel: {:TODO, :OneOfDecode}, ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             error: body["error"],
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_set_purpose: 1)
  )

  (
    @doc "#{nil}
    
    #{"Returns list of permissions this app has on a team."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `none`\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/apps.permissions.info)"}
    "
    @spec apps_permissions_info(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               info: %{
                 app_home: %{resources: Slack.ObjsResources.t() | nil, scopes: [binary] | nil},
                 channel: %{resources: Slack.ObjsResources.t() | nil, scopes: [binary] | nil},
                 group: %{resources: Slack.ObjsResources.t() | nil, scopes: [binary] | nil},
                 im: %{resources: Slack.ObjsResources.t() | nil, scopes: [binary] | nil},
                 mpim: %{resources: Slack.ObjsResources.t() | nil, scopes: [binary] | nil},
                 team: %{resources: Slack.ObjsResources.t(), scopes: [binary]}
               },
               ok: boolean
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary}
    def(apps_permissions_info(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/apps.permissions.info",
          query: Tesla.OpenApi.encode_query(query, token: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             info: %{
               app_home: %{
                 resources: Slack.ObjsResources.decode(body["info"]["app_home"]["resources"]),
                 scopes: Enum.map(body["info"]["app_home"]["scopes"], fn item -> item end)
               },
               channel: %{
                 resources: Slack.ObjsResources.decode(body["info"]["channel"]["resources"]),
                 scopes: Enum.map(body["info"]["channel"]["scopes"], fn item -> item end)
               },
               group: %{
                 resources: Slack.ObjsResources.decode(body["info"]["group"]["resources"]),
                 scopes: Enum.map(body["info"]["group"]["scopes"], fn item -> item end)
               },
               im: %{
                 resources: Slack.ObjsResources.decode(body["info"]["im"]["resources"]),
                 scopes: Enum.map(body["info"]["im"]["scopes"], fn item -> item end)
               },
               mpim: %{
                 resources: Slack.ObjsResources.decode(body["info"]["mpim"]["resources"]),
                 scopes: Enum.map(body["info"]["mpim"]["scopes"], fn item -> item end)
               },
               team: %{
                 resources: Slack.ObjsResources.decode(body["info"]["team"]["resources"]),
                 scopes: Enum.map(body["info"]["team"]["scopes"], fn item -> item end)
               }
             },
             ok: body["ok"]
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(apps_permissions_info: 2)
  )

  (
    @doc "#{nil}
    
    #{"List approved apps for an org or workspace."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `admin.apps:read`\n- `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.\n- `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page\n- `team_id`: \n- `enterprise_id`: \n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.apps.approved.list)"}
    "
    @spec admin_apps_approved_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt:
                 {:token, binary}
                 | {:limit, integer}
                 | {:cursor, binary}
                 | {:team_id, binary}
                 | {:enterprise_id, binary}
    def(admin_apps_approved_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.apps.approved.list",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              limit: nil,
              cursor: nil,
              team_id: nil,
              enterprise_id: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_apps_approved_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"List all users in a User Group"}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `usergroups:read`\n- `include_disabled`: Allow results that involve disabled User Groups.\n- `usergroup`: The encoded ID of the User Group to update.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/usergroups.users.list)"}
    "
    @spec usergroups_users_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean, users: [binary]}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:include_disabled, boolean} | {:usergroup, binary}
    def(usergroups_users_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/usergroups.users.list",
          query:
            Tesla.OpenApi.encode_query(query, token: nil, include_disabled: nil, usergroup: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"], users: Enum.map(body["users"], fn item -> item end)}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(usergroups_users_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"List conversations the calling user may access."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `conversations:read`\n- `user`: Browse conversations by a specific user ID's membership. Non-public channels are restricted to those where the calling user shares membership.\n- `types`: Mix and match channel types by providing a comma-separated list of any combination of `public_channel`, `private_channel`, `mpim`, `im`\n- `exclude_archived`: Set to `true` to exclude archived channels from the list\n- `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the list hasn't been reached. Must be an integer no larger than 1000.\n- `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first \"page\" of the collection. See [pagination](/docs/pagination) for more detail.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/users.conversations)"}
    "
    @spec users_conversations(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               channels: [
                 %{
                   accepted_user: binary | nil,
                   name: binary,
                   is_org_shared: boolean,
                   shares:
                     [
                       %{
                         accepted_user: binary | nil,
                         is_active: boolean,
                         team: Slack.ObjsTeam.t(),
                         user: binary
                       }
                     ]
                     | nil,
                   is_group: boolean,
                   has_pins: boolean | nil,
                   is_org_default: boolean | nil,
                   timezone_count: integer | nil,
                   is_read_only: boolean | nil,
                   use_case: binary | nil,
                   last_read: binary | nil,
                   creator: binary,
                   internal_team_ids: [binary] | nil,
                   is_general: boolean,
                   num_members: integer | nil,
                   is_mpim: boolean,
                   pin_count: integer | nil,
                   unread_count_display: integer | nil,
                   display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                   purpose: %{creator: binary, last_set: integer, value: binary},
                   members: [binary] | nil,
                   unlinked: integer | nil,
                   is_moved: integer | nil,
                   pending_connected_team_ids: [binary] | nil,
                   conversation_host_id: binary | nil,
                   is_private: boolean,
                   topic: %{creator: binary, last_set: integer, value: binary},
                   is_im: boolean,
                   name_normalized: binary,
                   is_starred: boolean | nil,
                   version: integer | nil,
                   is_channel: boolean,
                   enterprise_id: binary | nil,
                   shared_team_ids: [binary] | nil,
                   unread_count: integer | nil,
                   is_global_shared: boolean | nil,
                   is_pending_ext_shared: boolean | nil,
                   latest: Slack.ObjsMessage.t() | nil,
                   created: integer,
                   priority: number | nil,
                   is_non_threadable: boolean | nil,
                   previous_names: [binary] | nil,
                   is_open: boolean | nil,
                   is_thread_only: boolean | nil,
                   is_org_mandatory: boolean | nil,
                   connected_team_ids: [binary] | nil,
                   user: binary | nil,
                   is_ext_shared: boolean | nil,
                   is_frozen: boolean | nil,
                   pending_shared: [binary] | nil,
                   is_archived: boolean,
                   is_shared: boolean,
                   is_member: boolean | nil,
                   id: binary,
                   parent_conversation: binary | nil
                 }
                 | %{
                     accepted_user: binary | nil,
                     name: binary,
                     is_org_shared: boolean,
                     shares:
                       [
                         %{
                           accepted_user: binary | nil,
                           is_active: boolean,
                           team: Slack.ObjsTeam.t(),
                           user: binary
                         }
                       ]
                       | nil,
                     is_group: boolean,
                     timezone_count: integer | nil,
                     is_read_only: boolean | nil,
                     last_read: binary | nil,
                     creator: binary,
                     internal_team_ids: [binary] | nil,
                     is_general: boolean,
                     num_members: integer | nil,
                     is_mpim: boolean,
                     pin_count: integer | nil,
                     unread_count_display: integer | nil,
                     display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                     purpose: %{creator: binary, last_set: integer, value: binary},
                     members: [binary] | nil,
                     unlinked: integer | nil,
                     is_moved: integer | nil,
                     pending_connected_team_ids: [binary] | nil,
                     conversation_host_id: binary | nil,
                     is_private: boolean,
                     topic: %{creator: binary, last_set: integer, value: binary},
                     is_im: boolean,
                     name_normalized: binary,
                     is_starred: boolean | nil,
                     version: integer | nil,
                     is_channel: boolean,
                     shared_team_ids: [binary] | nil,
                     unread_count: integer | nil,
                     is_pending_ext_shared: boolean | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     created: integer,
                     priority: number | nil,
                     is_non_threadable: boolean | nil,
                     previous_names: [binary] | nil,
                     is_open: boolean | nil,
                     is_thread_only: boolean | nil,
                     connected_team_ids: [binary] | nil,
                     user: binary | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     pending_shared: [binary] | nil,
                     is_archived: boolean,
                     is_shared: boolean,
                     is_member: boolean | nil,
                     id: binary,
                     parent_conversation: binary | nil
                   }
                 | %{
                     created: integer,
                     has_pins: boolean | nil,
                     id: binary,
                     is_archived: boolean | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     is_im: boolean,
                     is_open: boolean | nil,
                     is_org_shared: boolean,
                     is_shared: boolean | nil,
                     is_starred: boolean | nil,
                     is_user_deleted: boolean | nil,
                     last_read: binary | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     parent_conversation: binary | nil,
                     pin_count: integer | nil,
                     priority: number,
                     shares:
                       [
                         %{
                           date_create: integer,
                           id: binary,
                           is_active: boolean,
                           name: binary,
                           team: Slack.ObjsTeam.t()
                         }
                       ]
                       | nil,
                     unread_count: integer | nil,
                     unread_count_display: integer | nil,
                     user: binary,
                     version: integer | nil
                   }
               ],
               ok: boolean,
               response_metadata: %{next_cursor: binary} | nil
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt:
                 {:token, binary}
                 | {:user, binary}
                 | {:types, binary}
                 | {:exclude_archived, boolean}
                 | {:limit, integer}
                 | {:cursor, binary}
    def(users_conversations(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/users.conversations",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              user: nil,
              types: nil,
              exclude_archived: nil,
              limit: nil,
              cursor: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             channels: Enum.map(body["channels"], fn item -> {:TODO, :OneOfDecode} end),
             ok: body["ok"],
             response_metadata: %{next_cursor: body["response_metadata"]["next_cursor"]}
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(users_conversations: 2)
  )

  (
    @doc "#{nil}
    
    #{"Associate one or more default workspaces with an organization-wide IDP group."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.usergroups.addTeams)"}
    "
    @spec admin_usergroups_add_teams(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_usergroups_add_teams(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.usergroups.addTeams")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_usergroups_add_teams: 1)
  )

  (
    @doc "#{nil}
    
    #{"Wipes all valid sessions on all devices for a given user"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.users.session.reset)"}
    "
    @spec admin_users_session_reset(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_users_session_reset(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.users.session.reset")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_users_session_reset: 1)
  )

  (
    @doc "#{nil}
    
    #{"Add an Enterprise user to a workspace."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.users.assign)"}
    "
    @spec admin_users_assign(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_users_assign(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.users.assign")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_users_assign: 1)
  )

  (
    @doc "#{nil}
    
    #{"Lists all users in a Slack team."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `users:read`\n- `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the users list hasn't been reached. Providing no `limit` value will result in Slack attempting to deliver you the entire result set. If the collection is too large you may experience `limit_required` or HTTP 500 errors.\n- `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first \"page\" of the collection. See [pagination](/docs/pagination) for more detail.\n- `include_locale`: Set this to `true` to receive the locale for users. Defaults to `false`\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/users.list)"}
    "
    @spec users_list(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               cache_ts: integer,
               members: [
                 %{
                   color: binary | nil,
                   deleted: boolean | nil,
                   enterprise_user: Slack.ObjsEnterpriseUser.t() | nil,
                   has_2fa: boolean | nil,
                   id: binary,
                   is_admin: boolean | nil,
                   is_app_user: boolean,
                   is_bot: boolean,
                   is_external: boolean | nil,
                   is_forgotten: boolean | nil,
                   is_invited_user: boolean | nil,
                   is_owner: boolean | nil,
                   is_primary_owner: boolean | nil,
                   is_restricted: boolean | nil,
                   is_stranger: boolean | nil,
                   is_ultra_restricted: boolean | nil,
                   locale: binary | nil,
                   name: binary,
                   presence: binary | nil,
                   profile: Slack.ObjsUserProfile.t(),
                   real_name: binary | nil,
                   team: binary | nil,
                   team_id: binary | nil,
                   team_profile: %{fields: [Slack.ObjsTeamProfileField.t()]} | nil,
                   two_factor_type: binary | nil,
                   tz: binary | nil,
                   tz_label: binary | nil,
                   tz_offset: number | nil,
                   updated: number
                 }
                 | %{
                     color: binary | nil,
                     deleted: boolean | nil,
                     enterprise_user: Slack.ObjsEnterpriseUser.t() | nil,
                     has_2fa: boolean | nil,
                     id: binary,
                     is_admin: boolean | nil,
                     is_app_user: boolean,
                     is_bot: boolean,
                     is_external: boolean | nil,
                     is_forgotten: boolean | nil,
                     is_owner: boolean | nil,
                     is_primary_owner: boolean | nil,
                     is_restricted: boolean | nil,
                     is_stranger: boolean | nil,
                     is_ultra_restricted: boolean | nil,
                     locale: binary | nil,
                     name: binary,
                     presence: binary | nil,
                     profile: Slack.ObjsUserProfile.t(),
                     real_name: binary | nil,
                     team_id: binary | nil,
                     team_profile: %{fields: [Slack.ObjsTeamProfileField.t()]} | nil,
                     teams: [binary] | nil,
                     two_factor_type: binary | nil,
                     tz: binary | nil,
                     tz_label: binary | nil,
                     tz_offset: number | nil,
                     updated: number
                   }
               ],
               ok: boolean,
               response_metadata:
                 %{next_cursor: binary}
                 | %{messages: [binary], warnings: [binary]}
                 | %{messages: [binary], next_cursor: binary, warnings: [binary]}
                 | nil
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt:
                 {:token, binary}
                 | {:limit, integer}
                 | {:cursor, binary}
                 | {:include_locale, boolean}
    def(users_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/users.list",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              limit: nil,
              cursor: nil,
              include_locale: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             cache_ts: body["cache_ts"],
             members: Enum.map(body["members"], fn item -> {:TODO, :OneOfDecode} end),
             ok: body["ok"],
             response_metadata: {:TODO, :OneOfDecode}
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(users_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Sets the icon of a workspace."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.teams.settings.setIcon)"}
    "
    @spec admin_teams_settings_set_icon(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_teams_settings_set_icon(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.teams.settings.setIcon")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_teams_settings_set_icon: 1)
  )

  (
    @doc "#{nil}
    
    #{"Add one or more default channels to an IDP group."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.usergroups.addChannels)"}
    "
    @spec admin_usergroups_add_channels(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_usergroups_add_channels(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.usergroups.addChannels")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_usergroups_add_channels: 1)
  )

  (
    @doc "#{nil}
    
    #{"Sets the topic for a conversation."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.setTopic)"}
    "
    @spec conversations_set_topic(Tesla.Client.t()) ::
            {:ok,
             %{
               channel:
                 %{
                   accepted_user: binary | nil,
                   name: binary,
                   is_org_shared: boolean,
                   shares:
                     [
                       %{
                         accepted_user: binary | nil,
                         is_active: boolean,
                         team: Slack.ObjsTeam.t(),
                         user: binary
                       }
                     ]
                     | nil,
                   is_group: boolean,
                   has_pins: boolean | nil,
                   is_org_default: boolean | nil,
                   timezone_count: integer | nil,
                   is_read_only: boolean | nil,
                   use_case: binary | nil,
                   last_read: binary | nil,
                   creator: binary,
                   internal_team_ids: [binary] | nil,
                   is_general: boolean,
                   num_members: integer | nil,
                   is_mpim: boolean,
                   pin_count: integer | nil,
                   unread_count_display: integer | nil,
                   display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                   purpose: %{creator: binary, last_set: integer, value: binary},
                   members: [binary] | nil,
                   unlinked: integer | nil,
                   is_moved: integer | nil,
                   pending_connected_team_ids: [binary] | nil,
                   conversation_host_id: binary | nil,
                   is_private: boolean,
                   topic: %{creator: binary, last_set: integer, value: binary},
                   is_im: boolean,
                   name_normalized: binary,
                   is_starred: boolean | nil,
                   version: integer | nil,
                   is_channel: boolean,
                   enterprise_id: binary | nil,
                   shared_team_ids: [binary] | nil,
                   unread_count: integer | nil,
                   is_global_shared: boolean | nil,
                   is_pending_ext_shared: boolean | nil,
                   latest: Slack.ObjsMessage.t() | nil,
                   created: integer,
                   priority: number | nil,
                   is_non_threadable: boolean | nil,
                   previous_names: [binary] | nil,
                   is_open: boolean | nil,
                   is_thread_only: boolean | nil,
                   is_org_mandatory: boolean | nil,
                   connected_team_ids: [binary] | nil,
                   user: binary | nil,
                   is_ext_shared: boolean | nil,
                   is_frozen: boolean | nil,
                   pending_shared: [binary] | nil,
                   is_archived: boolean,
                   is_shared: boolean,
                   is_member: boolean | nil,
                   id: binary,
                   parent_conversation: binary | nil
                 }
                 | %{
                     accepted_user: binary | nil,
                     name: binary,
                     is_org_shared: boolean,
                     shares:
                       [
                         %{
                           accepted_user: binary | nil,
                           is_active: boolean,
                           team: Slack.ObjsTeam.t(),
                           user: binary
                         }
                       ]
                       | nil,
                     is_group: boolean,
                     timezone_count: integer | nil,
                     is_read_only: boolean | nil,
                     last_read: binary | nil,
                     creator: binary,
                     internal_team_ids: [binary] | nil,
                     is_general: boolean,
                     num_members: integer | nil,
                     is_mpim: boolean,
                     pin_count: integer | nil,
                     unread_count_display: integer | nil,
                     display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                     purpose: %{creator: binary, last_set: integer, value: binary},
                     members: [binary] | nil,
                     unlinked: integer | nil,
                     is_moved: integer | nil,
                     pending_connected_team_ids: [binary] | nil,
                     conversation_host_id: binary | nil,
                     is_private: boolean,
                     topic: %{creator: binary, last_set: integer, value: binary},
                     is_im: boolean,
                     name_normalized: binary,
                     is_starred: boolean | nil,
                     version: integer | nil,
                     is_channel: boolean,
                     shared_team_ids: [binary] | nil,
                     unread_count: integer | nil,
                     is_pending_ext_shared: boolean | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     created: integer,
                     priority: number | nil,
                     is_non_threadable: boolean | nil,
                     previous_names: [binary] | nil,
                     is_open: boolean | nil,
                     is_thread_only: boolean | nil,
                     connected_team_ids: [binary] | nil,
                     user: binary | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     pending_shared: [binary] | nil,
                     is_archived: boolean,
                     is_shared: boolean,
                     is_member: boolean | nil,
                     id: binary,
                     parent_conversation: binary | nil
                   }
                 | %{
                     created: integer,
                     has_pins: boolean | nil,
                     id: binary,
                     is_archived: boolean | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     is_im: boolean,
                     is_open: boolean | nil,
                     is_org_shared: boolean,
                     is_shared: boolean | nil,
                     is_starred: boolean | nil,
                     is_user_deleted: boolean | nil,
                     last_read: binary | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     parent_conversation: binary | nil,
                     pin_count: integer | nil,
                     priority: number,
                     shares:
                       [
                         %{
                           date_create: integer,
                           id: binary,
                           is_active: boolean,
                           name: binary,
                           team: Slack.ObjsTeam.t()
                         }
                       ]
                       | nil,
                     unread_count: integer | nil,
                     unread_count_display: integer | nil,
                     user: binary,
                     version: integer | nil
                   },
               ok: boolean
             }}
            | {:error,
               %{
                 callstack: binary | nil,
                 error: binary,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
    def(conversations_set_topic(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/conversations.setTopic")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{channel: {:TODO, :OneOfDecode}, ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             error: body["error"],
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_set_topic: 1)
  )

  (
    @doc "#{nil}
    
    #{"Invite a user to a public or private channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.invite)"}
    "
    @spec admin_conversations_invite(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{error: binary, ok: boolean}} | {:error, any}
    def(admin_conversations_invite(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.conversations.invite")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_invite: 1)
  )

  (
    @doc "#{nil}
    
    #{"Uninstalls your app from a workspace."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `none`\n- `client_id`: Issued when you created your application.\n- `client_secret`: Issued when you created your application.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/apps.uninstall)"}
    "
    @spec apps_uninstall(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:client_id, binary} | {:client_secret, binary}
    def(apps_uninstall(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/apps.uninstall",
          query: Tesla.OpenApi.encode_query(query, token: nil, client_id: nil, client_secret: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(apps_uninstall: 2)
  )

  (
    @doc "#{nil}
    
    #{"Publish a static view for a User."}
    
    #{"### Query parameters\n\n- `user_id`: `id` of the user you want publish a view to.\n- `view`: A [view payload](/reference/surfaces/views). This must be a JSON-encoded string.\n- `hash`: A string that represents view state to protect against possible race conditions.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/views.publish)"}
    "
    @spec views_publish(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:user_id, binary} | {:view, binary} | {:hash, binary}
    def(views_publish(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/views.publish",
          query: Tesla.OpenApi.encode_query(query, user_id: nil, view: nil, hash: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(views_publish: 2)
  )

  (
    @doc "#{nil}
    
    #{"Removes a user from a conversation."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.kick)"}
    "
    @spec conversations_kick(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error,
               %{
                 callstack: binary | nil,
                 error: binary,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
    def(conversations_kick(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/conversations.kick")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             error: body["error"],
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_kick: 1)
  )

  (
    @doc "#{nil}
    
    #{"Approve an app for installation on a workspace."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.apps.approve)"}
    "
    @spec admin_apps_approve(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_apps_approve(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.apps.approve")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_apps_approve: 1)
  )

  (
    @doc "#{nil}
    
    #{"Gets the access logs for the current team."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `admin`\n- `before`: End of time range of logs to include in results (inclusive).\n- `count`: \n- `page`: \n"}
    
    #{"[API method documentation](https://api.slack.com/methods/team.accessLogs)"}
    "
    @spec team_access_logs(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               logins: [
                 %{
                   count: integer,
                   country: binary,
                   date_first: integer,
                   date_last: integer,
                   ip: binary,
                   isp: binary,
                   region: binary,
                   user_agent: binary,
                   user_id: binary,
                   username: binary
                 }
               ],
               ok: boolean,
               paging: Slack.ObjsPaging.t()
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:before, binary} | {:count, binary} | {:page, binary}
    def(team_access_logs(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/team.accessLogs",
          query: Tesla.OpenApi.encode_query(query, token: nil, before: nil, count: nil, page: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             logins:
               Enum.map(body["logins"], fn item ->
                 %{
                   count: item["count"],
                   country: item["country"],
                   date_first: item["date_first"],
                   date_last: item["date_last"],
                   ip: item["ip"],
                   isp: item["isp"],
                   region: item["region"],
                   user_agent: item["user_agent"],
                   user_id: item["user_id"],
                   username: item["username"]
                 }
               end),
             ok: body["ok"],
             paging: Slack.ObjsPaging.decode(body["paging"])
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(team_access_logs: 2)
  )

  (
    @doc "#{nil}
    
    #{"Delete the user profile photo"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/users.deletePhoto)"}
    "
    @spec users_delete_photo(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(users_delete_photo(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/users.deletePhoto")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(users_delete_photo: 1)
  )

  (
    @doc "#{nil}
    
    #{"Opens or resumes a direct message or multi-person direct message."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.open)"}
    "
    @spec conversations_open(Tesla.Client.t()) ::
            {:ok,
             %{
               already_open: boolean | nil,
               channel:
                 %{
                   accepted_user: binary | nil,
                   name: binary,
                   is_org_shared: boolean,
                   shares:
                     [
                       %{
                         accepted_user: binary | nil,
                         is_active: boolean,
                         team: Slack.ObjsTeam.t(),
                         user: binary
                       }
                     ]
                     | nil,
                   is_group: boolean,
                   has_pins: boolean | nil,
                   is_org_default: boolean | nil,
                   timezone_count: integer | nil,
                   is_read_only: boolean | nil,
                   use_case: binary | nil,
                   last_read: binary | nil,
                   creator: binary,
                   internal_team_ids: [binary] | nil,
                   is_general: boolean,
                   num_members: integer | nil,
                   is_mpim: boolean,
                   pin_count: integer | nil,
                   unread_count_display: integer | nil,
                   display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                   purpose: %{creator: binary, last_set: integer, value: binary},
                   members: [binary] | nil,
                   unlinked: integer | nil,
                   is_moved: integer | nil,
                   pending_connected_team_ids: [binary] | nil,
                   conversation_host_id: binary | nil,
                   is_private: boolean,
                   topic: %{creator: binary, last_set: integer, value: binary},
                   is_im: boolean,
                   name_normalized: binary,
                   is_starred: boolean | nil,
                   version: integer | nil,
                   is_channel: boolean,
                   enterprise_id: binary | nil,
                   shared_team_ids: [binary] | nil,
                   unread_count: integer | nil,
                   is_global_shared: boolean | nil,
                   is_pending_ext_shared: boolean | nil,
                   latest: Slack.ObjsMessage.t() | nil,
                   created: integer,
                   priority: number | nil,
                   is_non_threadable: boolean | nil,
                   previous_names: [binary] | nil,
                   is_open: boolean | nil,
                   is_thread_only: boolean | nil,
                   is_org_mandatory: boolean | nil,
                   connected_team_ids: [binary] | nil,
                   user: binary | nil,
                   is_ext_shared: boolean | nil,
                   is_frozen: boolean | nil,
                   pending_shared: [binary] | nil,
                   is_archived: boolean,
                   is_shared: boolean,
                   is_member: boolean | nil,
                   id: binary,
                   parent_conversation: binary | nil
                 }
                 | %{
                     accepted_user: binary | nil,
                     name: binary,
                     is_org_shared: boolean,
                     shares:
                       [
                         %{
                           accepted_user: binary | nil,
                           is_active: boolean,
                           team: Slack.ObjsTeam.t(),
                           user: binary
                         }
                       ]
                       | nil,
                     is_group: boolean,
                     timezone_count: integer | nil,
                     is_read_only: boolean | nil,
                     last_read: binary | nil,
                     creator: binary,
                     internal_team_ids: [binary] | nil,
                     is_general: boolean,
                     num_members: integer | nil,
                     is_mpim: boolean,
                     pin_count: integer | nil,
                     unread_count_display: integer | nil,
                     display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                     purpose: %{creator: binary, last_set: integer, value: binary},
                     members: [binary] | nil,
                     unlinked: integer | nil,
                     is_moved: integer | nil,
                     pending_connected_team_ids: [binary] | nil,
                     conversation_host_id: binary | nil,
                     is_private: boolean,
                     topic: %{creator: binary, last_set: integer, value: binary},
                     is_im: boolean,
                     name_normalized: binary,
                     is_starred: boolean | nil,
                     version: integer | nil,
                     is_channel: boolean,
                     shared_team_ids: [binary] | nil,
                     unread_count: integer | nil,
                     is_pending_ext_shared: boolean | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     created: integer,
                     priority: number | nil,
                     is_non_threadable: boolean | nil,
                     previous_names: [binary] | nil,
                     is_open: boolean | nil,
                     is_thread_only: boolean | nil,
                     connected_team_ids: [binary] | nil,
                     user: binary | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     pending_shared: [binary] | nil,
                     is_archived: boolean,
                     is_shared: boolean,
                     is_member: boolean | nil,
                     id: binary,
                     parent_conversation: binary | nil
                   }
                 | %{
                     created: integer,
                     has_pins: boolean | nil,
                     id: binary,
                     is_archived: boolean | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     is_im: boolean,
                     is_open: boolean | nil,
                     is_org_shared: boolean,
                     is_shared: boolean | nil,
                     is_starred: boolean | nil,
                     is_user_deleted: boolean | nil,
                     last_read: binary | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     parent_conversation: binary | nil,
                     pin_count: integer | nil,
                     priority: number,
                     shares:
                       [
                         %{
                           date_create: integer,
                           id: binary,
                           is_active: boolean,
                           name: binary,
                           team: Slack.ObjsTeam.t()
                         }
                       ]
                       | nil,
                     unread_count: integer | nil,
                     unread_count_display: integer | nil,
                     user: binary,
                     version: integer | nil
                   }
                 | %{
                     created: binary | nil,
                     id: binary,
                     is_im: boolean | nil,
                     is_open: boolean | nil,
                     last_read: binary | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     unread_count: number | nil,
                     unread_count_display: number | nil,
                     user: binary | nil
                   },
               no_op: boolean | nil,
               ok: boolean
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(conversations_open(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/conversations.open")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             already_open: body["already_open"],
             channel: {:TODO, :OneOfDecode},
             no_op: body["no_op"],
             ok: body["ok"]
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_open: 1)
  )

  (
    @doc "#{nil}
    
    #{"Approve a workspace invite request."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.inviteRequests.approve)"}
    "
    @spec admin_invite_requests_approve(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_invite_requests_approve(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.inviteRequests.approve")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_invite_requests_approve: 1)
  )

  (
    @doc "#{nil}
    
    #{"Rename an emoji."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.emoji.rename)"}
    "
    @spec admin_emoji_rename(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_emoji_rename(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.emoji.rename")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_emoji_rename: 1)
  )

  (
    @doc "#{nil}
    
    #{"Share a remote file into a channel."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `remote_files:share`\n- `file`: Specify a file registered with Slack by providing its ID. Either this field or `external_id` or both are required.\n- `external_id`: The globally unique identifier (GUID) for the file, as set by the app registering the file with Slack.  Either this field or `file` or both are required.\n- `channels`: Comma-separated list of channel IDs where the file will be shared.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/files.remote.share)"}
    "
    @spec files_remote_share(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt:
                 {:token, binary} | {:file, binary} | {:external_id, binary} | {:channels, binary}
    def(files_remote_share(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/files.remote.share",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              file: nil,
              external_id: nil,
              channels: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(files_remote_share: 2)
  )

  (
    @doc "#{nil}
    
    #{"List the channels linked to an org-level IDP group (user group)."}
    
    #{"### Query parameters\n\n- `usergroup_id`: ID of the IDP group to list default channels for.\n- `team_id`: ID of the the workspace.\n- `include_num_members`: Flag to include or exclude the count of members per channel.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.usergroups.listChannels)"}
    "
    @spec admin_usergroups_list_channels(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:usergroup_id, binary} | {:team_id, binary} | {:include_num_members, boolean}
    def(admin_usergroups_list_channels(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.usergroups.listChannels",
          query:
            Tesla.OpenApi.encode_query(query,
              usergroup_id: nil,
              team_id: nil,
              include_num_members: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_usergroups_list_channels: 2)
  )

  (
    @doc "#{nil}
    
    #{"Remove a remote file."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/files.remote.remove)"}
    "
    @spec files_remote_remove(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(files_remote_remove(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/files.remote.remove")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(files_remote_remove: 1)
  )

  (
    @doc "#{nil}
    
    #{"Get conversation preferences for a public or private channel."}
    
    #{"### Query parameters\n\n- `channel_id`: The channel to get preferences for.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.getConversationPrefs)"}
    "
    @spec admin_conversations_get_conversation_prefs(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               ok: boolean,
               prefs:
                 %{
                   can_thread: %{type: [binary] | nil, user: [binary] | nil} | nil,
                   who_can_post: %{type: [binary] | nil, user: [binary] | nil} | nil
                 }
                 | nil
             }}
            | {:error, %{error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:channel_id, binary}
    def(admin_conversations_get_conversation_prefs(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.conversations.getConversationPrefs",
          query: Tesla.OpenApi.encode_query(query, channel_id: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             ok: body["ok"],
             prefs: %{
               can_thread: %{
                 type:
                   case(body["prefs"]["can_thread"]["type"]) do
                     nil ->
                       nil

                     _ ->
                       Enum.map(body["prefs"]["can_thread"]["type"], fn item -> item end)
                   end,
                 user:
                   case(body["prefs"]["can_thread"]["user"]) do
                     nil ->
                       nil

                     _ ->
                       Enum.map(body["prefs"]["can_thread"]["user"], fn item -> item end)
                   end
               },
               who_can_post: %{
                 type:
                   case(body["prefs"]["who_can_post"]["type"]) do
                     nil ->
                       nil

                     _ ->
                       Enum.map(body["prefs"]["who_can_post"]["type"], fn item -> item end)
                   end,
                 user:
                   case(body["prefs"]["who_can_post"]["user"]) do
                     nil ->
                       nil

                     _ ->
                       Enum.map(body["prefs"]["who_can_post"]["user"], fn item -> item end)
                   end
               }
             }
           }}

        {:ok, %{body: body}} ->
          {:error, %{error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_get_conversation_prefs: 2)
  )

  (
    @doc "#{nil}
    
    #{"Disconnect a connected channel from one or more workspaces."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.disconnectShared)"}
    "
    @spec admin_conversations_disconnect_shared(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{error: binary, ok: boolean}} | {:error, any}
    def(admin_conversations_disconnect_shared(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.conversations.disconnectShared")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_disconnect_shared: 1)
  )

  (
    @doc "#{nil}
    
    #{"Unarchive a public or private channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.unarchive)"}
    "
    @spec admin_conversations_unarchive(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{error: binary, ok: boolean}} | {:error, any}
    def(admin_conversations_unarchive(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.conversations.unarchive")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_unarchive: 1)
  )

  (
    @doc "#{nil}
    
    #{"Removes a reaction from an item."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/reactions.remove)"}
    "
    @spec reactions_remove(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(reactions_remove(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/reactions.remove")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(reactions_remove: 1)
  )

  (
    @doc "#{nil}
    
    #{"Deletes an existing comment on a file."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/files.comments.delete)"}
    "
    @spec files_comments_delete(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(files_comments_delete(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/files.comments.delete")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(files_comments_delete: 1)
  )

  (
    @doc "#{nil}
    
    #{"Search for public or private channels in an Enterprise organization."}
    
    #{"### Query parameters\n\n- `team_ids`: Comma separated string of team IDs, signifying the workspaces to search through.\n- `query`: Name of the the channel to query by.\n- `limit`: Maximum number of items to be returned. Must be between 1 - 20 both inclusive. Default is 10.\n- `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.\n- `search_channel_types`: The type of channel to include or exclude in the search. For example `private` will search private channels, while `private_exclude` will exclude them. For a full list of types, check the [Types section](#types).\n- `sort`: Possible values are `relevant` (search ranking based on what we think is closest), `name` (alphabetical), `member_count` (number of users in the channel), and `created` (date channel was created). You can optionally pair this with the `sort_dir` arg to change how it is sorted \n- `sort_dir`: Sort direction. Possible values are `asc` for ascending order like (1, 2, 3) or (a, b, c), and `desc` for descending order like (3, 2, 1) or (c, b, a)\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.search)"}
    "
    @spec admin_conversations_search(Tesla.Client.t(), [opt]) ::
            {:ok, %{channels: [Slack.ObjsChannel.t()], next_cursor: binary}}
            | {:error, %{error: binary, ok: boolean}}
            | {:error, any}
          when opt:
                 {:team_ids, binary}
                 | {:query, binary}
                 | {:limit, integer}
                 | {:cursor, binary}
                 | {:search_channel_types, binary}
                 | {:sort, binary}
                 | {:sort_dir, binary}
    def(admin_conversations_search(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.conversations.search",
          query:
            Tesla.OpenApi.encode_query(query,
              team_ids: nil,
              query: nil,
              limit: nil,
              cursor: nil,
              search_channel_types: nil,
              sort: nil,
              sort_dir: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             channels: Enum.map(body["channels"], fn item -> Slack.ObjsChannel.decode(item) end),
             next_cursor: body["next_cursor"]
           }}

        {:ok, %{body: body}} ->
          {:error, %{error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_search: 2)
  )

  (
    @doc "#{nil}
    
    #{"Create an Enterprise team."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.teams.create)"}
    "
    @spec admin_teams_create(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_teams_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.teams.create")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_teams_create: 1)
  )

  (
    @doc "#{nil}
    
    #{"Set the workspaces in an Enterprise grid org that connect to a public or private channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.setTeams)"}
    "
    @spec admin_conversations_set_teams(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_conversations_set_teams(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.conversations.setTeams")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_set_teams: 1)
  )

  (
    @doc "#{nil}
    
    #{"Allows an app to request additional scopes"}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `none`\n- `scopes`: A comma separated list of scopes to request for\n- `trigger_id`: Token used to trigger the permissions API\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/apps.permissions.request)"}
    "
    @spec apps_permissions_request(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:scopes, binary} | {:trigger_id, binary}
    def(apps_permissions_request(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/apps.permissions.request",
          query: Tesla.OpenApi.encode_query(query, token: nil, scopes: nil, trigger_id: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(apps_permissions_request: 2)
  )

  (
    @doc "#{nil}
    
    #{"Returns a list of scheduled messages."}
    
    #{"### Query parameters\n\n- `channel`: The channel of the scheduled messages\n- `latest`: A UNIX timestamp of the latest value in the time range\n- `oldest`: A UNIX timestamp of the oldest value in the time range\n- `limit`: Maximum number of original entries to return.\n- `cursor`: For pagination purposes, this is the `cursor` value returned from a previous call to `chat.scheduledmessages.list` indicating where you want to start this call from.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/chat.scheduledMessages.list)"}
    "
    @spec chat_scheduled_messages_list(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               ok: boolean,
               response_metadata: %{next_cursor: binary},
               scheduled_messages: [
                 %{
                   channel_id: binary,
                   date_created: integer,
                   id: binary,
                   post_at: integer,
                   text: binary | nil
                 }
               ]
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt:
                 {:channel, binary}
                 | {:latest, number}
                 | {:oldest, number}
                 | {:limit, integer}
                 | {:cursor, binary}
    def(chat_scheduled_messages_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/chat.scheduledMessages.list",
          query:
            Tesla.OpenApi.encode_query(query,
              channel: nil,
              latest: nil,
              oldest: nil,
              limit: nil,
              cursor: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             ok: body["ok"],
             response_metadata: %{next_cursor: body["response_metadata"]["next_cursor"]},
             scheduled_messages:
               Enum.map(body["scheduled_messages"], fn item ->
                 %{
                   channel_id: item["channel_id"],
                   date_created: item["date_created"],
                   id: item["id"],
                   post_at: item["post_at"],
                   text: item["text"]
                 }
               end)
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(chat_scheduled_messages_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Deny a workspace invite request."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.inviteRequests.deny)"}
    "
    @spec admin_invite_requests_deny(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_invite_requests_deny(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.inviteRequests.deny")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_invite_requests_deny: 1)
  )

  (
    @doc "#{nil}
    
    #{"Registers a new Call."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/calls.add)"}
    "
    @spec calls_add(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(calls_add(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/calls.add")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(calls_add: 1)
  )

  (
    @doc "#{nil}
    
    #{"Set an existing guest, regular user, or owner to be an admin user."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.users.setAdmin)"}
    "
    @spec admin_users_set_admin(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_users_set_admin(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.users.setAdmin")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_users_set_admin: 1)
  )

  (
    @doc "#{nil}
    
    #{"Disable an existing User Group"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/usergroups.disable)"}
    "
    @spec usergroups_disable(Tesla.Client.t()) ::
            {:ok, %{ok: boolean, usergroup: Slack.ObjsSubteam.t()}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(usergroups_disable(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/usergroups.disable")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"], usergroup: Slack.ObjsSubteam.decode(body["usergroup"])}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(usergroups_disable: 1)
  )

  (
    @doc "#{nil}
    
    #{"List all disconnected channels—i.e., channels that were once connected to other workspaces and then disconnected—and the corresponding original channel IDs for key revocation with EKM."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `admin.conversations:read`\n- `channel_ids`: A comma-separated list of channels to filter to.\n- `team_ids`: A comma-separated list of the workspaces to which the channels you would like returned belong.\n- `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.\n- `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.ekm.listOriginalConnectedChannelInfo)"}
    "
    @spec admin_conversations_ekm_list_original_connected_channel_info(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt:
                 {:token, binary}
                 | {:channel_ids, binary}
                 | {:team_ids, binary}
                 | {:limit, integer}
                 | {:cursor, binary}
    def(
      admin_conversations_ekm_list_original_connected_channel_info(client \\ new(), query \\ [])
    ) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.conversations.ekm.listOriginalConnectedChannelInfo",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              channel_ids: nil,
              team_ids: nil,
              limit: nil,
              cursor: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_ekm_list_original_connected_channel_info: 2)
  )

  (
    @doc "#{nil}
    
    #{"List all approved workspace invite requests."}
    
    #{"### Query parameters\n\n- `team_id`: ID for the workspace where the invite requests were made.\n- `cursor`: Value of the `next_cursor` field sent as part of the previous API response\n- `limit`: The number of results that will be returned by the API on each invocation. Must be between 1 - 1000, both inclusive\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.inviteRequests.approved.list)"}
    "
    @spec admin_invite_requests_approved_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:team_id, binary} | {:cursor, binary} | {:limit, integer}
    def(admin_invite_requests_approved_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.inviteRequests.approved.list",
          query: Tesla.OpenApi.encode_query(query, team_id: nil, cursor: nil, limit: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_invite_requests_approved_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"List users on a workspace"}
    
    #{"### Query parameters\n\n- `team_id`: The ID (`T1234`) of the workspace.\n- `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.\n- `limit`: Limit for how many users to be retrieved per page\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.users.list)"}
    "
    @spec admin_users_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:team_id, binary} | {:cursor, binary} | {:limit, integer}
    def(admin_users_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.users.list",
          query: Tesla.OpenApi.encode_query(query, team_id: nil, cursor: nil, limit: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_users_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Open a dialog with a user"}
    
    #{"### Query parameters\n\n- `dialog`: The dialog definition. This must be a JSON-encoded string.\n- `trigger_id`: Exchange a trigger to post to the user.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/dialog.open)"}
    "
    @spec dialog_open(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:dialog, binary} | {:trigger_id, binary}
    def(dialog_open(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/dialog.open",
          query: Tesla.OpenApi.encode_query(query, dialog: nil, trigger_id: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(dialog_open: 2)
  )

  (
    @doc "#{nil}
    
    #{"Archives a conversation."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.archive)"}
    "
    @spec conversations_archive(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error,
               %{
                 callstack: binary | nil,
                 error: binary,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
    def(conversations_archive(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/conversations.archive")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             error: body["error"],
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_archive: 1)
  )

  (
    @doc "#{nil}
    
    #{"Remove a user from a workspace."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.users.remove)"}
    "
    @spec admin_users_remove(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_users_remove(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.users.remove")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_users_remove: 1)
  )

  (
    @doc "#{nil}
    
    #{"Returns information about a Call."}
    
    #{"### Query parameters\n\n- `id`: `id` of the Call returned by the [`calls.add`](/methods/calls.add) method.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/calls.info)"}
    "
    @spec calls_info(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:id, binary}
    def(calls_info(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/calls.info",
          query: Tesla.OpenApi.encode_query(query, id: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(calls_info: 2)
  )

  (
    @doc "#{nil}
    
    #{"Manually sets user presence."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/users.setPresence)"}
    "
    @spec users_set_presence(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(users_set_presence(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/users.setPresence")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(users_set_presence: 1)
  )

  (
    @doc "#{nil}
    
    #{"Returns list of user grants and corresponding scopes this app has on a team."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `none`\n- `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first \"page\" of the collection. See [pagination](/docs/pagination) for more detail.\n- `limit`: The maximum number of items to return.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/apps.permissions.users.list)"}
    "
    @spec apps_permissions_users_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:token, binary} | {:cursor, binary} | {:limit, integer}
    def(apps_permissions_users_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/apps.permissions.users.list",
          query: Tesla.OpenApi.encode_query(query, token: nil, cursor: nil, limit: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(apps_permissions_users_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Set an expiration for a guest user"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.users.setExpiration)"}
    "
    @spec admin_users_set_expiration(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_users_set_expiration(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.users.setExpiration")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_users_set_expiration: 1)
  )

  (
    @doc "#{nil}
    
    #{"Lists items pinned to a channel."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `pins:read`\n- `channel`: Channel to get pinned items for.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/pins.list)"}
    "
    @spec pins_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{items: [any], ok: boolean} | %{count: integer, ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:channel, binary}
    def(pins_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/pins.list",
          query: Tesla.OpenApi.encode_query(query, token: nil, channel: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, {:TODO, :OneOfDecode}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(pins_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Enable a User Group"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/usergroups.enable)"}
    "
    @spec usergroups_enable(Tesla.Client.t()) ::
            {:ok, %{ok: boolean, usergroup: Slack.ObjsSubteam.t()}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(usergroups_enable(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/usergroups.enable")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"], usergroup: Slack.ObjsSubteam.decode(body["usergroup"])}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(usergroups_enable: 1)
  )

  (
    @doc "#{nil}
    
    #{"Indicate that an app's step in a workflow failed to execute."}
    
    #{"### Query parameters\n\n- `workflow_step_execute_id`: Context identifier that maps to the correct workflow step execution.\n- `error`: A JSON-based object with a `message` property that should contain a human readable error message.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/workflows.stepFailed)"}
    "
    @spec workflows_step_failed(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:workflow_step_execute_id, binary} | {:error, binary}
    def(workflows_step_failed(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/workflows.stepFailed",
          query: Tesla.OpenApi.encode_query(query, workflow_step_execute_id: nil, error: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(workflows_step_failed: 2)
  )

  (
    @doc "#{nil}
    
    #{"Set the user profile photo"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/users.setPhoto)"}
    "
    @spec users_set_photo(Tesla.Client.t()) ::
            {:ok,
             %{
               ok: boolean,
               profile: %{
                 avatar_hash: binary,
                 image_1024: binary,
                 image_192: binary,
                 image_24: binary,
                 image_32: binary,
                 image_48: binary,
                 image_512: binary,
                 image_72: binary,
                 image_original: binary
               }
             }}
            | {:error,
               %{
                 callstack: binary | nil,
                 debug_step: binary | nil,
                 dims: binary | nil,
                 error: binary,
                 ok: boolean,
                 time_ident: integer | nil
               }}
            | {:error, any}
    def(users_set_photo(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/users.setPhoto")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             ok: body["ok"],
             profile: %{
               avatar_hash: body["profile"]["avatar_hash"],
               image_1024: body["profile"]["image_1024"],
               image_192: body["profile"]["image_192"],
               image_24: body["profile"]["image_24"],
               image_32: body["profile"]["image_32"],
               image_48: body["profile"]["image_48"],
               image_512: body["profile"]["image_512"],
               image_72: body["profile"]["image_72"],
               image_original: body["profile"]["image_original"]
             }
           }}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             debug_step: body["debug_step"],
             dims: body["dims"],
             error: body["error"],
             ok: body["ok"],
             time_ident: body["time_ident"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(users_set_photo: 1)
  )

  (
    @doc "#{nil}
    
    #{"Updates information about a Call."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/calls.update)"}
    "
    @spec calls_update(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(calls_update(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/calls.update")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(calls_update: 1)
  )

  (
    @doc "#{nil}
    
    #{"For Enterprise Grid workspaces, map local user IDs to global user IDs"}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `tokens.basic`\n- `users`: A comma-separated list of user ids, up to 400 per request\n- `team_id`: Specify team_id starts with `T` in case of Org Token\n- `to_old`: Specify `true` to convert `W` global user IDs to workspace-specific `U` IDs. Defaults to `false`.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/migration.exchange)"}
    "
    @spec migration_exchange(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               enterprise_id: binary,
               invalid_user_ids: [binary] | nil,
               ok: boolean,
               team_id: binary,
               user_id_map: %{} | nil
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:users, binary} | {:team_id, binary} | {:to_old, boolean}
    def(migration_exchange(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/migration.exchange",
          query:
            Tesla.OpenApi.encode_query(query, token: nil, users: nil, team_id: nil, to_old: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             enterprise_id: body["enterprise_id"],
             invalid_user_ids:
               case(body["invalid_user_ids"]) do
                 nil ->
                   nil

                 _ ->
                   Enum.map(body["invalid_user_ids"], fn item -> item end)
               end,
             ok: body["ok"],
             team_id: body["team_id"],
             user_id_map: %{}
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(migration_exchange: 2)
  )

  (
    @doc "#{nil}
    
    #{"Update an existing User Group"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/usergroups.update)"}
    "
    @spec usergroups_update(Tesla.Client.t()) ::
            {:ok, %{ok: boolean, usergroup: Slack.ObjsSubteam.t()}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(usergroups_update(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/usergroups.update")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"], usergroup: Slack.ObjsSubteam.decode(body["usergroup"])}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(usergroups_update: 1)
  )

  (
    @doc "#{nil}
    
    #{"Adds a star to an item."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/stars.add)"}
    "
    @spec stars_add(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(stars_add(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/stars.add")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(stars_add: 1)
  )

  (
    @doc "#{nil}
    
    #{"Update an existing view."}
    
    #{"### Query parameters\n\n- `view_id`: A unique identifier of the view to be updated. Either `view_id` or `external_id` is required.\n- `external_id`: A unique identifier of the view set by the developer. Must be unique for all views on a team. Max length of 255 characters. Either `view_id` or `external_id` is required.\n- `view`: A [view object](/reference/surfaces/views). This must be a JSON-encoded string.\n- `hash`: A string that represents view state to protect against possible race conditions.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/views.update)"}
    "
    @spec views_update(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt:
                 {:view_id, binary} | {:external_id, binary} | {:view, binary} | {:hash, binary}
    def(views_update(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/views.update",
          query:
            Tesla.OpenApi.encode_query(query, view_id: nil, external_id: nil, view: nil, hash: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(views_update: 2)
  )

  (
    @doc "#{nil}
    
    #{"Add an allowlist of IDP groups for accessing a channel"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.restrictAccess.addGroup)"}
    "
    @spec admin_conversations_restrict_access_add_group(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_conversations_restrict_access_add_group(client \\ new())) do
      case(
        Tesla.request(client, method: :post, url: "/admin.conversations.restrictAccess.addGroup")
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_restrict_access_add_group: 1)
  )

  (
    @doc "#{nil}
    
    #{"Add an emoji alias."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.emoji.addAlias)"}
    "
    @spec admin_emoji_add_alias(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_emoji_add_alias(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.emoji.addAlias")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_emoji_add_alias: 1)
  )

  (
    @doc "#{nil}
    
    #{"Revokes public/external sharing access for a file"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/files.revokePublicURL)"}
    "
    @spec files_revoke_public_url(Tesla.Client.t()) ::
            {:ok, %{file: Slack.ObjsFile.t(), ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(files_revoke_public_url(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/files.revokePublicURL")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{file: Slack.ObjsFile.decode(body["file"]), ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(files_revoke_public_url: 1)
  )

  (
    @doc "#{nil}
    
    #{"Archive a public or private channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.archive)"}
    "
    @spec admin_conversations_archive(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{error: binary, ok: boolean}} | {:error, any}
    def(admin_conversations_archive(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.conversations.archive")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_archive: 1)
  )

  (
    @doc "#{nil}
    
    #{"List all of the admins on a given workspace."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `admin.teams:read`\n- `limit`: The maximum number of items to return.\n- `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.\n- `team_id`: \n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.teams.admins.list)"}
    "
    @spec admin_teams_admins_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:token, binary} | {:limit, integer} | {:cursor, binary} | {:team_id, binary}
    def(admin_teams_admins_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.teams.admins.list",
          query:
            Tesla.OpenApi.encode_query(query, token: nil, limit: nil, cursor: nil, team_id: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_teams_admins_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Exchanges a temporary OAuth verifier code for an access token."}
    
    #{"### Query parameters\n\n- `client_id`: Issued when you created your application.\n- `client_secret`: Issued when you created your application.\n- `code`: The `code` param returned via the OAuth callback.\n- `redirect_uri`: This must match the originally submitted URI (if one was sent).\n- `single_channel`: Request the user to add your app only to a single channel. Only valid with a [legacy workspace app](https://api.slack.com/legacy-workspace-apps).\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/oauth.access)"}
    "
    @spec oauth_access(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt:
                 {:client_id, binary}
                 | {:client_secret, binary}
                 | {:code, binary}
                 | {:redirect_uri, binary}
                 | {:single_channel, boolean}
    def(oauth_access(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/oauth.access",
          query:
            Tesla.OpenApi.encode_query(query,
              client_id: nil,
              client_secret: nil,
              code: nil,
              redirect_uri: nil,
              single_channel: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(oauth_access: 2)
  )

  (
    @doc "#{nil}
    
    #{"Gets billable users information for the current team."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `admin`\n- `user`: A user to retrieve the billable information for. Defaults to all users.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/team.billableInfo)"}
    "
    @spec team_billable_info(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:token, binary} | {:user, binary}
    def(team_billable_info(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/team.billableInfo",
          query: Tesla.OpenApi.encode_query(query, token: nil, user: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(team_billable_info: 2)
  )

  (
    @doc "#{nil}
    
    #{"List all User Groups for a team"}
    
    #{"### Query parameters\n\n- `include_users`: Include the list of users for each User Group.\n- `token`: Authentication token. Requires scope: `usergroups:read`\n- `include_count`: Include the number of users in each User Group.\n- `include_disabled`: Include disabled User Groups.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/usergroups.list)"}
    "
    @spec usergroups_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean, usergroups: [Slack.ObjsSubteam.t()]}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt:
                 {:include_users, boolean}
                 | {:token, binary}
                 | {:include_count, boolean}
                 | {:include_disabled, boolean}
    def(usergroups_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/usergroups.list",
          query:
            Tesla.OpenApi.encode_query(query,
              include_users: nil,
              token: nil,
              include_count: nil,
              include_disabled: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             ok: body["ok"],
             usergroups:
               Enum.map(body["usergroups"], fn item -> Slack.ObjsSubteam.decode(item) end)
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(usergroups_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Add an emoji."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.emoji.add)"}
    "
    @spec admin_emoji_add(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_emoji_add(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.emoji.add")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_emoji_add: 1)
  )

  (
    @doc "#{nil}
    
    #{"Retrieve a team's profile."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `users.profile:read`\n- `visibility`: Filter by visibility.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/team.profile.get)"}
    "
    @spec team_profile_get(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean, profile: %{fields: [Slack.ObjsTeamProfileField.t()]}}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:visibility, binary}
    def(team_profile_get(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/team.profile.get",
          query: Tesla.OpenApi.encode_query(query, token: nil, visibility: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             ok: body["ok"],
             profile: %{
               fields:
                 Enum.map(body["profile"]["fields"], fn item ->
                   Slack.ObjsTeamProfileField.decode(item)
                 end)
             }
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(team_profile_get: 2)
  )

  (
    @doc "#{nil}
    
    #{"Adds a file from a remote service"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/files.remote.add)"}
    "
    @spec files_remote_add(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(files_remote_add(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/files.remote.add")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(files_remote_add: 1)
  )

  (
    @doc "#{nil}
    
    #{"Set the profile information for a user."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/users.profile.set)"}
    "
    @spec users_profile_set(Tesla.Client.t()) ::
            {:ok,
             %{
               email_pending: binary | nil,
               ok: boolean,
               profile: Slack.ObjsUserProfile.t(),
               username: binary
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(users_profile_set(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/users.profile.set")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             email_pending: body["email_pending"],
             ok: body["ok"],
             profile: Slack.ObjsUserProfile.decode(body["profile"]),
             username: body["username"]
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(users_profile_set: 1)
  )

  (
    @doc "#{nil}
    
    #{"Find a user with an email address."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `users:read.email`\n- `email`: An email address belonging to a user in the workspace\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/users.lookupByEmail)"}
    "
    @spec users_lookup_by_email(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               ok: boolean,
               user:
                 %{
                   color: binary | nil,
                   deleted: boolean | nil,
                   enterprise_user: Slack.ObjsEnterpriseUser.t() | nil,
                   has_2fa: boolean | nil,
                   id: binary,
                   is_admin: boolean | nil,
                   is_app_user: boolean,
                   is_bot: boolean,
                   is_external: boolean | nil,
                   is_forgotten: boolean | nil,
                   is_invited_user: boolean | nil,
                   is_owner: boolean | nil,
                   is_primary_owner: boolean | nil,
                   is_restricted: boolean | nil,
                   is_stranger: boolean | nil,
                   is_ultra_restricted: boolean | nil,
                   locale: binary | nil,
                   name: binary,
                   presence: binary | nil,
                   profile: Slack.ObjsUserProfile.t(),
                   real_name: binary | nil,
                   team: binary | nil,
                   team_id: binary | nil,
                   team_profile: %{fields: [Slack.ObjsTeamProfileField.t()]} | nil,
                   two_factor_type: binary | nil,
                   tz: binary | nil,
                   tz_label: binary | nil,
                   tz_offset: number | nil,
                   updated: number
                 }
                 | %{
                     color: binary | nil,
                     deleted: boolean | nil,
                     enterprise_user: Slack.ObjsEnterpriseUser.t() | nil,
                     has_2fa: boolean | nil,
                     id: binary,
                     is_admin: boolean | nil,
                     is_app_user: boolean,
                     is_bot: boolean,
                     is_external: boolean | nil,
                     is_forgotten: boolean | nil,
                     is_owner: boolean | nil,
                     is_primary_owner: boolean | nil,
                     is_restricted: boolean | nil,
                     is_stranger: boolean | nil,
                     is_ultra_restricted: boolean | nil,
                     locale: binary | nil,
                     name: binary,
                     presence: binary | nil,
                     profile: Slack.ObjsUserProfile.t(),
                     real_name: binary | nil,
                     team_id: binary | nil,
                     team_profile: %{fields: [Slack.ObjsTeamProfileField.t()]} | nil,
                     teams: [binary] | nil,
                     two_factor_type: binary | nil,
                     tz: binary | nil,
                     tz_label: binary | nil,
                     tz_offset: number | nil,
                     updated: number
                   }
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:email, binary}
    def(users_lookup_by_email(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/users.lookupByEmail",
          query: Tesla.OpenApi.encode_query(query, token: nil, email: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"], user: {:TODO, :OneOfDecode}}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(users_lookup_by_email: 2)
  )

  (
    @doc "#{nil}
    
    #{"List for a team, in a channel, or from a user with applied filters."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `files:read`\n- `user`: Filter files created by a single user.\n- `channel`: Filter files appearing in a specific channel, indicated by its ID.\n- `ts_from`: Filter files created after this timestamp (inclusive).\n- `ts_to`: Filter files created before this timestamp (inclusive).\n- `types`: Filter files by type ([see below](#file_types)). You can pass multiple values in the types argument, like `types=spaces,snippets`.The default value is `all`, which does not filter the list.\n- `count`: \n- `page`: \n- `show_files_hidden_by_limit`: Show truncated file info for files hidden due to being too old, and the team who owns the file being over the file limit.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/files.list)"}
    "
    @spec files_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{files: [Slack.ObjsFile.t()], ok: boolean, paging: Slack.ObjsPaging.t()}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt:
                 {:token, binary}
                 | {:user, binary}
                 | {:channel, binary}
                 | {:ts_from, number}
                 | {:ts_to, number}
                 | {:types, binary}
                 | {:count, binary}
                 | {:page, binary}
                 | {:show_files_hidden_by_limit, boolean}
    def(files_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/files.list",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              user: nil,
              channel: nil,
              ts_from: nil,
              ts_to: nil,
              types: nil,
              count: nil,
              page: nil,
              show_files_hidden_by_limit: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             files: Enum.map(body["files"], fn item -> Slack.ObjsFile.decode(item) end),
             ok: body["ok"],
             paging: Slack.ObjsPaging.decode(body["paging"])
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(files_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"List all of the owners on a given workspace."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `admin.teams:read`\n- `team_id`: \n- `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.\n- `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.teams.owners.list)"}
    "
    @spec admin_teams_owners_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:token, binary} | {:team_id, binary} | {:limit, integer} | {:cursor, binary}
    def(admin_teams_owners_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.teams.owners.list",
          query:
            Tesla.OpenApi.encode_query(query, token: nil, team_id: nil, limit: nil, cursor: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_teams_owners_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Exchanges a temporary OAuth verifier code for a workspace token."}
    
    #{"### Query parameters\n\n- `client_id`: Issued when you created your application.\n- `client_secret`: Issued when you created your application.\n- `code`: The `code` param returned via the OAuth callback.\n- `redirect_uri`: This must match the originally submitted URI (if one was sent).\n- `single_channel`: Request the user to add your app only to a single channel.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/oauth.token)"}
    "
    @spec oauth_token(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt:
                 {:client_id, binary}
                 | {:client_secret, binary}
                 | {:code, binary}
                 | {:redirect_uri, binary}
                 | {:single_channel, boolean}
    def(oauth_token(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/oauth.token",
          query:
            Tesla.OpenApi.encode_query(query,
              client_id: nil,
              client_secret: nil,
              code: nil,
              redirect_uri: nil,
              single_channel: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(oauth_token: 2)
  )

  (
    @doc "#{nil}
    
    #{"Indicate that an app's step in a workflow completed execution."}
    
    #{"### Query parameters\n\n- `workflow_step_execute_id`: Context identifier that maps to the correct workflow step execution.\n- `outputs`: Key-value object of outputs from your step. Keys of this object reflect the configured `key` properties of your [`outputs`](/reference/workflows/workflow_step#output) array from your `workflow_step` object.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/workflows.stepCompleted)"}
    "
    @spec workflows_step_completed(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:workflow_step_execute_id, binary} | {:outputs, binary}
    def(workflows_step_completed(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/workflows.stepCompleted",
          query: Tesla.OpenApi.encode_query(query, workflow_step_execute_id: nil, outputs: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(workflows_step_completed: 2)
  )

  (
    @doc "#{nil}
    
    #{"Update the configuration for a workflow extension step."}
    
    #{"### Query parameters\n\n- `workflow_step_edit_id`: A context identifier provided with `view_submission` payloads used to call back to `workflows.updateStep`.\n- `inputs`: A JSON key-value map of inputs required from a user during configuration. This is the data your app expects to receive when the workflow step starts. **Please note**: the embedded variable format is set and replaced by the workflow system. You cannot create custom variables that will be replaced at runtime. [Read more about variables in workflow steps here](/workflows/steps#variables).\n- `outputs`: An JSON array of output objects used during step execution. This is the data your app agrees to provide when your workflow step was executed.\n- `step_name`: An optional field that can be used to override the step name that is shown in the Workflow Builder.\n- `step_image_url`: An optional field that can be used to override app image that is shown in the Workflow Builder.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/workflows.updateStep)"}
    "
    @spec workflows_update_step(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt:
                 {:workflow_step_edit_id, binary}
                 | {:inputs, binary}
                 | {:outputs, binary}
                 | {:step_name, binary}
                 | {:step_image_url, binary}
    def(workflows_update_step(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/workflows.updateStep",
          query:
            Tesla.OpenApi.encode_query(query,
              workflow_step_edit_id: nil,
              inputs: nil,
              outputs: nil,
              step_name: nil,
              step_image_url: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(workflows_update_step: 2)
  )

  (
    @doc "#{nil}
    
    #{"Updates an existing remote file."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/files.remote.update)"}
    "
    @spec files_remote_update(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(files_remote_update(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/files.remote.update")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(files_remote_update: 1)
  )

  (
    @doc "#{nil}
    
    #{"List all IDP Groups linked to a channel"}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `admin.conversations:read`\n- `channel_id`: \n- `team_id`: The workspace where the channel exists. This argument is required for channels only tied to one workspace, and optional for channels that are shared across an organization.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.restrictAccess.listGroups)"}
    "
    @spec admin_conversations_restrict_access_list_groups(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:token, binary} | {:channel_id, binary} | {:team_id, binary}
    def(admin_conversations_restrict_access_list_groups(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.conversations.restrictAccess.listGroups",
          query: Tesla.OpenApi.encode_query(query, token: nil, channel_id: nil, team_id: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_restrict_access_list_groups: 2)
  )

  (
    @doc "#{nil}
    
    #{"Updates a message."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/chat.update)"}
    "
    @spec chat_update(Tesla.Client.t()) ::
            {:ok,
             %{
               channel: binary,
               message: %{attachments: [%{}] | nil, blocks: Slack.Blocks.t() | nil, text: binary},
               ok: boolean,
               text: binary,
               ts: binary
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(chat_update(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/chat.update")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             channel: body["channel"],
             message: %{
               attachments: body["message"]["attachments"],
               blocks: Slack.Blocks.decode(body["message"]["blocks"]),
               text: body["message"]["text"]
             },
             ok: body["ok"],
             text: body["text"],
             ts: body["ts"]
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(chat_update: 1)
  )

  (
    @doc "#{nil}
    
    #{"Checks API calling code."}
    
    #{"### Query parameters\n\n- `error`: Error response to return\n- `foo`: example property to return\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/api.test)"}
    "
    @spec api_test(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{error: binary, ok: boolean}} | {:error, any}
          when opt: {:error, binary} | {:foo, binary}
    def(api_test(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/api.test",
          query: Tesla.OpenApi.encode_query(query, error: nil, foo: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(api_test: 2)
  )

  (
    @doc "#{nil}
    
    #{"Ends a Call."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/calls.end)"}
    "
    @spec calls_end(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(calls_end(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/calls.end")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(calls_end: 1)
  )

  (
    @doc "#{nil}
    
    #{"Ends the current user's Do Not Disturb session immediately."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/dnd.endDnd)"}
    "
    @spec dnd_end_dnd(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(dnd_end_dnd(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/dnd.endDnd")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(dnd_end_dnd: 1)
  )

  (
    @doc "#{nil}
    
    #{"Retrieve information about a remote file added to Slack"}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `remote_files:read`\n- `file`: Specify a file by providing its ID.\n- `external_id`: Creator defined GUID for the file.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/files.remote.info)"}
    "
    @spec files_remote_info(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:token, binary} | {:file, binary} | {:external_id, binary}
    def(files_remote_info(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/files.remote.info",
          query: Tesla.OpenApi.encode_query(query, token: nil, file: nil, external_id: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(files_remote_info: 2)
  )

  (
    @doc "#{nil}
    
    #{"Convert a public channel to a private channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.convertToPrivate)"}
    "
    @spec admin_conversations_convert_to_private(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{error: binary, ok: boolean}} | {:error, any}
    def(admin_conversations_convert_to_private(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.conversations.convertToPrivate")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_convert_to_private: 1)
  )

  (
    @doc "#{nil}
    
    #{"Fetch information about settings in a workspace"}
    
    #{"### Query parameters\n\n- `team_id`: \n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.teams.settings.info)"}
    "
    @spec admin_teams_settings_info(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:team_id, binary}
    def(admin_teams_settings_info(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.teams.settings.info",
          query: Tesla.OpenApi.encode_query(query, team_id: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_teams_settings_info: 2)
  )

  (
    @doc "#{nil}
    
    #{"Lists all channels in a Slack team."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `conversations:read`\n- `exclude_archived`: Set to `true` to exclude archived channels from the list\n- `types`: Mix and match channel types by providing a comma-separated list of any combination of `public_channel`, `private_channel`, `mpim`, `im`\n- `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the list hasn't been reached. Must be an integer no larger than 1000.\n- `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first \"page\" of the collection. See [pagination](/docs/pagination) for more detail.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.list)"}
    "
    @spec conversations_list(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               channels: [
                 %{
                   accepted_user: binary | nil,
                   name: binary,
                   is_org_shared: boolean,
                   shares:
                     [
                       %{
                         accepted_user: binary | nil,
                         is_active: boolean,
                         team: Slack.ObjsTeam.t(),
                         user: binary
                       }
                     ]
                     | nil,
                   is_group: boolean,
                   has_pins: boolean | nil,
                   is_org_default: boolean | nil,
                   timezone_count: integer | nil,
                   is_read_only: boolean | nil,
                   use_case: binary | nil,
                   last_read: binary | nil,
                   creator: binary,
                   internal_team_ids: [binary] | nil,
                   is_general: boolean,
                   num_members: integer | nil,
                   is_mpim: boolean,
                   pin_count: integer | nil,
                   unread_count_display: integer | nil,
                   display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                   purpose: %{creator: binary, last_set: integer, value: binary},
                   members: [binary] | nil,
                   unlinked: integer | nil,
                   is_moved: integer | nil,
                   pending_connected_team_ids: [binary] | nil,
                   conversation_host_id: binary | nil,
                   is_private: boolean,
                   topic: %{creator: binary, last_set: integer, value: binary},
                   is_im: boolean,
                   name_normalized: binary,
                   is_starred: boolean | nil,
                   version: integer | nil,
                   is_channel: boolean,
                   enterprise_id: binary | nil,
                   shared_team_ids: [binary] | nil,
                   unread_count: integer | nil,
                   is_global_shared: boolean | nil,
                   is_pending_ext_shared: boolean | nil,
                   latest: Slack.ObjsMessage.t() | nil,
                   created: integer,
                   priority: number | nil,
                   is_non_threadable: boolean | nil,
                   previous_names: [binary] | nil,
                   is_open: boolean | nil,
                   is_thread_only: boolean | nil,
                   is_org_mandatory: boolean | nil,
                   connected_team_ids: [binary] | nil,
                   user: binary | nil,
                   is_ext_shared: boolean | nil,
                   is_frozen: boolean | nil,
                   pending_shared: [binary] | nil,
                   is_archived: boolean,
                   is_shared: boolean,
                   is_member: boolean | nil,
                   id: binary,
                   parent_conversation: binary | nil
                 }
                 | %{
                     accepted_user: binary | nil,
                     name: binary,
                     is_org_shared: boolean,
                     shares:
                       [
                         %{
                           accepted_user: binary | nil,
                           is_active: boolean,
                           team: Slack.ObjsTeam.t(),
                           user: binary
                         }
                       ]
                       | nil,
                     is_group: boolean,
                     timezone_count: integer | nil,
                     is_read_only: boolean | nil,
                     last_read: binary | nil,
                     creator: binary,
                     internal_team_ids: [binary] | nil,
                     is_general: boolean,
                     num_members: integer | nil,
                     is_mpim: boolean,
                     pin_count: integer | nil,
                     unread_count_display: integer | nil,
                     display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                     purpose: %{creator: binary, last_set: integer, value: binary},
                     members: [binary] | nil,
                     unlinked: integer | nil,
                     is_moved: integer | nil,
                     pending_connected_team_ids: [binary] | nil,
                     conversation_host_id: binary | nil,
                     is_private: boolean,
                     topic: %{creator: binary, last_set: integer, value: binary},
                     is_im: boolean,
                     name_normalized: binary,
                     is_starred: boolean | nil,
                     version: integer | nil,
                     is_channel: boolean,
                     shared_team_ids: [binary] | nil,
                     unread_count: integer | nil,
                     is_pending_ext_shared: boolean | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     created: integer,
                     priority: number | nil,
                     is_non_threadable: boolean | nil,
                     previous_names: [binary] | nil,
                     is_open: boolean | nil,
                     is_thread_only: boolean | nil,
                     connected_team_ids: [binary] | nil,
                     user: binary | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     pending_shared: [binary] | nil,
                     is_archived: boolean,
                     is_shared: boolean,
                     is_member: boolean | nil,
                     id: binary,
                     parent_conversation: binary | nil
                   }
                 | %{
                     created: integer,
                     has_pins: boolean | nil,
                     id: binary,
                     is_archived: boolean | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     is_im: boolean,
                     is_open: boolean | nil,
                     is_org_shared: boolean,
                     is_shared: boolean | nil,
                     is_starred: boolean | nil,
                     is_user_deleted: boolean | nil,
                     last_read: binary | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     parent_conversation: binary | nil,
                     pin_count: integer | nil,
                     priority: number,
                     shares:
                       [
                         %{
                           date_create: integer,
                           id: binary,
                           is_active: boolean,
                           name: binary,
                           team: Slack.ObjsTeam.t()
                         }
                       ]
                       | nil,
                     unread_count: integer | nil,
                     unread_count_display: integer | nil,
                     user: binary,
                     version: integer | nil
                   }
               ],
               ok: boolean,
               response_metadata: %{next_cursor: binary} | nil
             }}
            | {:error,
               %{
                 callstack: binary | nil,
                 error: binary,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
          when opt:
                 {:token, binary}
                 | {:exclude_archived, boolean}
                 | {:types, binary}
                 | {:limit, integer}
                 | {:cursor, binary}
    def(conversations_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/conversations.list",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              exclude_archived: nil,
              types: nil,
              limit: nil,
              cursor: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             channels: Enum.map(body["channels"], fn item -> {:TODO, :OneOfDecode} end),
             ok: body["ok"],
             response_metadata: %{next_cursor: body["response_metadata"]["next_cursor"]}
           }}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             error: body["error"],
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Lists reactions made by a user."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `reactions:read`\n- `user`: Show reactions made by this user. Defaults to the authed user.\n- `full`: If true always return the complete reaction list.\n- `count`: \n- `page`: \n- `cursor`: Parameter for pagination. Set `cursor` equal to the `next_cursor` attribute returned by the previous request's `response_metadata`. This parameter is optional, but pagination is mandatory: the default value simply fetches the first \"page\" of the collection. See [pagination](/docs/pagination) for more details.\n- `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the list hasn't been reached.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/reactions.list)"}
    "
    @spec reactions_list(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               items: [
                 %{channel: binary, message: Slack.ObjsMessage.t(), type: binary}
                 | %{file: Slack.ObjsFile.t(), type: binary}
                 | %{comment: Slack.ObjsComment.t(), file: Slack.ObjsFile.t(), type: binary}
               ],
               ok: boolean,
               paging: Slack.ObjsPaging.t() | nil,
               response_metadata:
                 %{next_cursor: binary}
                 | %{messages: [binary], warnings: [binary]}
                 | %{messages: [binary], next_cursor: binary, warnings: [binary]}
                 | nil
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt:
                 {:token, binary}
                 | {:user, binary}
                 | {:full, boolean}
                 | {:count, integer}
                 | {:page, integer}
                 | {:cursor, binary}
                 | {:limit, integer}
    def(reactions_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/reactions.list",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              user: nil,
              full: nil,
              count: nil,
              page: nil,
              cursor: nil,
              limit: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             items: Enum.map(body["items"], fn item -> {:TODO, :OneOfDecode} end),
             ok: body["ok"],
             paging: Slack.ObjsPaging.decode(body["paging"]),
             response_metadata: {:TODO, :OneOfDecode}
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(reactions_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Gets information about a user."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `users:read`\n- `include_locale`: Set this to `true` to receive the locale for this user. Defaults to `false`\n- `user`: User to get info on\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/users.info)"}
    "
    @spec users_info(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               ok: boolean,
               user:
                 %{
                   color: binary | nil,
                   deleted: boolean | nil,
                   enterprise_user: Slack.ObjsEnterpriseUser.t() | nil,
                   has_2fa: boolean | nil,
                   id: binary,
                   is_admin: boolean | nil,
                   is_app_user: boolean,
                   is_bot: boolean,
                   is_external: boolean | nil,
                   is_forgotten: boolean | nil,
                   is_invited_user: boolean | nil,
                   is_owner: boolean | nil,
                   is_primary_owner: boolean | nil,
                   is_restricted: boolean | nil,
                   is_stranger: boolean | nil,
                   is_ultra_restricted: boolean | nil,
                   locale: binary | nil,
                   name: binary,
                   presence: binary | nil,
                   profile: Slack.ObjsUserProfile.t(),
                   real_name: binary | nil,
                   team: binary | nil,
                   team_id: binary | nil,
                   team_profile: %{fields: [Slack.ObjsTeamProfileField.t()]} | nil,
                   two_factor_type: binary | nil,
                   tz: binary | nil,
                   tz_label: binary | nil,
                   tz_offset: number | nil,
                   updated: number
                 }
                 | %{
                     color: binary | nil,
                     deleted: boolean | nil,
                     enterprise_user: Slack.ObjsEnterpriseUser.t() | nil,
                     has_2fa: boolean | nil,
                     id: binary,
                     is_admin: boolean | nil,
                     is_app_user: boolean,
                     is_bot: boolean,
                     is_external: boolean | nil,
                     is_forgotten: boolean | nil,
                     is_owner: boolean | nil,
                     is_primary_owner: boolean | nil,
                     is_restricted: boolean | nil,
                     is_stranger: boolean | nil,
                     is_ultra_restricted: boolean | nil,
                     locale: binary | nil,
                     name: binary,
                     presence: binary | nil,
                     profile: Slack.ObjsUserProfile.t(),
                     real_name: binary | nil,
                     team_id: binary | nil,
                     team_profile: %{fields: [Slack.ObjsTeamProfileField.t()]} | nil,
                     teams: [binary] | nil,
                     two_factor_type: binary | nil,
                     tz: binary | nil,
                     tz_label: binary | nil,
                     tz_offset: number | nil,
                     updated: number
                   }
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:include_locale, boolean} | {:user, binary}
    def(users_info(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/users.info",
          query: Tesla.OpenApi.encode_query(query, token: nil, include_locale: nil, user: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"], user: {:TODO, :OneOfDecode}}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(users_info: 2)
  )

  (
    @doc "#{nil}
    
    #{"Marked a user as active. Deprecated and non-functional."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/users.setActive)"}
    "
    @spec users_set_active(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(users_set_active(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/users.setActive")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(users_set_active: 1)
  )

  (
    @doc "#{nil}
    
    #{"Set the posting permissions for a public or private channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.setConversationPrefs)"}
    "
    @spec admin_conversations_set_conversation_prefs(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{error: binary, ok: boolean}} | {:error, any}
    def(admin_conversations_set_conversation_prefs(client \\ new())) do
      case(
        Tesla.request(client, method: :post, url: "/admin.conversations.setConversationPrefs")
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_set_conversation_prefs: 1)
  )

  (
    @doc "#{nil}
    
    #{"Set an existing guest, regular user, or admin user to be a workspace owner."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.users.setOwner)"}
    "
    @spec admin_users_set_owner(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_users_set_owner(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.users.setOwner")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_users_set_owner: 1)
  )

  (
    @doc "#{nil}
    
    #{"Gets information about a file."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `files:read`\n- `file`: Specify a file by providing its ID.\n- `count`: \n- `page`: \n- `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the list hasn't been reached.\n- `cursor`: Parameter for pagination. File comments are paginated for a single file. Set `cursor` equal to the `next_cursor` attribute returned by the previous request's `response_metadata`. This parameter is optional, but pagination is mandatory: the default value simply fetches the first \"page\" of the collection of comments. See [pagination](/docs/pagination) for more details.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/files.info)"}
    "
    @spec files_info(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               comments: list,
               content_html: nil,
               editor: binary | nil,
               file: Slack.ObjsFile.t(),
               ok: boolean,
               paging: Slack.ObjsPaging.t() | nil,
               response_metadata:
                 %{next_cursor: binary}
                 | %{messages: [binary], warnings: [binary]}
                 | %{messages: [binary], next_cursor: binary, warnings: [binary]}
                 | nil
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt:
                 {:token, binary}
                 | {:file, binary}
                 | {:count, binary}
                 | {:page, binary}
                 | {:limit, integer}
                 | {:cursor, binary}
    def(files_info(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/files.info",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              file: nil,
              count: nil,
              page: nil,
              limit: nil,
              cursor: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             comments: body["comments"],
             content_html: body["content_html"],
             editor: body["editor"],
             file: Slack.ObjsFile.decode(body["file"]),
             ok: body["ok"],
             paging: Slack.ObjsPaging.decode(body["paging"]),
             response_metadata: {:TODO, :OneOfDecode}
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(files_info: 2)
  )

  (
    @doc "#{nil}
    
    #{"Deletes a pending scheduled message from the queue."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/chat.deleteScheduledMessage)"}
    "
    @spec chat_delete_scheduled_message(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(chat_delete_scheduled_message(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/chat.deleteScheduledMessage")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(chat_delete_scheduled_message: 1)
  )

  (
    @doc "#{nil}
    
    #{"Gets user presence information."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `users:read`\n- `user`: User to get presence info on. Defaults to the authed user.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/users.getPresence)"}
    "
    @spec users_get_presence(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               auto_away: boolean | nil,
               connection_count: integer | nil,
               last_activity: integer | nil,
               manual_away: boolean | nil,
               ok: boolean,
               online: boolean | nil,
               presence: binary
             }}
            | {:error, %{error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:user, binary}
    def(users_get_presence(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/users.getPresence",
          query: Tesla.OpenApi.encode_query(query, token: nil, user: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             auto_away: body["auto_away"],
             connection_count: body["connection_count"],
             last_activity: body["last_activity"],
             manual_away: body["manual_away"],
             ok: body["ok"],
             online: body["online"],
             presence: body["presence"]
           }}

        {:ok, %{body: body}} ->
          {:error, %{error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(users_get_presence: 2)
  )

  (
    @doc "#{nil}
    
    #{"Retrieves a user's current Do Not Disturb status."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `dnd:read`\n- `user`: User to fetch status for (defaults to current user)\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/dnd.info)"}
    "
    @spec dnd_info(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               dnd_enabled: boolean,
               next_dnd_end_ts: integer,
               next_dnd_start_ts: integer,
               ok: boolean,
               snooze_enabled: boolean | nil,
               snooze_endtime: integer | nil,
               snooze_remaining: integer | nil
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:user, binary}
    def(dnd_info(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/dnd.info",
          query: Tesla.OpenApi.encode_query(query, token: nil, user: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             dnd_enabled: body["dnd_enabled"],
             next_dnd_end_ts: body["next_dnd_end_ts"],
             next_dnd_start_ts: body["next_dnd_start_ts"],
             ok: body["ok"],
             snooze_enabled: body["snooze_enabled"],
             snooze_endtime: body["snooze_endtime"],
             snooze_remaining: body["snooze_remaining"]
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(dnd_info: 2)
  )

  (
    @doc "#{nil}
    
    #{"Removes a star from an item."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/stars.remove)"}
    "
    @spec stars_remove(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(stars_remove(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/stars.remove")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(stars_remove: 1)
  )

  (
    @doc "#{nil}
    
    #{"Delete a public or private channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.conversations.delete)"}
    "
    @spec admin_conversations_delete(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{error: binary, ok: boolean}} | {:error, any}
    def(admin_conversations_delete(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.conversations.delete")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_conversations_delete: 1)
  )

  (
    @doc "#{nil}
    
    #{"Initiates a public or private channel-based conversation"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.create)"}
    "
    @spec conversations_create(Tesla.Client.t()) ::
            {:ok,
             %{
               channel:
                 %{
                   accepted_user: binary | nil,
                   name: binary,
                   is_org_shared: boolean,
                   shares:
                     [
                       %{
                         accepted_user: binary | nil,
                         is_active: boolean,
                         team: Slack.ObjsTeam.t(),
                         user: binary
                       }
                     ]
                     | nil,
                   is_group: boolean,
                   has_pins: boolean | nil,
                   is_org_default: boolean | nil,
                   timezone_count: integer | nil,
                   is_read_only: boolean | nil,
                   use_case: binary | nil,
                   last_read: binary | nil,
                   creator: binary,
                   internal_team_ids: [binary] | nil,
                   is_general: boolean,
                   num_members: integer | nil,
                   is_mpim: boolean,
                   pin_count: integer | nil,
                   unread_count_display: integer | nil,
                   display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                   purpose: %{creator: binary, last_set: integer, value: binary},
                   members: [binary] | nil,
                   unlinked: integer | nil,
                   is_moved: integer | nil,
                   pending_connected_team_ids: [binary] | nil,
                   conversation_host_id: binary | nil,
                   is_private: boolean,
                   topic: %{creator: binary, last_set: integer, value: binary},
                   is_im: boolean,
                   name_normalized: binary,
                   is_starred: boolean | nil,
                   version: integer | nil,
                   is_channel: boolean,
                   enterprise_id: binary | nil,
                   shared_team_ids: [binary] | nil,
                   unread_count: integer | nil,
                   is_global_shared: boolean | nil,
                   is_pending_ext_shared: boolean | nil,
                   latest: Slack.ObjsMessage.t() | nil,
                   created: integer,
                   priority: number | nil,
                   is_non_threadable: boolean | nil,
                   previous_names: [binary] | nil,
                   is_open: boolean | nil,
                   is_thread_only: boolean | nil,
                   is_org_mandatory: boolean | nil,
                   connected_team_ids: [binary] | nil,
                   user: binary | nil,
                   is_ext_shared: boolean | nil,
                   is_frozen: boolean | nil,
                   pending_shared: [binary] | nil,
                   is_archived: boolean,
                   is_shared: boolean,
                   is_member: boolean | nil,
                   id: binary,
                   parent_conversation: binary | nil
                 }
                 | %{
                     accepted_user: binary | nil,
                     name: binary,
                     is_org_shared: boolean,
                     shares:
                       [
                         %{
                           accepted_user: binary | nil,
                           is_active: boolean,
                           team: Slack.ObjsTeam.t(),
                           user: binary
                         }
                       ]
                       | nil,
                     is_group: boolean,
                     timezone_count: integer | nil,
                     is_read_only: boolean | nil,
                     last_read: binary | nil,
                     creator: binary,
                     internal_team_ids: [binary] | nil,
                     is_general: boolean,
                     num_members: integer | nil,
                     is_mpim: boolean,
                     pin_count: integer | nil,
                     unread_count_display: integer | nil,
                     display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                     purpose: %{creator: binary, last_set: integer, value: binary},
                     members: [binary] | nil,
                     unlinked: integer | nil,
                     is_moved: integer | nil,
                     pending_connected_team_ids: [binary] | nil,
                     conversation_host_id: binary | nil,
                     is_private: boolean,
                     topic: %{creator: binary, last_set: integer, value: binary},
                     is_im: boolean,
                     name_normalized: binary,
                     is_starred: boolean | nil,
                     version: integer | nil,
                     is_channel: boolean,
                     shared_team_ids: [binary] | nil,
                     unread_count: integer | nil,
                     is_pending_ext_shared: boolean | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     created: integer,
                     priority: number | nil,
                     is_non_threadable: boolean | nil,
                     previous_names: [binary] | nil,
                     is_open: boolean | nil,
                     is_thread_only: boolean | nil,
                     connected_team_ids: [binary] | nil,
                     user: binary | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     pending_shared: [binary] | nil,
                     is_archived: boolean,
                     is_shared: boolean,
                     is_member: boolean | nil,
                     id: binary,
                     parent_conversation: binary | nil
                   }
                 | %{
                     created: integer,
                     has_pins: boolean | nil,
                     id: binary,
                     is_archived: boolean | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     is_im: boolean,
                     is_open: boolean | nil,
                     is_org_shared: boolean,
                     is_shared: boolean | nil,
                     is_starred: boolean | nil,
                     is_user_deleted: boolean | nil,
                     last_read: binary | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     parent_conversation: binary | nil,
                     pin_count: integer | nil,
                     priority: number,
                     shares:
                       [
                         %{
                           date_create: integer,
                           id: binary,
                           is_active: boolean,
                           name: binary,
                           team: Slack.ObjsTeam.t()
                         }
                       ]
                       | nil,
                     unread_count: integer | nil,
                     unread_count_display: integer | nil,
                     user: binary,
                     version: integer | nil
                   },
               ok: boolean
             }}
            | {:error,
               %{
                 callstack: binary | nil,
                 detail: binary | nil,
                 error: binary,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
    def(conversations_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/conversations.create")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{channel: {:TODO, :OneOfDecode}, ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             detail: body["detail"],
             error: body["error"],
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_create: 1)
  )

  (
    @doc "#{nil}
    
    #{"Invite a user to a workspace."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.users.invite)"}
    "
    @spec admin_users_invite(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_users_invite(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.users.invite")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_users_invite: 1)
  )

  (
    @doc "#{nil}
    
    #{"List all denied workspace invite requests."}
    
    #{"### Query parameters\n\n- `team_id`: ID for the workspace where the invite requests were made.\n- `cursor`: Value of the `next_cursor` field sent as part of the previous api response\n- `limit`: The number of results that will be returned by the API on each invocation. Must be between 1 - 1000 both inclusive\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.inviteRequests.denied.list)"}
    "
    @spec admin_invite_requests_denied_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:team_id, binary} | {:cursor, binary} | {:limit, integer}
    def(admin_invite_requests_denied_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.inviteRequests.denied.list",
          query: Tesla.OpenApi.encode_query(query, team_id: nil, cursor: nil, limit: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_invite_requests_denied_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Create a User Group"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/usergroups.create)"}
    "
    @spec usergroups_create(Tesla.Client.t()) ::
            {:ok, %{ok: boolean, usergroup: Slack.ObjsSubteam.t()}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(usergroups_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/usergroups.create")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"], usergroup: Slack.ObjsSubteam.decode(body["usergroup"])}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(usergroups_create: 1)
  )

  (
    @doc "#{nil}
    
    #{"Invalidate a single session for a user by session_id"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.users.session.invalidate)"}
    "
    @spec admin_users_session_invalidate(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_users_session_invalidate(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.users.session.invalidate")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_users_session_invalidate: 1)
  )

  (
    @doc "#{nil}
    
    #{"List emoji for an Enterprise Grid organization."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `admin.teams:read`\n- `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page\n- `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.emoji.list)"}
    "
    @spec admin_emoji_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:token, binary} | {:cursor, binary} | {:limit, integer}
    def(admin_emoji_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.emoji.list",
          query: Tesla.OpenApi.encode_query(query, token: nil, cursor: nil, limit: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_emoji_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Creates a reminder."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/reminders.add)"}
    "
    @spec reminders_add(Tesla.Client.t()) ::
            {:ok, %{ok: boolean, reminder: Slack.ObjsReminder.t()}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(reminders_add(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/reminders.add")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"], reminder: Slack.ObjsReminder.decode(body["reminder"])}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(reminders_add: 1)
  )

  (
    @doc "#{nil}
    
    #{"Turns on Do Not Disturb mode for the current user, or changes its duration."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/dnd.setSnooze)"}
    "
    @spec dnd_set_snooze(Tesla.Client.t()) ::
            {:ok,
             %{
               ok: boolean,
               snooze_enabled: boolean,
               snooze_endtime: integer,
               snooze_remaining: integer
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(dnd_set_snooze(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/dnd.setSnooze")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             ok: body["ok"],
             snooze_enabled: body["snooze_enabled"],
             snooze_endtime: body["snooze_endtime"],
             snooze_remaining: body["snooze_remaining"]
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(dnd_set_snooze: 1)
  )

  (
    @doc "#{nil}
    
    #{"Open a view for a user."}
    
    #{"### Query parameters\n\n- `trigger_id`: Exchange a trigger to post to the user.\n- `view`: A [view payload](/reference/surfaces/views). This must be a JSON-encoded string.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/views.open)"}
    "
    @spec views_open(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:trigger_id, binary} | {:view, binary}
    def(views_open(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/views.open",
          query: Tesla.OpenApi.encode_query(query, trigger_id: nil, view: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(views_open: 2)
  )

  (
    @doc "#{nil}
    
    #{"Restrict an app for installation on a workspace."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.apps.restrict)"}
    "
    @spec admin_apps_restrict(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_apps_restrict(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.apps.restrict")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_apps_restrict: 1)
  )

  (
    @doc "#{nil}
    
    #{"Deletes a file."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/files.delete)"}
    "
    @spec files_delete(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(files_delete(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/files.delete")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(files_delete: 1)
  )

  (
    @doc "#{nil}
    
    #{"Lists all reminders created by or for a given user."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `reminders:read`\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/reminders.list)"}
    "
    @spec reminders_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean, reminders: [Slack.ObjsReminder.t()]}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary}
    def(reminders_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/reminders.list",
          query: Tesla.OpenApi.encode_query(query, token: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             ok: body["ok"],
             reminders:
               Enum.map(body["reminders"], fn item -> Slack.ObjsReminder.decode(item) end)
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(reminders_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Retrieve information about a conversation."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `conversations:read`\n- `channel`: Conversation ID to learn more about\n- `include_locale`: Set this to `true` to receive the locale for this conversation. Defaults to `false`\n- `include_num_members`: Set to `true` to include the member count for the specified conversation. Defaults to `false`\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/conversations.info)"}
    "
    @spec conversations_info(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               channel:
                 %{
                   accepted_user: binary | nil,
                   name: binary,
                   is_org_shared: boolean,
                   shares:
                     [
                       %{
                         accepted_user: binary | nil,
                         is_active: boolean,
                         team: Slack.ObjsTeam.t(),
                         user: binary
                       }
                     ]
                     | nil,
                   is_group: boolean,
                   has_pins: boolean | nil,
                   is_org_default: boolean | nil,
                   timezone_count: integer | nil,
                   is_read_only: boolean | nil,
                   use_case: binary | nil,
                   last_read: binary | nil,
                   creator: binary,
                   internal_team_ids: [binary] | nil,
                   is_general: boolean,
                   num_members: integer | nil,
                   is_mpim: boolean,
                   pin_count: integer | nil,
                   unread_count_display: integer | nil,
                   display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                   purpose: %{creator: binary, last_set: integer, value: binary},
                   members: [binary] | nil,
                   unlinked: integer | nil,
                   is_moved: integer | nil,
                   pending_connected_team_ids: [binary] | nil,
                   conversation_host_id: binary | nil,
                   is_private: boolean,
                   topic: %{creator: binary, last_set: integer, value: binary},
                   is_im: boolean,
                   name_normalized: binary,
                   is_starred: boolean | nil,
                   version: integer | nil,
                   is_channel: boolean,
                   enterprise_id: binary | nil,
                   shared_team_ids: [binary] | nil,
                   unread_count: integer | nil,
                   is_global_shared: boolean | nil,
                   is_pending_ext_shared: boolean | nil,
                   latest: Slack.ObjsMessage.t() | nil,
                   created: integer,
                   priority: number | nil,
                   is_non_threadable: boolean | nil,
                   previous_names: [binary] | nil,
                   is_open: boolean | nil,
                   is_thread_only: boolean | nil,
                   is_org_mandatory: boolean | nil,
                   connected_team_ids: [binary] | nil,
                   user: binary | nil,
                   is_ext_shared: boolean | nil,
                   is_frozen: boolean | nil,
                   pending_shared: [binary] | nil,
                   is_archived: boolean,
                   is_shared: boolean,
                   is_member: boolean | nil,
                   id: binary,
                   parent_conversation: binary | nil
                 }
                 | %{
                     accepted_user: binary | nil,
                     name: binary,
                     is_org_shared: boolean,
                     shares:
                       [
                         %{
                           accepted_user: binary | nil,
                           is_active: boolean,
                           team: Slack.ObjsTeam.t(),
                           user: binary
                         }
                       ]
                       | nil,
                     is_group: boolean,
                     timezone_count: integer | nil,
                     is_read_only: boolean | nil,
                     last_read: binary | nil,
                     creator: binary,
                     internal_team_ids: [binary] | nil,
                     is_general: boolean,
                     num_members: integer | nil,
                     is_mpim: boolean,
                     pin_count: integer | nil,
                     unread_count_display: integer | nil,
                     display_counts: %{display_counts: integer, guest_counts: integer} | nil,
                     purpose: %{creator: binary, last_set: integer, value: binary},
                     members: [binary] | nil,
                     unlinked: integer | nil,
                     is_moved: integer | nil,
                     pending_connected_team_ids: [binary] | nil,
                     conversation_host_id: binary | nil,
                     is_private: boolean,
                     topic: %{creator: binary, last_set: integer, value: binary},
                     is_im: boolean,
                     name_normalized: binary,
                     is_starred: boolean | nil,
                     version: integer | nil,
                     is_channel: boolean,
                     shared_team_ids: [binary] | nil,
                     unread_count: integer | nil,
                     is_pending_ext_shared: boolean | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     created: integer,
                     priority: number | nil,
                     is_non_threadable: boolean | nil,
                     previous_names: [binary] | nil,
                     is_open: boolean | nil,
                     is_thread_only: boolean | nil,
                     connected_team_ids: [binary] | nil,
                     user: binary | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     pending_shared: [binary] | nil,
                     is_archived: boolean,
                     is_shared: boolean,
                     is_member: boolean | nil,
                     id: binary,
                     parent_conversation: binary | nil
                   }
                 | %{
                     created: integer,
                     has_pins: boolean | nil,
                     id: binary,
                     is_archived: boolean | nil,
                     is_ext_shared: boolean | nil,
                     is_frozen: boolean | nil,
                     is_im: boolean,
                     is_open: boolean | nil,
                     is_org_shared: boolean,
                     is_shared: boolean | nil,
                     is_starred: boolean | nil,
                     is_user_deleted: boolean | nil,
                     last_read: binary | nil,
                     latest: Slack.ObjsMessage.t() | nil,
                     parent_conversation: binary | nil,
                     pin_count: integer | nil,
                     priority: number,
                     shares:
                       [
                         %{
                           date_create: integer,
                           id: binary,
                           is_active: boolean,
                           name: binary,
                           team: Slack.ObjsTeam.t()
                         }
                       ]
                       | nil,
                     unread_count: integer | nil,
                     unread_count_display: integer | nil,
                     user: binary,
                     version: integer | nil
                   },
               ok: boolean
             }}
            | {:error,
               %{
                 callstack: binary | nil,
                 error: binary,
                 needed: binary | nil,
                 ok: boolean,
                 provided: binary | nil
               }}
            | {:error, any}
          when opt:
                 {:token, binary}
                 | {:channel, binary}
                 | {:include_locale, boolean}
                 | {:include_num_members, boolean}
    def(conversations_info(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/conversations.info",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              channel: nil,
              include_locale: nil,
              include_num_members: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{channel: {:TODO, :OneOfDecode}, ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error,
           %{
             callstack: body["callstack"],
             error: body["error"],
             needed: body["needed"],
             ok: body["ok"],
             provided: body["provided"]
           }}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(conversations_info: 2)
  )

  (
    @doc "#{nil}
    
    #{"Starts a Real Time Messaging session."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `rtm:stream`\n- `batch_presence_aware`: Batch presence deliveries via subscription. Enabling changes the shape of `presence_change` events. See [batch presence](/docs/presence-and-status#batching).\n- `presence_sub`: Only deliver presence events when requested by subscription. See [presence subscriptions](/docs/presence-and-status#subscriptions).\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/rtm.connect)"}
    "
    @spec rtm_connect(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               ok: boolean,
               self: %{id: binary, name: binary},
               team: %{domain: binary, id: binary, name: binary},
               url: binary
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:batch_presence_aware, boolean} | {:presence_sub, boolean}
    def(rtm_connect(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/rtm.connect",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              batch_presence_aware: nil,
              presence_sub: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             ok: body["ok"],
             self: %{id: body["self"]["id"], name: body["self"]["name"]},
             team: %{
               domain: body["team"]["domain"],
               id: body["team"]["id"],
               name: body["team"]["name"]
             },
             url: body["url"]
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(rtm_connect: 2)
  )

  (
    @doc "#{nil}
    
    #{"Sends a message to a channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/chat.postMessage)"}
    "
    @spec chat_post_message(Tesla.Client.t()) ::
            {:ok, %{channel: binary, message: Slack.ObjsMessage.t(), ok: boolean, ts: binary}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(chat_post_message(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/chat.postMessage")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             channel: body["channel"],
             message: Slack.ObjsMessage.decode(body["message"]),
             ok: body["ok"],
             ts: body["ts"]
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(chat_post_message: 1)
  )

  (
    @doc "#{nil}
    
    #{"Returns list of resource grants this app has on a team."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `none`\n- `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first \"page\" of the collection. See [pagination](/docs/pagination) for more detail.\n- `limit`: The maximum number of items to return.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/apps.permissions.resources.list)"}
    "
    @spec apps_permissions_resources_list(Tesla.Client.t(), [opt]) ::
            {:ok,
             %{
               ok: boolean,
               resources: [%{id: binary | nil, type: binary | nil}],
               response_metadata: %{next_cursor: binary} | nil
             }}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt: {:token, binary} | {:cursor, binary} | {:limit, integer}
    def(apps_permissions_resources_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/apps.permissions.resources.list",
          query: Tesla.OpenApi.encode_query(query, token: nil, cursor: nil, limit: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok,
           %{
             ok: body["ok"],
             resources:
               Enum.map(body["resources"], fn item -> %{id: item["id"], type: item["type"]} end),
             response_metadata: %{next_cursor: body["response_metadata"]["next_cursor"]}
           }}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(apps_permissions_resources_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Registers participants removed from a Call."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/calls.participants.remove)"}
    "
    @spec calls_participants_remove(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(calls_participants_remove(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/calls.participants.remove")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(calls_participants_remove: 1)
  )

  (
    @doc "#{nil}
    
    #{"Remove an emoji across an Enterprise Grid organization"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.emoji.remove)"}
    "
    @spec admin_emoji_remove(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_emoji_remove(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.emoji.remove")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_emoji_remove: 1)
  )

  (
    @doc "#{nil}
    
    #{"List all teams on an Enterprise organization"}
    
    #{"### Query parameters\n\n- `limit`: The maximum number of items to return. Must be between 1 - 100 both inclusive.\n- `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.teams.list)"}
    "
    @spec admin_teams_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:limit, integer} | {:cursor, binary}
    def(admin_teams_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.teams.list",
          query: Tesla.OpenApi.encode_query(query, limit: nil, cursor: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_teams_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Enables an app to trigger a permissions modal to grant an app access to a user access scope."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `none`\n- `scopes`: A comma separated list of user scopes to request for\n- `trigger_id`: Token used to trigger the request\n- `user`: The user this scope is being requested for\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/apps.permissions.users.request)"}
    "
    @spec apps_permissions_users_request(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:token, binary} | {:scopes, binary} | {:trigger_id, binary} | {:user, binary}
    def(apps_permissions_users_request(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/apps.permissions.users.request",
          query:
            Tesla.OpenApi.encode_query(query, token: nil, scopes: nil, trigger_id: nil, user: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(apps_permissions_users_request: 2)
  )

  (
    @doc "#{nil}
    
    #{"Marks a reminder as complete."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/reminders.complete)"}
    "
    @spec reminders_complete(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(reminders_complete(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/reminders.complete")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(reminders_complete: 1)
  )

  (
    @doc "#{nil}
    
    #{"Uploads or creates a file."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/files.upload)"}
    "
    @spec files_upload(Tesla.Client.t()) ::
            {:ok, %{file: Slack.ObjsFile.t(), ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(files_upload(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/files.upload")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{file: Slack.ObjsFile.decode(body["file"]), ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(files_upload: 1)
  )

  (
    @doc "#{nil}
    
    #{"List all pending workspace invite requests."}
    
    #{"### Query parameters\n\n- `team_id`: ID for the workspace where the invite requests were made.\n- `cursor`: Value of the `next_cursor` field sent as part of the previous API response\n- `limit`: The number of results that will be returned by the API on each invocation. Must be between 1 - 1000, both inclusive\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.inviteRequests.list)"}
    "
    @spec admin_invite_requests_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:team_id, binary} | {:cursor, binary} | {:limit, integer}
    def(admin_invite_requests_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.inviteRequests.list",
          query: Tesla.OpenApi.encode_query(query, team_id: nil, cursor: nil, limit: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_invite_requests_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"Update the list of users for a User Group"}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/usergroups.users.update)"}
    "
    @spec usergroups_users_update(Tesla.Client.t()) ::
            {:ok, %{ok: boolean, usergroup: Slack.ObjsSubteam.t()}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(usergroups_users_update(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/usergroups.users.update")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"], usergroup: Slack.ObjsSubteam.decode(body["usergroup"])}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(usergroups_users_update: 1)
  )

  (
    @doc "#{nil}
    
    #{"Gets reactions for an item."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `reactions:read`\n- `channel`: Channel where the message to get reactions for was posted.\n- `file`: File to get reactions for.\n- `file_comment`: File comment to get reactions for.\n- `full`: If true always return the complete reaction list.\n- `timestamp`: Timestamp of the message to get reactions for.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/reactions.get)"}
    "
    @spec reactions_get(Tesla.Client.t(), [opt]) ::
            {:ok, %{}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
          when opt:
                 {:token, binary}
                 | {:channel, binary}
                 | {:file, binary}
                 | {:file_comment, binary}
                 | {:full, boolean}
                 | {:timestamp, binary}
    def(reactions_get(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/reactions.get",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              channel: nil,
              file: nil,
              file_comment: nil,
              full: nil,
              timestamp: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(reactions_get: 2)
  )

  (
    @doc "#{nil}
    
    #{"Remove one or more default channels from an org-level IDP group (user group)."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.usergroups.removeChannels)"}
    "
    @spec admin_usergroups_remove_channels(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_usergroups_remove_channels(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.usergroups.removeChannels")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_usergroups_remove_channels: 1)
  )

  (
    @doc "#{nil}
    
    #{"Registers new participants added to a Call."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/calls.participants.add)"}
    "
    @spec calls_participants_add(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(calls_participants_add(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/calls.participants.add")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(calls_participants_add: 1)
  )

  (
    @doc "#{nil}
    
    #{"Pins an item to a channel."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/pins.add)"}
    "
    @spec pins_add(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(pins_add(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/pins.add")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(pins_add: 1)
  )

  (
    @doc "#{nil}
    
    #{"Enables a file for public/external sharing."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/files.sharedPublicURL)"}
    "
    @spec files_shared_public_url(Tesla.Client.t()) ::
            {:ok, %{file: Slack.ObjsFile.t(), ok: boolean}}
            | {:error, %{callstack: binary | nil, error: binary, ok: boolean}}
            | {:error, any}
    def(files_shared_public_url(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/files.sharedPublicURL")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{file: Slack.ObjsFile.decode(body["file"]), ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{callstack: body["callstack"], error: body["error"], ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(files_shared_public_url: 1)
  )

  (
    @doc "#{nil}
    
    #{"Set the description of a given workspace."}
    
    #{""}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.teams.settings.setDescription)"}
    "
    @spec admin_teams_settings_set_description(Tesla.Client.t()) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
    def(admin_teams_settings_set_description(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/admin.teams.settings.setDescription")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_teams_settings_set_description: 1)
  )

  (
    @doc "#{nil}
    
    #{"Retrieve information about a remote file added to Slack"}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `remote_files:read`\n- `channel`: Filter files appearing in a specific channel, indicated by its ID.\n- `ts_from`: Filter files created after this timestamp (inclusive).\n- `ts_to`: Filter files created before this timestamp (inclusive).\n- `limit`: The maximum number of items to return.\n- `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first \"page\" of the collection. See [pagination](/docs/pagination) for more detail.\n"}
    
    #{"[API method documentation](https://api.slack.com/methods/files.remote.list)"}
    "
    @spec files_remote_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt:
                 {:token, binary}
                 | {:channel, binary}
                 | {:ts_from, number}
                 | {:ts_to, number}
                 | {:limit, integer}
                 | {:cursor, binary}
    def(files_remote_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/files.remote.list",
          query:
            Tesla.OpenApi.encode_query(query,
              token: nil,
              channel: nil,
              ts_from: nil,
              ts_to: nil,
              limit: nil,
              cursor: nil
            )
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(files_remote_list: 2)
  )

  (
    @doc "#{nil}
    
    #{"List app requests for a team/workspace."}
    
    #{"### Query parameters\n\n- `token`: Authentication token. Requires scope: `admin.apps:read`\n- `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.\n- `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page\n- `team_id`: \n"}
    
    #{"[API method documentation](https://api.slack.com/methods/admin.apps.requests.list)"}
    "
    @spec admin_apps_requests_list(Tesla.Client.t(), [opt]) ::
            {:ok, %{ok: boolean}} | {:error, %{ok: boolean}} | {:error, any}
          when opt: {:token, binary} | {:limit, integer} | {:cursor, binary} | {:team_id, binary}
    def(admin_apps_requests_list(client \\ new(), query \\ [])) do
      case(
        Tesla.request(client,
          method: :get,
          url: "/admin.apps.requests.list",
          query:
            Tesla.OpenApi.encode_query(query, token: nil, limit: nil, cursor: nil, team_id: nil)
        )
      ) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, %{ok: body["ok"]}}

        {:ok, %{body: body}} ->
          {:error, %{ok: body["ok"]}}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(admin_apps_requests_list: 2)
  )

  (
    @middleware [
      {Tesla.Middleware.BaseUrl, "https://slack.com/api"},
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