defmodule(Plaid) do
  (
    @external_resource "priv/specs/plaid.json"
    @moduledoc "#{"The Plaid API"}
    
    #{"The Plaid REST API. Please see https://plaid.com/docs/api for more details."}
    
    Version #{"2020-09-14_1.33.0"}
    "
  )

  defmodule(BankTransferGetResponse) do
    @moduledoc "#{"BankTransferGetResponse"}
    "
    defstruct(bank_transfer: nil, request_id: nil)
    @type t :: %__MODULE__{bank_transfer: Plaid.BankTransfer.t(), request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, bank_transfer} <- Plaid.BankTransfer.decode(data["bank_transfer"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{bank_transfer: bank_transfer, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "bank_transfer" => Plaid.BankTransfer.encode(data.bank_transfer),
        "request_id" => data.request_id
      }
    end
  end

  defmodule(BankTransfer) do
    @moduledoc "#{"BankTransfer"}
    "
    defstruct(
      account_id: nil,
      ach_class: nil,
      amount: nil,
      cancellable: nil,
      created: nil,
      custom_tag: nil,
      description: nil,
      direction: nil,
      failure_reason: nil,
      id: nil,
      iso_currency_code: nil,
      metadata: nil,
      network: nil,
      origination_account_id: nil,
      status: nil,
      type: nil,
      user: nil
    )

    @type t :: %__MODULE__{
            account_id: binary,
            ach_class: binary,
            amount: binary,
            cancellable: boolean,
            created: binary,
            custom_tag: binary,
            description: binary,
            direction: binary,
            failure_reason: Plaid.BankTransferFailure.t(),
            id: binary,
            iso_currency_code: binary,
            metadata: Plaid.BankTransferMetadata.t(),
            network: binary,
            origination_account_id: binary,
            status: binary,
            type: binary,
            user: Plaid.BankTransferUser.t()
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, ach_class} <-
          case(data["ach_class"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["ACHClass"]}}
          end,
        {:ok, amount} <-
          case(data["amount"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["BankTransferAmount"]}}
          end,
        {:ok, cancellable} <-
          case(data["cancellable"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["cancellable"]}}
          end,
        {:ok, created} <-
          case(data["created"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["created"]}}
          end,
        {:ok, custom_tag} <-
          case(data["custom_tag"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["custom_tag"]}}
          end,
        {:ok, description} <-
          case(data["description"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["description"]}}
          end,
        {:ok, direction} <-
          case(data["direction"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["BankTransferDirection"]}}
          end,
        {:ok, failure_reason} <- Plaid.BankTransferFailure.decode(data["failure_reason"]),
        {:ok, id} <-
          case(data["id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["BankTransferID"]}}
          end,
        {:ok, iso_currency_code} <-
          case(data["iso_currency_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["iso_currency_code"]}}
          end,
        {:ok, metadata} <- Plaid.BankTransferMetadata.decode(data["metadata"]),
        {:ok, network} <-
          case(data["network"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["BankTransferNetwork"]}}
          end,
        {:ok, origination_account_id} <-
          case(data["origination_account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["origination_account_id"]}}
          end,
        {:ok, status} <-
          case(data["status"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["BankTransferStatus"]}}
          end,
        {:ok, type} <-
          case(data["type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["BankTransferType"]}}
          end,
        {:ok, user} <- Plaid.BankTransferUser.decode(data["user"])
      ) do
        {:ok,
         %__MODULE__{
           account_id: account_id,
           ach_class: ach_class,
           amount: amount,
           cancellable: cancellable,
           created: created,
           custom_tag: custom_tag,
           description: description,
           direction: direction,
           failure_reason: failure_reason,
           id: id,
           iso_currency_code: iso_currency_code,
           metadata: metadata,
           network: network,
           origination_account_id: origination_account_id,
           status: status,
           type: type,
           user: user
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransfer" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_id" => data.account_id,
        "ach_class" => data.ach_class,
        "amount" => data.amount,
        "cancellable" => data.cancellable,
        "created" => data.created,
        "custom_tag" => data.custom_tag,
        "description" => data.description,
        "direction" => data.direction,
        "failure_reason" => Plaid.BankTransferFailure.encode(data.failure_reason),
        "id" => data.id,
        "iso_currency_code" => data.iso_currency_code,
        "metadata" => Plaid.BankTransferMetadata.encode(data.metadata),
        "network" => data.network,
        "origination_account_id" => data.origination_account_id,
        "status" => data.status,
        "type" => data.type,
        "user" => Plaid.BankTransferUser.encode(data.user)
      }
    end
  end

  defmodule(AssetReportItem) do
    @moduledoc "#{"AssetReportItem"}
    "
    defstruct(
      accounts: nil,
      date_last_updated: nil,
      institution_id: nil,
      institution_name: nil,
      item_id: nil
    )

    @type t :: %__MODULE__{
            accounts: [any],
            date_last_updated: binary,
            institution_id: binary,
            institution_name: binary,
            item_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, accounts} <-
          data["accounts"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- {:ok, data}) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, date_last_updated} <-
          case(data["date_last_updated"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["date_last_updated"]}}
          end,
        {:ok, institution_id} <-
          case(data["institution_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["institution_id"]}}
          end,
        {:ok, institution_name} <-
          case(data["institution_name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["institution_name"]}}
          end,
        {:ok, item_id} <-
          case(data["item_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["ItemId"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           accounts: accounts,
           date_last_updated: date_last_updated,
           institution_id: institution_id,
           institution_name: institution_name,
           item_id: item_id
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AssetReportItem" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "accounts" =>
          case(data.accounts) do
            nil ->
              nil

            _ ->
              Enum.map(data.accounts, fn item -> item end)
          end,
        "date_last_updated" => data.date_last_updated,
        "institution_id" => data.institution_id,
        "institution_name" => data.institution_name,
        "item_id" => data.item_id
      }
    end
  end

  defmodule(AccountFiltersResponse) do
    @moduledoc "#{"AccountFiltersResponse"}
    "
    defstruct(credit: nil, depository: nil, investment: nil, loan: nil)

    @type t :: %__MODULE__{
            credit: Plaid.CreditFilter.t() | nil,
            depository: Plaid.DepositoryFilter.t() | nil,
            investment: Plaid.InvestmentFilter.t() | nil,
            loan: Plaid.LoanFilter.t() | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, credit} <- Plaid.CreditFilter.decode(data["credit"]),
        {:ok, depository} <- Plaid.DepositoryFilter.decode(data["depository"]),
        {:ok, investment} <- Plaid.InvestmentFilter.decode(data["investment"]),
        {:ok, loan} <- Plaid.LoanFilter.decode(data["loan"])
      ) do
        {:ok,
         %__MODULE__{credit: credit, depository: depository, investment: investment, loan: loan}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AccountFiltersResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "credit" => Plaid.CreditFilter.encode(data.credit),
        "depository" => Plaid.DepositoryFilter.encode(data.depository),
        "investment" => Plaid.InvestmentFilter.encode(data.investment),
        "loan" => Plaid.LoanFilter.encode(data.loan)
      }
    end
  end

  defmodule(W2Box12) do
    @moduledoc "#{"W2Box12"}
    "
    defstruct(amount: nil, code: nil)
    @type t :: %__MODULE__{amount: binary | nil, code: binary | nil}
    @doc false
    def(decode(data)) do
      with(
        {:ok, amount} <-
          case(data["amount"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["amount"]}}
          end,
        {:ok, code} <-
          case(data["code"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["code"]}}
          end
      ) do
        {:ok, %__MODULE__{amount: amount, code: code}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["W2Box12" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"amount" => data.amount, "code" => data.code}
    end
  end

  defmodule(BankTransferCancelResponse) do
    @moduledoc "#{"BankTransferCancelResponse"}
    "
    defstruct(request_id: nil)
    @type t :: %__MODULE__{request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferCancelResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id}
    end
  end

  @type request_id :: binary
  defmodule(AccountBase) do
    @moduledoc "#{"Account"}
    "
    defstruct(
      account_id: nil,
      balances: nil,
      mask: nil,
      name: nil,
      official_name: nil,
      subtype: nil,
      type: nil,
      verification_status: nil
    )

    @type t :: %__MODULE__{
            account_id: binary,
            balances: Plaid.AccountBalance.t(),
            mask: binary,
            name: binary,
            official_name: binary,
            subtype: binary,
            type: binary,
            verification_status: binary | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, balances} <- Plaid.AccountBalance.decode(data["balances"]),
        {:ok, mask} <-
          case(data["mask"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["mask"]}}
          end,
        {:ok, name} <-
          case(data["name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["name"]}}
          end,
        {:ok, official_name} <-
          case(data["official_name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["official_name"]}}
          end,
        {:ok, subtype} <-
          case(data["subtype"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["AccountSubtype"]}}
          end,
        {:ok, type} <-
          case(data["type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["AccountType"]}}
          end,
        {:ok, verification_status} <-
          case(data["verification_status"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["verification_status"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           account_id: account_id,
           balances: balances,
           mask: mask,
           name: name,
           official_name: official_name,
           subtype: subtype,
           type: type,
           verification_status: verification_status
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AccountBase" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_id" => data.account_id,
        "balances" => Plaid.AccountBalance.encode(data.balances),
        "mask" => data.mask,
        "name" => data.name,
        "official_name" => data.official_name,
        "subtype" => data.subtype,
        "type" => data.type,
        "verification_status" => data.verification_status
      }
    end
  end

  defmodule(ProductStatus) do
    @moduledoc "#{"ProductStatus"}
    "
    defstruct(breakdown: nil, last_status_change: nil, status: nil)

    @type t :: %__MODULE__{
            breakdown: Plaid.ProductStatusBreakdown.t(),
            last_status_change: binary,
            status: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, breakdown} <- Plaid.ProductStatusBreakdown.decode(data["breakdown"]),
        {:ok, last_status_change} <-
          case(data["last_status_change"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["last_status_change"]}}
          end,
        {:ok, status} <-
          case(data["status"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["status"]}}
          end
      ) do
        {:ok,
         %__MODULE__{breakdown: breakdown, last_status_change: last_status_change, status: status}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ProductStatus" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "breakdown" => Plaid.ProductStatusBreakdown.encode(data.breakdown),
        "last_status_change" => data.last_status_change,
        "status" => data.status
      }
    end
  end

  defmodule(Error) do
    @moduledoc "#{"Error"}
    "
    defstruct(
      causes: nil,
      display_message: nil,
      documentation_url: nil,
      error_code: nil,
      error_message: nil,
      error_type: nil,
      request_id: nil,
      status: nil,
      suggested_action: nil
    )

    @type t :: %__MODULE__{
            causes: list | nil,
            display_message: binary,
            documentation_url: binary | nil,
            error_code: binary,
            error_message: binary,
            error_type: binary,
            request_id: binary | nil,
            status: number | nil,
            suggested_action: binary | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, causes} <- {:ok, data["causes"]},
        {:ok, display_message} <-
          case(data["display_message"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["display_message"]}}
          end,
        {:ok, documentation_url} <-
          case(data["documentation_url"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["documentation_url"]}}
          end,
        {:ok, error_code} <-
          case(data["error_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["error_code"]}}
          end,
        {:ok, error_message} <-
          case(data["error_message"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["error_message"]}}
          end,
        {:ok, error_type} <-
          case(data["error_type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["error_type"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["request_id"]}}
          end,
        {:ok, status} <-
          case(data["status"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["status"]}}
          end,
        {:ok, suggested_action} <-
          case(data["suggested_action"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["suggested_action"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           causes: causes,
           display_message: display_message,
           documentation_url: documentation_url,
           error_code: error_code,
           error_message: error_message,
           error_type: error_type,
           request_id: request_id,
           status: status,
           suggested_action: suggested_action
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Error" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "causes" => data.causes,
        "display_message" => data.display_message,
        "documentation_url" => data.documentation_url,
        "error_code" => data.error_code,
        "error_message" => data.error_message,
        "error_type" => data.error_type,
        "request_id" => data.request_id,
        "status" => data.status,
        "suggested_action" => data.suggested_action
      }
    end
  end

  defmodule(IncomeVerificationPaystubsGetResponse) do
    @moduledoc "#{"IncomeVerificationPaystubsGetResponse"}
    "
    defstruct(document_metadata: nil, error: nil, paystubs: nil, request_id: nil)

    @type t :: %__MODULE__{
            document_metadata: [Plaid.DocumentMetadata.t()] | nil,
            error: Plaid.Error.t() | nil,
            paystubs: [Plaid.Paystub.t()],
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, document_metadata} <-
          case(data["document_metadata"]) do
            nil ->
              nil

            _ ->
              data["document_metadata"]
              |> Enum.reverse()
              |> Enum.reduce({:ok, []}, fn
                data, {:ok, items} ->
                  with({:ok, item} <- Plaid.DocumentMetadata.decode(data)) do
                    {:ok, [item | items]}
                  end

                _, error ->
                  error
              end)
          end,
        {:ok, error} <- Plaid.Error.decode(data["error"]),
        {:ok, paystubs} <-
          data["paystubs"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.Paystub.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           document_metadata: document_metadata,
           error: error,
           paystubs: paystubs,
           request_id: request_id
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["IncomeVerificationPaystubsGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "document_metadata" =>
          case(data.document_metadata) do
            nil ->
              nil

            _ ->
              Enum.map(data.document_metadata, fn item -> Plaid.DocumentMetadata.encode(item) end)
          end,
        "error" => Plaid.Error.encode(data.error),
        "paystubs" =>
          case(data.paystubs) do
            nil ->
              nil

            _ ->
              Enum.map(data.paystubs, fn item -> Plaid.Paystub.encode(item) end)
          end,
        "request_id" => data.request_id
      }
    end
  end

  defmodule(ItemApplicationListResponse) do
    @moduledoc "#{nil}
    "
    defstruct(applications: nil, request_id: nil)

    @type t :: %__MODULE__{
            applications: [Plaid.ConnectedApplication.t()],
            request_id: binary | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, applications} <-
          data["applications"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.ConnectedApplication.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{applications: applications, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ItemApplicationListResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "applications" =>
          case(data.applications) do
            nil ->
              nil

            _ ->
              Enum.map(data.applications, fn item -> Plaid.ConnectedApplication.encode(item) end)
          end,
        "request_id" => data.request_id
      }
    end
  end

  defmodule(Earnings) do
    @moduledoc "#{"Earnings"}
    "
    defstruct(subtotals: nil, totals: nil)

    @type t :: %__MODULE__{
            subtotals: [Plaid.EarningsTotal.t()] | nil,
            totals: [Plaid.EarningsTotal.t()] | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, subtotals} <-
          case(data["subtotals"]) do
            nil ->
              nil

            _ ->
              data["subtotals"]
              |> Enum.reverse()
              |> Enum.reduce({:ok, []}, fn
                data, {:ok, items} ->
                  with({:ok, item} <- Plaid.EarningsTotal.decode(data)) do
                    {:ok, [item | items]}
                  end

                _, error ->
                  error
              end)
          end,
        {:ok, totals} <-
          case(data["totals"]) do
            nil ->
              nil

            _ ->
              data["totals"]
              |> Enum.reverse()
              |> Enum.reduce({:ok, []}, fn
                data, {:ok, items} ->
                  with({:ok, item} <- Plaid.EarningsTotal.decode(data)) do
                    {:ok, [item | items]}
                  end

                _, error ->
                  error
              end)
          end
      ) do
        {:ok, %__MODULE__{subtotals: subtotals, totals: totals}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Earnings" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "subtotals" =>
          case(data.subtotals) do
            nil ->
              nil

            _ ->
              Enum.map(data.subtotals, fn item -> Plaid.EarningsTotal.encode(item) end)
          end,
        "totals" =>
          case(data.totals) do
            nil ->
              nil

            _ ->
              Enum.map(data.totals, fn item -> Plaid.EarningsTotal.encode(item) end)
          end
      }
    end
  end

  defmodule(AssetReportAuditCopyRemoveResponse) do
    @moduledoc "#{nil}
    "
    defstruct(removed: nil, request_id: nil)
    @type t :: %__MODULE__{removed: boolean, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, removed} <-
          case(data["removed"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["removed"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{removed: removed, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AssetReportAuditCopyRemoveResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"removed" => data.removed, "request_id" => data.request_id}
    end
  end

  @type transfer_type :: binary
  @type transfer_amount :: binary
  defmodule(CategoriesGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(categories: nil, request_id: nil)
    @type t :: %__MODULE__{categories: [Plaid.Category.t()], request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, categories} <-
          data["categories"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.Category.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{categories: categories, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["CategoriesGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "categories" =>
          case(data.categories) do
            nil ->
              nil

            _ ->
              Enum.map(data.categories, fn item -> Plaid.Category.encode(item) end)
          end,
        "request_id" => data.request_id
      }
    end
  end

  defmodule(DepositSwitchTokenCreateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(
      deposit_switch_token: nil,
      deposit_switch_token_expiration_time: nil,
      request_id: nil
    )

    @type t :: %__MODULE__{
            deposit_switch_token: binary,
            deposit_switch_token_expiration_time: binary,
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, deposit_switch_token} <-
          case(data["deposit_switch_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["deposit_switch_token"]}}
          end,
        {:ok, deposit_switch_token_expiration_time} <-
          case(data["deposit_switch_token_expiration_time"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["deposit_switch_token_expiration_time"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           deposit_switch_token: deposit_switch_token,
           deposit_switch_token_expiration_time: deposit_switch_token_expiration_time,
           request_id: request_id
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["DepositSwitchTokenCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "deposit_switch_token" => data.deposit_switch_token,
        "deposit_switch_token_expiration_time" => data.deposit_switch_token_expiration_time,
        "request_id" => data.request_id
      }
    end
  end

  defmodule(Pay) do
    @moduledoc "#{"Pay"}
    "
    defstruct(amount: nil, currency: nil)
    @type t :: %__MODULE__{amount: number | nil, currency: binary | nil}
    @doc false
    def(decode(data)) do
      with(
        {:ok, amount} <-
          case(data["amount"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["amount"]}}
          end,
        {:ok, currency} <-
          case(data["currency"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["currency"]}}
          end
      ) do
        {:ok, %__MODULE__{amount: amount, currency: currency}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Pay" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"amount" => data.amount, "currency" => data.currency}
    end
  end

  defmodule(WebhookVerificationKeyGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(key: nil, request_id: nil)
    @type t :: %__MODULE__{key: Plaid.JWKPublicKey.t(), request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, key} <- Plaid.JWKPublicKey.decode(data["key"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{key: key, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["WebhookVerificationKeyGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"key" => Plaid.JWKPublicKey.encode(data.key), "request_id" => data.request_id}
    end
  end

  @type products :: binary
  defmodule(TransferCancelResponse) do
    @moduledoc "#{"TransferCancelResponse"}
    "
    defstruct(request_id: nil)
    @type t :: %__MODULE__{request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransferCancelResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id}
    end
  end

  defmodule(AssetReportFilterResponse) do
    @moduledoc "#{nil}
    "
    defstruct(asset_report_id: nil, asset_report_token: nil, request_id: nil)

    @type t :: %__MODULE__{
            asset_report_id: binary,
            asset_report_token: binary,
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, asset_report_id} <-
          case(data["asset_report_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["AssetReportId"]}}
          end,
        {:ok, asset_report_token} <-
          case(data["asset_report_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["AssetReportToken"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           asset_report_id: asset_report_id,
           asset_report_token: asset_report_token,
           request_id: request_id
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AssetReportFilterResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "asset_report_id" => data.asset_report_id,
        "asset_report_token" => data.asset_report_token,
        "request_id" => data.request_id
      }
    end
  end

  @type transfer_id :: binary
  defmodule(DepositSwitchAltCreateResponse) do
    @moduledoc "#{"DepositSwitchAltCreateResponse"}
    "
    defstruct(deposit_switch_id: nil, request_id: nil)
    @type t :: %__MODULE__{deposit_switch_id: binary, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, deposit_switch_id} <-
          case(data["deposit_switch_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["deposit_switch_id"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{deposit_switch_id: deposit_switch_id, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["DepositSwitchAltCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"deposit_switch_id" => data.deposit_switch_id, "request_id" => data.request_id}
    end
  end

  @type ach_class :: binary
  defmodule(LinkTokenGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(created_at: nil, expiration: nil, link_token: nil, metadata: nil, request_id: nil)

    @type t :: %__MODULE__{
            created_at: binary,
            expiration: binary,
            link_token: binary,
            metadata: Plaid.LinkTokenGetMetadataResponse.t(),
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, created_at} <-
          case(data["created_at"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["created_at"]}}
          end,
        {:ok, expiration} <-
          case(data["expiration"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["expiration"]}}
          end,
        {:ok, link_token} <-
          case(data["link_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["link_token"]}}
          end,
        {:ok, metadata} <- Plaid.LinkTokenGetMetadataResponse.decode(data["metadata"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           created_at: created_at,
           expiration: expiration,
           link_token: link_token,
           metadata: metadata,
           request_id: request_id
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["LinkTokenGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "created_at" => data.created_at,
        "expiration" => data.expiration,
        "link_token" => data.link_token,
        "metadata" => Plaid.LinkTokenGetMetadataResponse.encode(data.metadata),
        "request_id" => data.request_id
      }
    end
  end

  defmodule(TransferAuthorizationCreateResponse) do
    @moduledoc "#{"TransferAuthorizationCreateResponse"}
    "
    defstruct(authorization: nil, request_id: nil)
    @type t :: %__MODULE__{authorization: Plaid.TransferAuthorization.t(), request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, authorization} <- Plaid.TransferAuthorization.decode(data["authorization"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{authorization: authorization, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransferAuthorizationCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "authorization" => Plaid.TransferAuthorization.encode(data.authorization),
        "request_id" => data.request_id
      }
    end
  end

  defmodule(SandboxBankTransferSimulateResponse) do
    @moduledoc "#{"SandboxBankTransferSimulateResponse"}
    "
    defstruct(request_id: nil)
    @type t :: %__MODULE__{request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SandboxBankTransferSimulateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id}
    end
  end

  defmodule(PaymentInitiationPayment) do
    @moduledoc "#{nil}
    "
    defstruct(
      adjusted_reference: nil,
      amount: nil,
      bacs: nil,
      emi_account_id: nil,
      iban: nil,
      initiated_refunds: nil,
      last_status_update: nil,
      payment_id: nil,
      recipient_id: nil,
      reference: nil,
      refund_details: nil,
      schedule: nil,
      status: nil
    )

    @type t :: %__MODULE__{
            adjusted_reference: binary | nil,
            amount: Plaid.PaymentAmount.t(),
            bacs: any,
            emi_account_id: binary | nil,
            iban: binary,
            initiated_refunds: [Plaid.PaymentInitiationRefund.t()] | nil,
            last_status_update: binary,
            payment_id: binary,
            recipient_id: binary,
            reference: binary,
            refund_details: Plaid.ExternalPaymentRefundDetails.t() | nil,
            schedule: any | nil,
            status: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, adjusted_reference} <-
          case(data["adjusted_reference"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["adjusted_reference"]}}
          end,
        {:ok, amount} <- Plaid.PaymentAmount.decode(data["amount"]),
        {:ok, bacs} <- {:ok, data["bacs"]},
        {:ok, emi_account_id} <-
          case(data["emi_account_id"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["emi_account_id"]}}
          end,
        {:ok, iban} <-
          case(data["iban"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["iban"]}}
          end,
        {:ok, initiated_refunds} <-
          case(data["initiated_refunds"]) do
            nil ->
              nil

            _ ->
              data["initiated_refunds"]
              |> Enum.reverse()
              |> Enum.reduce({:ok, []}, fn
                data, {:ok, items} ->
                  with({:ok, item} <- Plaid.PaymentInitiationRefund.decode(data)) do
                    {:ok, [item | items]}
                  end

                _, error ->
                  error
              end)
          end,
        {:ok, last_status_update} <-
          case(data["last_status_update"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["last_status_update"]}}
          end,
        {:ok, payment_id} <-
          case(data["payment_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["payment_id"]}}
          end,
        {:ok, recipient_id} <-
          case(data["recipient_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["recipient_id"]}}
          end,
        {:ok, reference} <-
          case(data["reference"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["reference"]}}
          end,
        {:ok, refund_details} <-
          Plaid.ExternalPaymentRefundDetails.decode(data["refund_details"]),
        {:ok, schedule} <- {:ok, data["schedule"]},
        {:ok, status} <-
          case(data["status"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["status"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           adjusted_reference: adjusted_reference,
           amount: amount,
           bacs: bacs,
           emi_account_id: emi_account_id,
           iban: iban,
           initiated_refunds: initiated_refunds,
           last_status_update: last_status_update,
           payment_id: payment_id,
           recipient_id: recipient_id,
           reference: reference,
           refund_details: refund_details,
           schedule: schedule,
           status: status
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaymentInitiationPayment" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "adjusted_reference" => data.adjusted_reference,
        "amount" => Plaid.PaymentAmount.encode(data.amount),
        "bacs" => data.bacs,
        "emi_account_id" => data.emi_account_id,
        "iban" => data.iban,
        "initiated_refunds" =>
          case(data.initiated_refunds) do
            nil ->
              nil

            _ ->
              Enum.map(data.initiated_refunds, fn item ->
                Plaid.PaymentInitiationRefund.encode(item)
              end)
          end,
        "last_status_update" => data.last_status_update,
        "payment_id" => data.payment_id,
        "recipient_id" => data.recipient_id,
        "reference" => data.reference,
        "refund_details" => Plaid.ExternalPaymentRefundDetails.encode(data.refund_details),
        "schedule" => data.schedule,
        "status" => data.status
      }
    end
  end

  defmodule(TransferUserInResponse) do
    @moduledoc "#{"TransferUserInResponse"}
    "
    defstruct(address: nil, email_address: nil, legal_name: nil, phone_number: nil)

    @type t :: %__MODULE__{
            address: Plaid.TransferUserAddressInResponse.t(),
            email_address: binary,
            legal_name: binary,
            phone_number: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, address} <- Plaid.TransferUserAddressInResponse.decode(data["address"]),
        {:ok, email_address} <-
          case(data["email_address"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["email_address"]}}
          end,
        {:ok, legal_name} <-
          case(data["legal_name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["legal_name"]}}
          end,
        {:ok, phone_number} <-
          case(data["phone_number"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["phone_number"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           address: address,
           email_address: email_address,
           legal_name: legal_name,
           phone_number: phone_number
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransferUserInResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "address" => Plaid.TransferUserAddressInResponse.encode(data.address),
        "email_address" => data.email_address,
        "legal_name" => data.legal_name,
        "phone_number" => data.phone_number
      }
    end
  end

  defmodule(IncomeVerificationTaxformsGetResponse) do
    @moduledoc "#{"IncomeVerificationTaxformsGetResponse"}
    "
    defstruct(document_metadata: nil, error: nil, request_id: nil, taxforms: nil)

    @type t :: %__MODULE__{
            document_metadata: [Plaid.DocumentMetadata.t()],
            error: Plaid.Error.t() | nil,
            request_id: binary | nil,
            taxforms: [Plaid.Taxform.t()]
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, document_metadata} <-
          data["document_metadata"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.DocumentMetadata.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, error} <- Plaid.Error.decode(data["error"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, taxforms} <-
          data["taxforms"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.Taxform.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok,
         %__MODULE__{
           document_metadata: document_metadata,
           error: error,
           request_id: request_id,
           taxforms: taxforms
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["IncomeVerificationTaxformsGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "document_metadata" =>
          case(data.document_metadata) do
            nil ->
              nil

            _ ->
              Enum.map(data.document_metadata, fn item -> Plaid.DocumentMetadata.encode(item) end)
          end,
        "error" => Plaid.Error.encode(data.error),
        "request_id" => data.request_id,
        "taxforms" =>
          case(data.taxforms) do
            nil ->
              nil

            _ ->
              Enum.map(data.taxforms, fn item -> Plaid.Taxform.encode(item) end)
          end
      }
    end
  end

  @type account_selection_cardinality :: binary
  defmodule(PaystubDetails) do
    @moduledoc "#{"PaystubDetails"}
    "
    defstruct(
      pay_date: nil,
      pay_frequency: nil,
      pay_period_end_date: nil,
      pay_period_start_date: nil,
      paystub_provider: nil
    )

    @type t :: %__MODULE__{
            pay_date: binary | nil,
            pay_frequency: binary | nil,
            pay_period_end_date: binary | nil,
            pay_period_start_date: binary | nil,
            paystub_provider: binary | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, pay_date} <-
          case(data["pay_date"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["pay_date"]}}
          end,
        {:ok, pay_frequency} <-
          case(data["pay_frequency"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["pay_frequency"]}}
          end,
        {:ok, pay_period_end_date} <-
          case(data["pay_period_end_date"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["pay_period_end_date"]}}
          end,
        {:ok, pay_period_start_date} <-
          case(data["pay_period_start_date"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["pay_period_start_date"]}}
          end,
        {:ok, paystub_provider} <-
          case(data["paystub_provider"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["paystub_provider"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           pay_date: pay_date,
           pay_frequency: pay_frequency,
           pay_period_end_date: pay_period_end_date,
           pay_period_start_date: pay_period_start_date,
           paystub_provider: paystub_provider
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaystubDetails" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "pay_date" => data.pay_date,
        "pay_frequency" => data.pay_frequency,
        "pay_period_end_date" => data.pay_period_end_date,
        "pay_period_start_date" => data.pay_period_start_date,
        "paystub_provider" => data.paystub_provider
      }
    end
  end

  defmodule(SignalEvaluateCoreAttributes) do
    @moduledoc "#{"SignalEvaluateCoreAttributes"}
    "
    defstruct(
      address_change_count_28d: nil,
      email_change_count_90d: nil,
      nsf_overdraft_transactions_count_30d: nil,
      phone_change_count_90d: nil,
      unauthorized_transactions_count_60d: nil,
      nsf_overdraft_transactions_count_60d: nil,
      total_credit_transactions_amount_10d: nil,
      nsf_overdraft_transactions_count_7d: nil,
      balance_last_updated: nil,
      p50_debit_transactions_amount_28d: nil,
      unauthorized_transactions_count_7d: nil,
      nsf_overdraft_transactions_count_90d: nil,
      p10_eod_balance_90d: nil,
      available_balance: nil,
      p90_eod_balance_60d: nil,
      p90_eod_balance_30d: nil,
      email_change_count_28d: nil,
      p95_credit_transactions_amount_28d: nil,
      p95_debit_transactions_amount_28d: nil,
      p10_eod_balance_30d: nil,
      is_savings_or_money_market_account: nil,
      total_plaid_connections_count: nil,
      days_with_negative_balance_count_90d: nil,
      plaid_connections_count_7d: nil,
      days_since_first_plaid_connection: nil,
      phone_change_count_28d: nil,
      unauthorized_transactions_count_30d: nil,
      p90_eod_balance_90d: nil,
      address_change_count_90d: nil,
      unauthorized_transactions_count_90d: nil,
      current_balance: nil,
      p10_eod_balance_60d: nil,
      total_debit_transactions_amount_10d: nil,
      plaid_connections_count_30d: nil,
      p50_credit_transactions_amount_28d: nil
    )

    @type t :: %__MODULE__{
            address_change_count_28d: integer | nil,
            email_change_count_90d: integer | nil,
            nsf_overdraft_transactions_count_30d: integer | nil,
            phone_change_count_90d: integer | nil,
            unauthorized_transactions_count_60d: integer | nil,
            nsf_overdraft_transactions_count_60d: integer | nil,
            total_credit_transactions_amount_10d: number | nil,
            nsf_overdraft_transactions_count_7d: integer | nil,
            balance_last_updated: binary | nil,
            p50_debit_transactions_amount_28d: number | nil,
            unauthorized_transactions_count_7d: integer | nil,
            nsf_overdraft_transactions_count_90d: integer | nil,
            p10_eod_balance_90d: number | nil,
            available_balance: number | nil,
            p90_eod_balance_60d: number | nil,
            p90_eod_balance_30d: number | nil,
            email_change_count_28d: integer | nil,
            p95_credit_transactions_amount_28d: number | nil,
            p95_debit_transactions_amount_28d: number | nil,
            p10_eod_balance_30d: number | nil,
            is_savings_or_money_market_account: boolean | nil,
            total_plaid_connections_count: integer | nil,
            days_with_negative_balance_count_90d: integer | nil,
            plaid_connections_count_7d: integer | nil,
            days_since_first_plaid_connection: integer | nil,
            phone_change_count_28d: integer | nil,
            unauthorized_transactions_count_30d: integer | nil,
            p90_eod_balance_90d: number | nil,
            address_change_count_90d: integer | nil,
            unauthorized_transactions_count_90d: integer | nil,
            current_balance: number | nil,
            p10_eod_balance_60d: number | nil,
            total_debit_transactions_amount_10d: number | nil,
            plaid_connections_count_30d: integer | nil,
            p50_credit_transactions_amount_28d: number | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, address_change_count_28d} <-
          case(data["address_change_count_28d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["address_change_count_28d"]}}
          end,
        {:ok, email_change_count_90d} <-
          case(data["email_change_count_90d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["email_change_count_90d"]}}
          end,
        {:ok, nsf_overdraft_transactions_count_30d} <-
          case(data["nsf_overdraft_transactions_count_30d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["nsf_overdraft_transactions_count_30d"]}}
          end,
        {:ok, phone_change_count_90d} <-
          case(data["phone_change_count_90d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["phone_change_count_90d"]}}
          end,
        {:ok, unauthorized_transactions_count_60d} <-
          case(data["unauthorized_transactions_count_60d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["unauthorized_transactions_count_60d"]}}
          end,
        {:ok, nsf_overdraft_transactions_count_60d} <-
          case(data["nsf_overdraft_transactions_count_60d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["nsf_overdraft_transactions_count_60d"]}}
          end,
        {:ok, total_credit_transactions_amount_10d} <-
          case(data["total_credit_transactions_amount_10d"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["total_credit_transactions_amount_10d"]}}
          end,
        {:ok, nsf_overdraft_transactions_count_7d} <-
          case(data["nsf_overdraft_transactions_count_7d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["nsf_overdraft_transactions_count_7d"]}}
          end,
        {:ok, balance_last_updated} <-
          case(data["balance_last_updated"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["balance_last_updated"]}}
          end,
        {:ok, p50_debit_transactions_amount_28d} <-
          case(data["p50_debit_transactions_amount_28d"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["p50_debit_transactions_amount_28d"]}}
          end,
        {:ok, unauthorized_transactions_count_7d} <-
          case(data["unauthorized_transactions_count_7d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["unauthorized_transactions_count_7d"]}}
          end,
        {:ok, nsf_overdraft_transactions_count_90d} <-
          case(data["nsf_overdraft_transactions_count_90d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["nsf_overdraft_transactions_count_90d"]}}
          end,
        {:ok, p10_eod_balance_90d} <-
          case(data["p10_eod_balance_90d"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["p10_eod_balance_90d"]}}
          end,
        {:ok, available_balance} <-
          case(data["available_balance"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["available_balance"]}}
          end,
        {:ok, p90_eod_balance_60d} <-
          case(data["p90_eod_balance_60d"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["p90_eod_balance_60d"]}}
          end,
        {:ok, p90_eod_balance_30d} <-
          case(data["p90_eod_balance_30d"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["p90_eod_balance_30d"]}}
          end,
        {:ok, email_change_count_28d} <-
          case(data["email_change_count_28d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["email_change_count_28d"]}}
          end,
        {:ok, p95_credit_transactions_amount_28d} <-
          case(data["p95_credit_transactions_amount_28d"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["p95_credit_transactions_amount_28d"]}}
          end,
        {:ok, p95_debit_transactions_amount_28d} <-
          case(data["p95_debit_transactions_amount_28d"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["p95_debit_transactions_amount_28d"]}}
          end,
        {:ok, p10_eod_balance_30d} <-
          case(data["p10_eod_balance_30d"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["p10_eod_balance_30d"]}}
          end,
        {:ok, is_savings_or_money_market_account} <-
          case(data["is_savings_or_money_market_account"]) do
            x when is_nil(x) or is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["is_savings_or_money_market_account"]}}
          end,
        {:ok, total_plaid_connections_count} <-
          case(data["total_plaid_connections_count"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["total_plaid_connections_count"]}}
          end,
        {:ok, days_with_negative_balance_count_90d} <-
          case(data["days_with_negative_balance_count_90d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["days_with_negative_balance_count_90d"]}}
          end,
        {:ok, plaid_connections_count_7d} <-
          case(data["plaid_connections_count_7d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["plaid_connections_count_7d"]}}
          end,
        {:ok, days_since_first_plaid_connection} <-
          case(data["days_since_first_plaid_connection"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["days_since_first_plaid_connection"]}}
          end,
        {:ok, phone_change_count_28d} <-
          case(data["phone_change_count_28d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["phone_change_count_28d"]}}
          end,
        {:ok, unauthorized_transactions_count_30d} <-
          case(data["unauthorized_transactions_count_30d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["unauthorized_transactions_count_30d"]}}
          end,
        {:ok, p90_eod_balance_90d} <-
          case(data["p90_eod_balance_90d"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["p90_eod_balance_90d"]}}
          end,
        {:ok, address_change_count_90d} <-
          case(data["address_change_count_90d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["address_change_count_90d"]}}
          end,
        {:ok, unauthorized_transactions_count_90d} <-
          case(data["unauthorized_transactions_count_90d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["unauthorized_transactions_count_90d"]}}
          end,
        {:ok, current_balance} <-
          case(data["current_balance"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["current_balance"]}}
          end,
        {:ok, p10_eod_balance_60d} <-
          case(data["p10_eod_balance_60d"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["p10_eod_balance_60d"]}}
          end,
        {:ok, total_debit_transactions_amount_10d} <-
          case(data["total_debit_transactions_amount_10d"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["total_debit_transactions_amount_10d"]}}
          end,
        {:ok, plaid_connections_count_30d} <-
          case(data["plaid_connections_count_30d"]) do
            x when is_nil(x) or is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["plaid_connections_count_30d"]}}
          end,
        {:ok, p50_credit_transactions_amount_28d} <-
          case(data["p50_credit_transactions_amount_28d"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["p50_credit_transactions_amount_28d"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           address_change_count_28d: address_change_count_28d,
           email_change_count_90d: email_change_count_90d,
           nsf_overdraft_transactions_count_30d: nsf_overdraft_transactions_count_30d,
           phone_change_count_90d: phone_change_count_90d,
           unauthorized_transactions_count_60d: unauthorized_transactions_count_60d,
           nsf_overdraft_transactions_count_60d: nsf_overdraft_transactions_count_60d,
           total_credit_transactions_amount_10d: total_credit_transactions_amount_10d,
           nsf_overdraft_transactions_count_7d: nsf_overdraft_transactions_count_7d,
           balance_last_updated: balance_last_updated,
           p50_debit_transactions_amount_28d: p50_debit_transactions_amount_28d,
           unauthorized_transactions_count_7d: unauthorized_transactions_count_7d,
           nsf_overdraft_transactions_count_90d: nsf_overdraft_transactions_count_90d,
           p10_eod_balance_90d: p10_eod_balance_90d,
           available_balance: available_balance,
           p90_eod_balance_60d: p90_eod_balance_60d,
           p90_eod_balance_30d: p90_eod_balance_30d,
           email_change_count_28d: email_change_count_28d,
           p95_credit_transactions_amount_28d: p95_credit_transactions_amount_28d,
           p95_debit_transactions_amount_28d: p95_debit_transactions_amount_28d,
           p10_eod_balance_30d: p10_eod_balance_30d,
           is_savings_or_money_market_account: is_savings_or_money_market_account,
           total_plaid_connections_count: total_plaid_connections_count,
           days_with_negative_balance_count_90d: days_with_negative_balance_count_90d,
           plaid_connections_count_7d: plaid_connections_count_7d,
           days_since_first_plaid_connection: days_since_first_plaid_connection,
           phone_change_count_28d: phone_change_count_28d,
           unauthorized_transactions_count_30d: unauthorized_transactions_count_30d,
           p90_eod_balance_90d: p90_eod_balance_90d,
           address_change_count_90d: address_change_count_90d,
           unauthorized_transactions_count_90d: unauthorized_transactions_count_90d,
           current_balance: current_balance,
           p10_eod_balance_60d: p10_eod_balance_60d,
           total_debit_transactions_amount_10d: total_debit_transactions_amount_10d,
           plaid_connections_count_30d: plaid_connections_count_30d,
           p50_credit_transactions_amount_28d: p50_credit_transactions_amount_28d
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SignalEvaluateCoreAttributes" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "address_change_count_28d" => data.address_change_count_28d,
        "email_change_count_90d" => data.email_change_count_90d,
        "nsf_overdraft_transactions_count_30d" => data.nsf_overdraft_transactions_count_30d,
        "phone_change_count_90d" => data.phone_change_count_90d,
        "unauthorized_transactions_count_60d" => data.unauthorized_transactions_count_60d,
        "nsf_overdraft_transactions_count_60d" => data.nsf_overdraft_transactions_count_60d,
        "total_credit_transactions_amount_10d" => data.total_credit_transactions_amount_10d,
        "nsf_overdraft_transactions_count_7d" => data.nsf_overdraft_transactions_count_7d,
        "balance_last_updated" => data.balance_last_updated,
        "p50_debit_transactions_amount_28d" => data.p50_debit_transactions_amount_28d,
        "unauthorized_transactions_count_7d" => data.unauthorized_transactions_count_7d,
        "nsf_overdraft_transactions_count_90d" => data.nsf_overdraft_transactions_count_90d,
        "p10_eod_balance_90d" => data.p10_eod_balance_90d,
        "available_balance" => data.available_balance,
        "p90_eod_balance_60d" => data.p90_eod_balance_60d,
        "p90_eod_balance_30d" => data.p90_eod_balance_30d,
        "email_change_count_28d" => data.email_change_count_28d,
        "p95_credit_transactions_amount_28d" => data.p95_credit_transactions_amount_28d,
        "p95_debit_transactions_amount_28d" => data.p95_debit_transactions_amount_28d,
        "p10_eod_balance_30d" => data.p10_eod_balance_30d,
        "is_savings_or_money_market_account" => data.is_savings_or_money_market_account,
        "total_plaid_connections_count" => data.total_plaid_connections_count,
        "days_with_negative_balance_count_90d" => data.days_with_negative_balance_count_90d,
        "plaid_connections_count_7d" => data.plaid_connections_count_7d,
        "days_since_first_plaid_connection" => data.days_since_first_plaid_connection,
        "phone_change_count_28d" => data.phone_change_count_28d,
        "unauthorized_transactions_count_30d" => data.unauthorized_transactions_count_30d,
        "p90_eod_balance_90d" => data.p90_eod_balance_90d,
        "address_change_count_90d" => data.address_change_count_90d,
        "unauthorized_transactions_count_90d" => data.unauthorized_transactions_count_90d,
        "current_balance" => data.current_balance,
        "p10_eod_balance_60d" => data.p10_eod_balance_60d,
        "total_debit_transactions_amount_10d" => data.total_debit_transactions_amount_10d,
        "plaid_connections_count_30d" => data.plaid_connections_count_30d,
        "p50_credit_transactions_amount_28d" => data.p50_credit_transactions_amount_28d
      }
    end
  end

  defmodule(InvestmentTransaction) do
    @moduledoc "#{"InvestmentTransaction"}
    "
    defstruct(
      account_id: nil,
      amount: nil,
      cancel_transaction_id: nil,
      date: nil,
      fees: nil,
      investment_transaction_id: nil,
      iso_currency_code: nil,
      name: nil,
      price: nil,
      quantity: nil,
      security_id: nil,
      subtype: nil,
      type: nil,
      unofficial_currency_code: nil
    )

    @type t :: %__MODULE__{
            account_id: binary,
            amount: number,
            cancel_transaction_id: binary | nil,
            date: binary,
            fees: number,
            investment_transaction_id: binary,
            iso_currency_code: binary,
            name: binary,
            price: number,
            quantity: number,
            security_id: binary,
            subtype: binary,
            type: binary,
            unofficial_currency_code: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, amount} <-
          case(data["amount"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["amount"]}}
          end,
        {:ok, cancel_transaction_id} <-
          case(data["cancel_transaction_id"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["cancel_transaction_id"]}}
          end,
        {:ok, date} <-
          case(data["date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["date"]}}
          end,
        {:ok, fees} <-
          case(data["fees"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["fees"]}}
          end,
        {:ok, investment_transaction_id} <-
          case(data["investment_transaction_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["investment_transaction_id"]}}
          end,
        {:ok, iso_currency_code} <-
          case(data["iso_currency_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["iso_currency_code"]}}
          end,
        {:ok, name} <-
          case(data["name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["name"]}}
          end,
        {:ok, price} <-
          case(data["price"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["price"]}}
          end,
        {:ok, quantity} <-
          case(data["quantity"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["quantity"]}}
          end,
        {:ok, security_id} <-
          case(data["security_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["security_id"]}}
          end,
        {:ok, subtype} <-
          case(data["subtype"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["subtype"]}}
          end,
        {:ok, type} <-
          case(data["type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["type"]}}
          end,
        {:ok, unofficial_currency_code} <-
          case(data["unofficial_currency_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["unofficial_currency_code"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           account_id: account_id,
           amount: amount,
           cancel_transaction_id: cancel_transaction_id,
           date: date,
           fees: fees,
           investment_transaction_id: investment_transaction_id,
           iso_currency_code: iso_currency_code,
           name: name,
           price: price,
           quantity: quantity,
           security_id: security_id,
           subtype: subtype,
           type: type,
           unofficial_currency_code: unofficial_currency_code
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["InvestmentTransaction" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_id" => data.account_id,
        "amount" => data.amount,
        "cancel_transaction_id" => data.cancel_transaction_id,
        "date" => data.date,
        "fees" => data.fees,
        "investment_transaction_id" => data.investment_transaction_id,
        "iso_currency_code" => data.iso_currency_code,
        "name" => data.name,
        "price" => data.price,
        "quantity" => data.quantity,
        "security_id" => data.security_id,
        "subtype" => data.subtype,
        "type" => data.type,
        "unofficial_currency_code" => data.unofficial_currency_code
      }
    end
  end

  defmodule(ProcessorNumber) do
    @moduledoc "#{nil}
    "
    defstruct(ach: nil, bacs: nil, eft: nil, international: nil)

    @type t :: %__MODULE__{
            ach: any | nil,
            bacs: any | nil,
            eft: any | nil,
            international: any | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, ach} <- {:ok, data["ach"]},
        {:ok, bacs} <- {:ok, data["bacs"]},
        {:ok, eft} <- {:ok, data["eft"]},
        {:ok, international} <- {:ok, data["international"]}
      ) do
        {:ok, %__MODULE__{ach: ach, bacs: bacs, eft: eft, international: international}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ProcessorNumber" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "ach" => data.ach,
        "bacs" => data.bacs,
        "eft" => data.eft,
        "international" => data.international
      }
    end
  end

  defmodule(LinkTokenCreateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(expiration: nil, link_token: nil, request_id: nil)
    @type t :: %__MODULE__{expiration: binary, link_token: binary, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, expiration} <-
          case(data["expiration"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["expiration"]}}
          end,
        {:ok, link_token} <-
          case(data["link_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["link_token"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{expiration: expiration, link_token: link_token, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["LinkTokenCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "expiration" => data.expiration,
        "link_token" => data.link_token,
        "request_id" => data.request_id
      }
    end
  end

  defmodule(AuthGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(accounts: nil, item: nil, numbers: nil, request_id: nil)

    @type t :: %__MODULE__{
            accounts: [Plaid.AccountBase.t()],
            item: Plaid.Item.t(),
            numbers: Plaid.AuthGetNumbers.t(),
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, accounts} <-
          data["accounts"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.AccountBase.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, item} <- Plaid.Item.decode(data["item"]),
        {:ok, numbers} <- Plaid.AuthGetNumbers.decode(data["numbers"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok,
         %__MODULE__{accounts: accounts, item: item, numbers: numbers, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AuthGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "accounts" =>
          case(data.accounts) do
            nil ->
              nil

            _ ->
              Enum.map(data.accounts, fn item -> Plaid.AccountBase.encode(item) end)
          end,
        "item" => Plaid.Item.encode(data.item),
        "numbers" => Plaid.AuthGetNumbers.encode(data.numbers),
        "request_id" => data.request_id
      }
    end
  end

  nil

  defmodule(BankTransferSweepListResponse) do
    @moduledoc "#{"BankTransferSweepListResponse"}
    "
    defstruct(request_id: nil, sweeps: nil)
    @type t :: %__MODULE__{request_id: binary, sweeps: [Plaid.BankTransferSweep.t()]}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, sweeps} <-
          data["sweeps"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.BankTransferSweep.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok, %__MODULE__{request_id: request_id, sweeps: sweeps}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferSweepListResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "request_id" => data.request_id,
        "sweeps" =>
          case(data.sweeps) do
            nil ->
              nil

            _ ->
              Enum.map(data.sweeps, fn item -> Plaid.BankTransferSweep.encode(item) end)
          end
      }
    end
  end

  @type bank_transfer_direction :: binary
  @type bank_initiated_risk_tier :: integer
  defmodule(InvestmentsHoldingsGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(accounts: nil, holdings: nil, item: nil, request_id: nil, securities: nil)

    @type t :: %__MODULE__{
            accounts: [Plaid.AccountBase.t()],
            holdings: [Plaid.Holding.t()],
            item: Plaid.Item.t(),
            request_id: binary,
            securities: [Plaid.Security.t()]
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, accounts} <-
          data["accounts"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.AccountBase.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, holdings} <-
          data["holdings"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.Holding.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, item} <- Plaid.Item.decode(data["item"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, securities} <-
          data["securities"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.Security.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok,
         %__MODULE__{
           accounts: accounts,
           holdings: holdings,
           item: item,
           request_id: request_id,
           securities: securities
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["InvestmentsHoldingsGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "accounts" =>
          case(data.accounts) do
            nil ->
              nil

            _ ->
              Enum.map(data.accounts, fn item -> Plaid.AccountBase.encode(item) end)
          end,
        "holdings" =>
          case(data.holdings) do
            nil ->
              nil

            _ ->
              Enum.map(data.holdings, fn item -> Plaid.Holding.encode(item) end)
          end,
        "item" => Plaid.Item.encode(data.item),
        "request_id" => data.request_id,
        "securities" =>
          case(data.securities) do
            nil ->
              nil

            _ ->
              Enum.map(data.securities, fn item -> Plaid.Security.encode(item) end)
          end
      }
    end
  end

  defmodule(TransferEventListResponse) do
    @moduledoc "#{"TransferEventListResponse"}
    "
    defstruct(request_id: nil, transfer_events: nil)
    @type t :: %__MODULE__{request_id: binary, transfer_events: [Plaid.TransferEvent.t()]}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, transfer_events} <-
          data["transfer_events"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.TransferEvent.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok, %__MODULE__{request_id: request_id, transfer_events: transfer_events}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransferEventListResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "request_id" => data.request_id,
        "transfer_events" =>
          case(data.transfer_events) do
            nil ->
              nil

            _ ->
              Enum.map(data.transfer_events, fn item -> Plaid.TransferEvent.encode(item) end)
          end
      }
    end
  end

  defmodule(LiabilitiesGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(accounts: nil, item: nil, liabilities: nil, request_id: nil)

    @type t :: %__MODULE__{
            accounts: [Plaid.AccountBase.t()],
            item: Plaid.Item.t(),
            liabilities: Plaid.LiabilitiesObject.t(),
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, accounts} <-
          data["accounts"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.AccountBase.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, item} <- Plaid.Item.decode(data["item"]),
        {:ok, liabilities} <- Plaid.LiabilitiesObject.decode(data["liabilities"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           accounts: accounts,
           item: item,
           liabilities: liabilities,
           request_id: request_id
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["LiabilitiesGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "accounts" =>
          case(data.accounts) do
            nil ->
              nil

            _ ->
              Enum.map(data.accounts, fn item -> Plaid.AccountBase.encode(item) end)
          end,
        "item" => Plaid.Item.encode(data.item),
        "liabilities" => Plaid.LiabilitiesObject.encode(data.liabilities),
        "request_id" => data.request_id
      }
    end
  end

  nil

  defmodule(AssetReportRemoveResponse) do
    @moduledoc "#{nil}
    "
    defstruct(removed: nil, request_id: nil)
    @type t :: %__MODULE__{removed: boolean, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, removed} <-
          case(data["removed"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["removed"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{removed: removed, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AssetReportRemoveResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"removed" => data.removed, "request_id" => data.request_id}
    end
  end

  defmodule(PaymentInitiationPaymentTokenCreateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(payment_token: nil, payment_token_expiration_time: nil, request_id: nil)

    @type t :: %__MODULE__{
            payment_token: binary,
            payment_token_expiration_time: binary,
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, payment_token} <-
          case(data["payment_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["payment_token"]}}
          end,
        {:ok, payment_token_expiration_time} <-
          case(data["payment_token_expiration_time"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["payment_token_expiration_time"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           payment_token: payment_token,
           payment_token_expiration_time: payment_token_expiration_time,
           request_id: request_id
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaymentInitiationPaymentTokenCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "payment_token" => data.payment_token,
        "payment_token_expiration_time" => data.payment_token_expiration_time,
        "request_id" => data.request_id
      }
    end
  end

  defmodule(JWKPublicKey) do
    @moduledoc "#{nil}
    "
    defstruct(
      alg: nil,
      created_at: nil,
      crv: nil,
      expired_at: nil,
      kid: nil,
      kty: nil,
      use: nil,
      x: nil,
      y: nil
    )

    @type t :: %__MODULE__{
            alg: binary,
            created_at: integer,
            crv: binary,
            expired_at: integer,
            kid: binary,
            kty: binary,
            use: binary,
            x: binary,
            y: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, alg} <-
          case(data["alg"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["alg"]}}
          end,
        {:ok, created_at} <-
          case(data["created_at"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["created_at"]}}
          end,
        {:ok, crv} <-
          case(data["crv"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["crv"]}}
          end,
        {:ok, expired_at} <-
          case(data["expired_at"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["expired_at"]}}
          end,
        {:ok, kid} <-
          case(data["kid"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["kid"]}}
          end,
        {:ok, kty} <-
          case(data["kty"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["kty"]}}
          end,
        {:ok, use} <-
          case(data["use"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["use"]}}
          end,
        {:ok, x} <-
          case(data["x"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["x"]}}
          end,
        {:ok, y} <-
          case(data["y"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["y"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           alg: alg,
           created_at: created_at,
           crv: crv,
           expired_at: expired_at,
           kid: kid,
           kty: kty,
           use: use,
           x: x,
           y: y
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["JWKPublicKey" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "alg" => data.alg,
        "created_at" => data.created_at,
        "crv" => data.crv,
        "expired_at" => data.expired_at,
        "kid" => data.kid,
        "kty" => data.kty,
        "use" => data.use,
        "x" => data.x,
        "y" => data.y
      }
    end
  end

  defmodule(NetPay) do
    @moduledoc "#{"NetPay"}
    "
    defstruct(distribution_details: nil, total: nil)

    @type t :: %__MODULE__{
            distribution_details: [Plaid.DistributionDetails.t()] | nil,
            total: Plaid.Total.t() | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, distribution_details} <-
          case(data["distribution_details"]) do
            nil ->
              nil

            _ ->
              data["distribution_details"]
              |> Enum.reverse()
              |> Enum.reduce({:ok, []}, fn
                data, {:ok, items} ->
                  with({:ok, item} <- Plaid.DistributionDetails.decode(data)) do
                    {:ok, [item | items]}
                  end

                _, error ->
                  error
              end)
          end,
        {:ok, total} <- Plaid.Total.decode(data["total"])
      ) do
        {:ok, %__MODULE__{distribution_details: distribution_details, total: total}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["NetPay" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "distribution_details" =>
          case(data.distribution_details) do
            nil ->
              nil

            _ ->
              Enum.map(data.distribution_details, fn item ->
                Plaid.DistributionDetails.encode(item)
              end)
          end,
        "total" => Plaid.Total.encode(data.total)
      }
    end
  end

  @type access_token :: binary
  nil
  nil
  nil
  @type signal_score :: integer
  defmodule(DepositSwitchGetResponse) do
    @moduledoc "#{"DepositSwitchGetResponse"}
    "
    defstruct(
      account_has_multiple_allocations: nil,
      amount_allocated: nil,
      date_completed: nil,
      date_created: nil,
      deposit_switch_id: nil,
      employer_id: nil,
      employer_name: nil,
      institution_id: nil,
      institution_name: nil,
      is_allocated_remainder: nil,
      percent_allocated: nil,
      request_id: nil,
      state: nil,
      switch_method: nil,
      target_account_id: nil,
      target_item_id: nil
    )

    @type t :: %__MODULE__{
            account_has_multiple_allocations: boolean,
            amount_allocated: number,
            date_completed: binary,
            date_created: binary,
            deposit_switch_id: binary,
            employer_id: binary | nil,
            employer_name: binary | nil,
            institution_id: binary | nil,
            institution_name: binary | nil,
            is_allocated_remainder: boolean,
            percent_allocated: number,
            request_id: binary,
            state: binary,
            switch_method: binary | nil,
            target_account_id: binary,
            target_item_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_has_multiple_allocations} <-
          case(data["account_has_multiple_allocations"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["account_has_multiple_allocations"]}}
          end,
        {:ok, amount_allocated} <-
          case(data["amount_allocated"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["amount_allocated"]}}
          end,
        {:ok, date_completed} <-
          case(data["date_completed"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["date_completed"]}}
          end,
        {:ok, date_created} <-
          case(data["date_created"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["date_created"]}}
          end,
        {:ok, deposit_switch_id} <-
          case(data["deposit_switch_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["deposit_switch_id"]}}
          end,
        {:ok, employer_id} <-
          case(data["employer_id"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["employer_id"]}}
          end,
        {:ok, employer_name} <-
          case(data["employer_name"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["employer_name"]}}
          end,
        {:ok, institution_id} <-
          case(data["institution_id"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["institution_id"]}}
          end,
        {:ok, institution_name} <-
          case(data["institution_name"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["institution_name"]}}
          end,
        {:ok, is_allocated_remainder} <-
          case(data["is_allocated_remainder"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["is_allocated_remainder"]}}
          end,
        {:ok, percent_allocated} <-
          case(data["percent_allocated"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["percent_allocated"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, state} <-
          case(data["state"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["state"]}}
          end,
        {:ok, switch_method} <-
          case(data["switch_method"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["switch_method"]}}
          end,
        {:ok, target_account_id} <-
          case(data["target_account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["target_account_id"]}}
          end,
        {:ok, target_item_id} <-
          case(data["target_item_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["target_item_id"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           account_has_multiple_allocations: account_has_multiple_allocations,
           amount_allocated: amount_allocated,
           date_completed: date_completed,
           date_created: date_created,
           deposit_switch_id: deposit_switch_id,
           employer_id: employer_id,
           employer_name: employer_name,
           institution_id: institution_id,
           institution_name: institution_name,
           is_allocated_remainder: is_allocated_remainder,
           percent_allocated: percent_allocated,
           request_id: request_id,
           state: state,
           switch_method: switch_method,
           target_account_id: target_account_id,
           target_item_id: target_item_id
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["DepositSwitchGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_has_multiple_allocations" => data.account_has_multiple_allocations,
        "amount_allocated" => data.amount_allocated,
        "date_completed" => data.date_completed,
        "date_created" => data.date_created,
        "deposit_switch_id" => data.deposit_switch_id,
        "employer_id" => data.employer_id,
        "employer_name" => data.employer_name,
        "institution_id" => data.institution_id,
        "institution_name" => data.institution_name,
        "is_allocated_remainder" => data.is_allocated_remainder,
        "percent_allocated" => data.percent_allocated,
        "request_id" => data.request_id,
        "state" => data.state,
        "switch_method" => data.switch_method,
        "target_account_id" => data.target_account_id,
        "target_item_id" => data.target_item_id
      }
    end
  end

  defmodule(AuthMetadata) do
    @moduledoc "#{"AuthMetadata"}
    "
    defstruct(supported_methods: nil)
    @type t :: %__MODULE__{supported_methods: Plaid.AuthSupportedMethods.t()}
    @doc false
    def(decode(data)) do
      with(
        {:ok, supported_methods} <- Plaid.AuthSupportedMethods.decode(data["supported_methods"])
      ) do
        {:ok, %__MODULE__{supported_methods: supported_methods}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AuthMetadata" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"supported_methods" => Plaid.AuthSupportedMethods.encode(data.supported_methods)}
    end
  end

  defmodule(ItemWebhookUpdateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(item: nil, request_id: nil)
    @type t :: %__MODULE__{item: Plaid.Item.t(), request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, item} <- Plaid.Item.decode(data["item"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{item: item, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ItemWebhookUpdateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"item" => Plaid.Item.encode(data.item), "request_id" => data.request_id}
    end
  end

  defmodule(ServicerAddressData) do
    @moduledoc "#{"ServicerAddressData"}
    "
    defstruct(city: nil, country: nil, postal_code: nil, region: nil, street: nil)

    @type t :: %__MODULE__{
            city: binary,
            country: binary,
            postal_code: binary,
            region: binary,
            street: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, city} <-
          case(data["city"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["city"]}}
          end,
        {:ok, country} <-
          case(data["country"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["country"]}}
          end,
        {:ok, postal_code} <-
          case(data["postal_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["postal_code"]}}
          end,
        {:ok, region} <-
          case(data["region"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["region"]}}
          end,
        {:ok, street} <-
          case(data["street"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["street"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           city: city,
           country: country,
           postal_code: postal_code,
           region: region,
           street: street
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ServicerAddressData" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "city" => data.city,
        "country" => data.country,
        "postal_code" => data.postal_code,
        "region" => data.region,
        "street" => data.street
      }
    end
  end

  nil
  nil
  @type transfer_network :: binary
  @type payment_schedule_interval :: binary
  defmodule(BankTransferEventSyncResponse) do
    @moduledoc "#{"BankTransferEventSyncResponse"}
    "
    defstruct(bank_transfer_events: nil, request_id: nil)

    @type t :: %__MODULE__{
            bank_transfer_events: [Plaid.BankTransferEvent.t()],
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, bank_transfer_events} <-
          data["bank_transfer_events"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.BankTransferEvent.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{bank_transfer_events: bank_transfer_events, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferEventSyncResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "bank_transfer_events" =>
          case(data.bank_transfer_events) do
            nil ->
              nil

            _ ->
              Enum.map(data.bank_transfer_events, fn item ->
                Plaid.BankTransferEvent.encode(item)
              end)
          end,
        "request_id" => data.request_id
      }
    end
  end

  defmodule(IncomeBreakdown) do
    @moduledoc "#{"IncomeBreakdown"}
    "
    defstruct(hours: nil, rate: nil, total: nil, type: nil)
    @type t :: %__MODULE__{hours: number, rate: number, total: number, type: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, hours} <-
          case(data["hours"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["hours"]}}
          end,
        {:ok, rate} <-
          case(data["rate"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["rate"]}}
          end,
        {:ok, total} <-
          case(data["total"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["total"]}}
          end,
        {:ok, type} <-
          case(data["type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["type"]}}
          end
      ) do
        {:ok, %__MODULE__{hours: hours, rate: rate, total: total, type: type}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["IncomeBreakdown" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"hours" => data.hours, "rate" => data.rate, "total" => data.total, "type" => data.type}
    end
  end

  defmodule(TransferUserAddressInResponse) do
    @moduledoc "#{"TransferUserAddressInResponse"}
    "
    defstruct(city: nil, country: nil, postal_code: nil, region: nil, street: nil)

    @type t :: %__MODULE__{
            city: binary,
            country: binary,
            postal_code: binary,
            region: binary,
            street: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, city} <-
          case(data["city"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["city"]}}
          end,
        {:ok, country} <-
          case(data["country"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["country"]}}
          end,
        {:ok, postal_code} <-
          case(data["postal_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["postal_code"]}}
          end,
        {:ok, region} <-
          case(data["region"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["region"]}}
          end,
        {:ok, street} <-
          case(data["street"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["street"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           city: city,
           country: country,
           postal_code: postal_code,
           region: region,
           street: street
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransferUserAddressInResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "city" => data.city,
        "country" => data.country,
        "postal_code" => data.postal_code,
        "region" => data.region,
        "street" => data.street
      }
    end
  end

  defmodule(PaymentInitiationRecipientListResponse) do
    @moduledoc "#{nil}
    "
    defstruct(recipients: nil, request_id: nil)
    @type t :: %__MODULE__{recipients: [Plaid.PaymentInitiationRecipient.t()], request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, recipients} <-
          data["recipients"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.PaymentInitiationRecipient.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{recipients: recipients, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaymentInitiationRecipientListResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "recipients" =>
          case(data.recipients) do
            nil ->
              nil

            _ ->
              Enum.map(data.recipients, fn item ->
                Plaid.PaymentInitiationRecipient.encode(item)
              end)
          end,
        "request_id" => data.request_id
      }
    end
  end

  defmodule(Item) do
    @moduledoc "#{nil}
    "
    defstruct(
      available_products: nil,
      billed_products: nil,
      consent_expiration_time: nil,
      error: nil,
      institution_id: nil,
      item_id: nil,
      update_type: nil,
      webhook: nil
    )

    @type t :: %__MODULE__{
            available_products: [binary],
            billed_products: [binary],
            consent_expiration_time: binary,
            error: Plaid.Error.t(),
            institution_id: binary | nil,
            item_id: binary,
            update_type: binary,
            webhook: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, available_products} <-
          data["available_products"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with(
                {:ok, item} <-
                  case(data) do
                    x when is_binary(x) ->
                      {:ok, x}

                    x ->
                      {:error, {:decode, {:invalid_string, x}, ["Products"]}}
                  end
              ) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, billed_products} <-
          data["billed_products"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with(
                {:ok, item} <-
                  case(data) do
                    x when is_binary(x) ->
                      {:ok, x}

                    x ->
                      {:error, {:decode, {:invalid_string, x}, ["Products"]}}
                  end
              ) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, consent_expiration_time} <-
          case(data["consent_expiration_time"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["consent_expiration_time"]}}
          end,
        {:ok, error} <- Plaid.Error.decode(data["error"]),
        {:ok, institution_id} <-
          case(data["institution_id"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["institution_id"]}}
          end,
        {:ok, item_id} <-
          case(data["item_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["item_id"]}}
          end,
        {:ok, update_type} <-
          case(data["update_type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["update_type"]}}
          end,
        {:ok, webhook} <-
          case(data["webhook"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["webhook"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           available_products: available_products,
           billed_products: billed_products,
           consent_expiration_time: consent_expiration_time,
           error: error,
           institution_id: institution_id,
           item_id: item_id,
           update_type: update_type,
           webhook: webhook
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Item" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "available_products" =>
          case(data.available_products) do
            nil ->
              nil

            _ ->
              Enum.map(data.available_products, fn item -> item end)
          end,
        "billed_products" =>
          case(data.billed_products) do
            nil ->
              nil

            _ ->
              Enum.map(data.billed_products, fn item -> item end)
          end,
        "consent_expiration_time" => data.consent_expiration_time,
        "error" => Plaid.Error.encode(data.error),
        "institution_id" => data.institution_id,
        "item_id" => data.item_id,
        "update_type" => data.update_type,
        "webhook" => data.webhook
      }
    end
  end

  defmodule(AccountFilter) do
    @moduledoc "#{nil}
    "
    defstruct(credit: nil, depository: nil, investment: nil, loan: nil)

    @type t :: %__MODULE__{
            credit: [binary] | nil,
            depository: [binary] | nil,
            investment: [binary] | nil,
            loan: [binary] | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, credit} <-
          data["credit"]
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
        {:ok, depository} <-
          data["depository"]
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
        {:ok, investment} <-
          data["investment"]
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
        {:ok, loan} <-
          data["loan"]
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
        {:ok,
         %__MODULE__{credit: credit, depository: depository, investment: investment, loan: loan}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AccountFilter" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "credit" =>
          case(data.credit) do
            nil ->
              nil

            _ ->
              Enum.map(data.credit, fn item -> item end)
          end,
        "depository" =>
          case(data.depository) do
            nil ->
              nil

            _ ->
              Enum.map(data.depository, fn item -> item end)
          end,
        "investment" =>
          case(data.investment) do
            nil ->
              nil

            _ ->
              Enum.map(data.investment, fn item -> item end)
          end,
        "loan" =>
          case(data.loan) do
            nil ->
              nil

            _ ->
              Enum.map(data.loan, fn item -> item end)
          end
      }
    end
  end

  defmodule(TransferEvent) do
    @moduledoc "#{"TransferEvent"}
    "
    defstruct(
      account_id: nil,
      event_id: nil,
      event_type: nil,
      failure_reason: nil,
      origination_account_id: nil,
      timestamp: nil,
      transfer_amount: nil,
      transfer_id: nil,
      transfer_type: nil
    )

    @type t :: %__MODULE__{
            account_id: binary,
            event_id: integer,
            event_type: binary,
            failure_reason: Plaid.TransferFailure.t(),
            origination_account_id: binary,
            timestamp: binary,
            transfer_amount: binary,
            transfer_id: binary,
            transfer_type: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, event_id} <-
          case(data["event_id"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["event_id"]}}
          end,
        {:ok, event_type} <-
          case(data["event_type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["TransferEventType"]}}
          end,
        {:ok, failure_reason} <- Plaid.TransferFailure.decode(data["failure_reason"]),
        {:ok, origination_account_id} <-
          case(data["origination_account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["origination_account_id"]}}
          end,
        {:ok, timestamp} <-
          case(data["timestamp"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["timestamp"]}}
          end,
        {:ok, transfer_amount} <-
          case(data["transfer_amount"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["TransferAmount"]}}
          end,
        {:ok, transfer_id} <-
          case(data["transfer_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["TransferID"]}}
          end,
        {:ok, transfer_type} <-
          case(data["transfer_type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["TransferType"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           account_id: account_id,
           event_id: event_id,
           event_type: event_type,
           failure_reason: failure_reason,
           origination_account_id: origination_account_id,
           timestamp: timestamp,
           transfer_amount: transfer_amount,
           transfer_id: transfer_id,
           transfer_type: transfer_type
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransferEvent" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_id" => data.account_id,
        "event_id" => data.event_id,
        "event_type" => data.event_type,
        "failure_reason" => Plaid.TransferFailure.encode(data.failure_reason),
        "origination_account_id" => data.origination_account_id,
        "timestamp" => data.timestamp,
        "transfer_amount" => data.transfer_amount,
        "transfer_id" => data.transfer_id,
        "transfer_type" => data.transfer_type
      }
    end
  end

  defmodule(NumbersEFT) do
    @moduledoc "#{"NumbersEFT"}
    "
    defstruct(account: nil, account_id: nil, branch: nil, institution: nil)

    @type t :: %__MODULE__{
            account: binary,
            account_id: binary,
            branch: binary,
            institution: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account} <-
          case(data["account"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account"]}}
          end,
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, branch} <-
          case(data["branch"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["branch"]}}
          end,
        {:ok, institution} <-
          case(data["institution"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["institution"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           account: account,
           account_id: account_id,
           branch: branch,
           institution: institution
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["NumbersEFT" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account" => data.account,
        "account_id" => data.account_id,
        "branch" => data.branch,
        "institution" => data.institution
      }
    end
  end

  defmodule(LinkTokenGetMetadataResponse) do
    @moduledoc "#{nil}
    "
    defstruct(
      account_filters: nil,
      client_name: nil,
      country_codes: nil,
      initial_products: nil,
      language: nil,
      redirect_uri: nil,
      webhook: nil
    )

    @type t :: %__MODULE__{
            account_filters: Plaid.AccountFiltersResponse.t() | nil,
            client_name: binary,
            country_codes: [binary],
            initial_products: [binary],
            language: binary,
            redirect_uri: binary,
            webhook: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_filters} <- Plaid.AccountFiltersResponse.decode(data["account_filters"]),
        {:ok, client_name} <-
          case(data["client_name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["client_name"]}}
          end,
        {:ok, country_codes} <-
          data["country_codes"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with(
                {:ok, item} <-
                  case(data) do
                    x when is_binary(x) ->
                      {:ok, x}

                    x ->
                      {:error, {:decode, {:invalid_string, x}, ["CountryCode"]}}
                  end
              ) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, initial_products} <-
          data["initial_products"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with(
                {:ok, item} <-
                  case(data) do
                    x when is_binary(x) ->
                      {:ok, x}

                    x ->
                      {:error, {:decode, {:invalid_string, x}, ["Products"]}}
                  end
              ) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, language} <-
          case(data["language"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["language"]}}
          end,
        {:ok, redirect_uri} <-
          case(data["redirect_uri"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["redirect_uri"]}}
          end,
        {:ok, webhook} <-
          case(data["webhook"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["webhook"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           account_filters: account_filters,
           client_name: client_name,
           country_codes: country_codes,
           initial_products: initial_products,
           language: language,
           redirect_uri: redirect_uri,
           webhook: webhook
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["LinkTokenGetMetadataResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_filters" => Plaid.AccountFiltersResponse.encode(data.account_filters),
        "client_name" => data.client_name,
        "country_codes" =>
          case(data.country_codes) do
            nil ->
              nil

            _ ->
              Enum.map(data.country_codes, fn item -> item end)
          end,
        "initial_products" =>
          case(data.initial_products) do
            nil ->
              nil

            _ ->
              Enum.map(data.initial_products, fn item -> item end)
          end,
        "language" => data.language,
        "redirect_uri" => data.redirect_uri,
        "webhook" => data.webhook
      }
    end
  end

  defmodule(IncomeVerificationPaystubGetResponse) do
    @moduledoc "#{"IncomeVerificationPaystubGetResponse"}
    "
    defstruct(error: nil, paystub: nil, request_id: nil)

    @type t :: %__MODULE__{
            error: Plaid.Error.t() | nil,
            paystub: Plaid.Paystub.t(),
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, error} <- Plaid.Error.decode(data["error"]),
        {:ok, paystub} <- Plaid.Paystub.decode(data["paystub"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{error: error, paystub: paystub, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["IncomeVerificationPaystubGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "error" => Plaid.Error.encode(data.error),
        "paystub" => Plaid.Paystub.encode(data.paystub),
        "request_id" => data.request_id
      }
    end
  end

  defmodule(PaystubYTDDetails) do
    @moduledoc "#{"PaystubYTDDetails"}
    "
    defstruct(gross_earnings: nil, net_earnings: nil)
    @type t :: %__MODULE__{gross_earnings: number | nil, net_earnings: number | nil}
    @doc false
    def(decode(data)) do
      with(
        {:ok, gross_earnings} <-
          case(data["gross_earnings"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["gross_earnings"]}}
          end,
        {:ok, net_earnings} <-
          case(data["net_earnings"]) do
            x when is_nil(x) or is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["net_earnings"]}}
          end
      ) do
        {:ok, %__MODULE__{gross_earnings: gross_earnings, net_earnings: net_earnings}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaystubYTDDetails" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"gross_earnings" => data.gross_earnings, "net_earnings" => data.net_earnings}
    end
  end

  defmodule(AssetReportAuditCopyCreateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(audit_copy_token: nil, request_id: nil)
    @type t :: %__MODULE__{audit_copy_token: binary, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, audit_copy_token} <-
          case(data["audit_copy_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["audit_copy_token"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{audit_copy_token: audit_copy_token, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AssetReportAuditCopyCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"audit_copy_token" => data.audit_copy_token, "request_id" => data.request_id}
    end
  end

  defmodule(PaymentInitiationRefund) do
    @moduledoc "#{nil}
    "
    defstruct(amount: nil, last_status_update: nil, refund_id: nil, status: nil)

    @type t :: %__MODULE__{
            amount: Plaid.PaymentAmount.t(),
            last_status_update: binary,
            refund_id: binary,
            status: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, amount} <- Plaid.PaymentAmount.decode(data["amount"]),
        {:ok, last_status_update} <-
          case(data["last_status_update"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["last_status_update"]}}
          end,
        {:ok, refund_id} <-
          case(data["refund_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["refund_id"]}}
          end,
        {:ok, status} <-
          case(data["status"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["status"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           amount: amount,
           last_status_update: last_status_update,
           refund_id: refund_id,
           status: status
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaymentInitiationRefund" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "amount" => Plaid.PaymentAmount.encode(data.amount),
        "last_status_update" => data.last_status_update,
        "refund_id" => data.refund_id,
        "status" => data.status
      }
    end
  end

  defmodule(SignalEvaluateResponse) do
    @moduledoc "#{"SignalEvaluateResponse"}
    "
    defstruct(core_attributes: nil, request_id: nil, scores: nil)

    @type t :: %__MODULE__{
            core_attributes: Plaid.SignalEvaluateCoreAttributes.t(),
            request_id: binary,
            scores: Plaid.SignalScores.t()
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, core_attributes} <-
          Plaid.SignalEvaluateCoreAttributes.decode(data["core_attributes"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, scores} <- Plaid.SignalScores.decode(data["scores"])
      ) do
        {:ok,
         %__MODULE__{core_attributes: core_attributes, request_id: request_id, scores: scores}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SignalEvaluateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "core_attributes" => Plaid.SignalEvaluateCoreAttributes.encode(data.core_attributes),
        "request_id" => data.request_id,
        "scores" => Plaid.SignalScores.encode(data.scores)
      }
    end
  end

  defmodule(BankTransferCreateResponse) do
    @moduledoc "#{"BankTransferCreateResponse"}
    "
    defstruct(bank_transfer: nil, request_id: nil)
    @type t :: %__MODULE__{bank_transfer: Plaid.BankTransfer.t(), request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, bank_transfer} <- Plaid.BankTransfer.decode(data["bank_transfer"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{bank_transfer: bank_transfer, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "bank_transfer" => Plaid.BankTransfer.encode(data.bank_transfer),
        "request_id" => data.request_id
      }
    end
  end

  defmodule(BankTransferFailure) do
    @moduledoc "#{"BankTransferFailure"}
    "
    defstruct(ach_return_code: nil, description: nil)
    @type t :: %__MODULE__{ach_return_code: binary | nil, description: binary | nil}
    @doc false
    def(decode(data)) do
      with(
        {:ok, ach_return_code} <-
          case(data["ach_return_code"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["ach_return_code"]}}
          end,
        {:ok, description} <-
          case(data["description"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["description"]}}
          end
      ) do
        {:ok, %__MODULE__{ach_return_code: ach_return_code, description: description}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferFailure" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"ach_return_code" => data.ach_return_code, "description" => data.description}
    end
  end

  defmodule(SandboxIncomeFireWebhookResponse) do
    @moduledoc "#{"SandboxIncomeFireWebhookResponse"}
    "
    defstruct(request_id: nil)
    @type t :: %__MODULE__{request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SandboxIncomeFireWebhookResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id}
    end
  end

  defmodule(IncomeSummary) do
    @moduledoc "#{"IncomeSummary"}
    "
    defstruct(
      employee_name: nil,
      employer_name: nil,
      pay_frequency: nil,
      projected_wage: nil,
      verified_transaction: nil,
      ytd_gross_income: nil,
      ytd_net_income: nil
    )

    @type t :: %__MODULE__{
            employee_name: any,
            employer_name: any,
            pay_frequency: Plaid.PayFrequency.t(),
            projected_wage: any,
            verified_transaction: Plaid.TransactionData.t(),
            ytd_gross_income: any,
            ytd_net_income: any
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, employee_name} <- {:ok, data["employee_name"]},
        {:ok, employer_name} <- {:ok, data["employer_name"]},
        {:ok, pay_frequency} <- Plaid.PayFrequency.decode(data["pay_frequency"]),
        {:ok, projected_wage} <- {:ok, data["projected_wage"]},
        {:ok, verified_transaction} <- Plaid.TransactionData.decode(data["verified_transaction"]),
        {:ok, ytd_gross_income} <- {:ok, data["ytd_gross_income"]},
        {:ok, ytd_net_income} <- {:ok, data["ytd_net_income"]}
      ) do
        {:ok,
         %__MODULE__{
           employee_name: employee_name,
           employer_name: employer_name,
           pay_frequency: pay_frequency,
           projected_wage: projected_wage,
           verified_transaction: verified_transaction,
           ytd_gross_income: ytd_gross_income,
           ytd_net_income: ytd_net_income
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["IncomeSummary" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "employee_name" => data.employee_name,
        "employer_name" => data.employer_name,
        "pay_frequency" => Plaid.PayFrequency.encode(data.pay_frequency),
        "projected_wage" => data.projected_wage,
        "verified_transaction" => Plaid.TransactionData.encode(data.verified_transaction),
        "ytd_gross_income" => data.ytd_gross_income,
        "ytd_net_income" => data.ytd_net_income
      }
    end
  end

  defmodule(PaymentInitiationPaymentCreateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(payment_id: nil, request_id: nil, status: nil)
    @type t :: %__MODULE__{payment_id: binary, request_id: binary, status: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, payment_id} <-
          case(data["payment_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["payment_id"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, status} <-
          case(data["status"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["status"]}}
          end
      ) do
        {:ok, %__MODULE__{payment_id: payment_id, request_id: request_id, status: status}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaymentInitiationPaymentCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"payment_id" => data.payment_id, "request_id" => data.request_id, "status" => data.status}
    end
  end

  defmodule(W2StateAndLocalWages) do
    @moduledoc "#{"W2StateAndLocalWages"}
    "
    defstruct(
      employer_state_id_number: nil,
      local_income_tax: nil,
      local_wages_tips: nil,
      locality_name: nil,
      state: nil,
      state_income_tax: nil,
      state_wages_tips: nil
    )

    @type t :: %__MODULE__{
            employer_state_id_number: binary | nil,
            local_income_tax: binary | nil,
            local_wages_tips: binary | nil,
            locality_name: binary | nil,
            state: binary | nil,
            state_income_tax: binary | nil,
            state_wages_tips: binary | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, employer_state_id_number} <-
          case(data["employer_state_id_number"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["employer_state_id_number"]}}
          end,
        {:ok, local_income_tax} <-
          case(data["local_income_tax"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["local_income_tax"]}}
          end,
        {:ok, local_wages_tips} <-
          case(data["local_wages_tips"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["local_wages_tips"]}}
          end,
        {:ok, locality_name} <-
          case(data["locality_name"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["locality_name"]}}
          end,
        {:ok, state} <-
          case(data["state"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["state"]}}
          end,
        {:ok, state_income_tax} <-
          case(data["state_income_tax"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["state_income_tax"]}}
          end,
        {:ok, state_wages_tips} <-
          case(data["state_wages_tips"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["state_wages_tips"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           employer_state_id_number: employer_state_id_number,
           local_income_tax: local_income_tax,
           local_wages_tips: local_wages_tips,
           locality_name: locality_name,
           state: state,
           state_income_tax: state_income_tax,
           state_wages_tips: state_wages_tips
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["W2StateAndLocalWages" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "employer_state_id_number" => data.employer_state_id_number,
        "local_income_tax" => data.local_income_tax,
        "local_wages_tips" => data.local_wages_tips,
        "locality_name" => data.locality_name,
        "state" => data.state,
        "state_income_tax" => data.state_income_tax,
        "state_wages_tips" => data.state_wages_tips
      }
    end
  end

  @type bank_transfer_status :: binary
  defmodule(Institution) do
    @moduledoc "#{"Institution"}
    "
    defstruct(
      auth_metadata: nil,
      country_codes: nil,
      institution_id: nil,
      logo: nil,
      name: nil,
      oauth: nil,
      payment_initiation_metadata: nil,
      primary_color: nil,
      products: nil,
      routing_numbers: nil,
      status: nil,
      url: nil
    )

    @type t :: %__MODULE__{
            auth_metadata: Plaid.AuthMetadata.t() | nil,
            country_codes: [binary],
            institution_id: binary,
            logo: binary | nil,
            name: binary,
            oauth: boolean,
            payment_initiation_metadata: Plaid.PaymentInitiationMetadata.t() | nil,
            primary_color: binary | nil,
            products: [binary],
            routing_numbers: [binary],
            status: Plaid.InstitutionStatus.t() | nil,
            url: binary | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, auth_metadata} <- Plaid.AuthMetadata.decode(data["auth_metadata"]),
        {:ok, country_codes} <-
          data["country_codes"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with(
                {:ok, item} <-
                  case(data) do
                    x when is_binary(x) ->
                      {:ok, x}

                    x ->
                      {:error, {:decode, {:invalid_string, x}, ["CountryCode"]}}
                  end
              ) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, institution_id} <-
          case(data["institution_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["institution_id"]}}
          end,
        {:ok, logo} <-
          case(data["logo"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["logo"]}}
          end,
        {:ok, name} <-
          case(data["name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["name"]}}
          end,
        {:ok, oauth} <-
          case(data["oauth"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["oauth"]}}
          end,
        {:ok, payment_initiation_metadata} <-
          Plaid.PaymentInitiationMetadata.decode(data["payment_initiation_metadata"]),
        {:ok, primary_color} <-
          case(data["primary_color"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["primary_color"]}}
          end,
        {:ok, products} <-
          data["products"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with(
                {:ok, item} <-
                  case(data) do
                    x when is_binary(x) ->
                      {:ok, x}

                    x ->
                      {:error, {:decode, {:invalid_string, x}, ["Products"]}}
                  end
              ) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, routing_numbers} <-
          data["routing_numbers"]
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
        {:ok, status} <- Plaid.InstitutionStatus.decode(data["status"]),
        {:ok, url} <-
          case(data["url"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["url"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           auth_metadata: auth_metadata,
           country_codes: country_codes,
           institution_id: institution_id,
           logo: logo,
           name: name,
           oauth: oauth,
           payment_initiation_metadata: payment_initiation_metadata,
           primary_color: primary_color,
           products: products,
           routing_numbers: routing_numbers,
           status: status,
           url: url
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Institution" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "auth_metadata" => Plaid.AuthMetadata.encode(data.auth_metadata),
        "country_codes" =>
          case(data.country_codes) do
            nil ->
              nil

            _ ->
              Enum.map(data.country_codes, fn item -> item end)
          end,
        "institution_id" => data.institution_id,
        "logo" => data.logo,
        "name" => data.name,
        "oauth" => data.oauth,
        "payment_initiation_metadata" =>
          Plaid.PaymentInitiationMetadata.encode(data.payment_initiation_metadata),
        "primary_color" => data.primary_color,
        "products" =>
          case(data.products) do
            nil ->
              nil

            _ ->
              Enum.map(data.products, fn item -> item end)
          end,
        "routing_numbers" =>
          case(data.routing_numbers) do
            nil ->
              nil

            _ ->
              Enum.map(data.routing_numbers, fn item -> item end)
          end,
        "status" => Plaid.InstitutionStatus.encode(data.status),
        "url" => data.url
      }
    end
  end

  defmodule(ProcessorAuthGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(account: nil, numbers: nil, request_id: nil)

    @type t :: %__MODULE__{
            account: Plaid.AccountBase.t(),
            numbers: Plaid.ProcessorNumber.t(),
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account} <- Plaid.AccountBase.decode(data["account"]),
        {:ok, numbers} <- Plaid.ProcessorNumber.decode(data["numbers"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{account: account, numbers: numbers, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ProcessorAuthGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account" => Plaid.AccountBase.encode(data.account),
        "numbers" => Plaid.ProcessorNumber.encode(data.numbers),
        "request_id" => data.request_id
      }
    end
  end

  defmodule(TransferFailure) do
    @moduledoc "#{"TransferFailure"}
    "
    defstruct(ach_return_code: nil, description: nil)
    @type t :: %__MODULE__{ach_return_code: binary | nil, description: binary | nil}
    @doc false
    def(decode(data)) do
      with(
        {:ok, ach_return_code} <-
          case(data["ach_return_code"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["ach_return_code"]}}
          end,
        {:ok, description} <-
          case(data["description"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["description"]}}
          end
      ) do
        {:ok, %__MODULE__{ach_return_code: ach_return_code, description: description}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransferFailure" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"ach_return_code" => data.ach_return_code, "description" => data.description}
    end
  end

  defmodule(BankTransferMigrateAccountResponse) do
    @moduledoc "#{"BankTransferMigrateAccountResponse"}
    "
    defstruct(access_token: nil, account_id: nil, request_id: nil)
    @type t :: %__MODULE__{access_token: binary, account_id: binary, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, access_token} <-
          case(data["access_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["access_token"]}}
          end,
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok,
         %__MODULE__{access_token: access_token, account_id: account_id, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferMigrateAccountResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "access_token" => data.access_token,
        "account_id" => data.account_id,
        "request_id" => data.request_id
      }
    end
  end

  defmodule(TransferEventSyncResponse) do
    @moduledoc "#{"TransferEventSyncResponse"}
    "
    defstruct(request_id: nil, transfer_events: nil)
    @type t :: %__MODULE__{request_id: binary, transfer_events: [Plaid.TransferEvent.t()]}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, transfer_events} <-
          data["transfer_events"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.TransferEvent.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok, %__MODULE__{request_id: request_id, transfer_events: transfer_events}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransferEventSyncResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "request_id" => data.request_id,
        "transfer_events" =>
          case(data.transfer_events) do
            nil ->
              nil

            _ ->
              Enum.map(data.transfer_events, fn item -> Plaid.TransferEvent.encode(item) end)
          end
      }
    end
  end

  defmodule(IncomeVerificationCreateResponse) do
    @moduledoc "#{"IncomeVerificationCreateResponse"}
    "
    defstruct(income_verification_id: nil, request_id: nil)
    @type t :: %__MODULE__{income_verification_id: binary, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, income_verification_id} <-
          case(data["income_verification_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["income_verification_id"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{income_verification_id: income_verification_id, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["IncomeVerificationCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"income_verification_id" => data.income_verification_id, "request_id" => data.request_id}
    end
  end

  defmodule(ProcessorBalanceGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(account: nil, request_id: nil)
    @type t :: %__MODULE__{account: Plaid.AccountBase.t(), request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, account} <- Plaid.AccountBase.decode(data["account"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{account: account, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ProcessorBalanceGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"account" => Plaid.AccountBase.encode(data.account), "request_id" => data.request_id}
    end
  end

  defmodule(SandboxOauthSelectAccountsResponse) do
    @moduledoc "#{"SandboxOauthSelectAccountsResponse"}
    "
    defstruct([])
    @type t :: %__MODULE__{}
    @doc false
    def(decode(_)) do
      {:ok, %__MODULE__{}}
    end

    @doc false
    def(encode(_)) do
      %{}
    end
  end

  defmodule(IncidentUpdate) do
    @moduledoc "#{"IncidentUpdate"}
    "
    defstruct(description: nil, status: nil, updated_date: nil)

    @type t :: %__MODULE__{
            description: binary | nil,
            status: binary | nil,
            updated_date: binary | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, description} <-
          case(data["description"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["description"]}}
          end,
        {:ok, status} <-
          case(data["status"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["status"]}}
          end,
        {:ok, updated_date} <-
          case(data["updated_date"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["updated_date"]}}
          end
      ) do
        {:ok, %__MODULE__{description: description, status: status, updated_date: updated_date}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["IncidentUpdate" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "description" => data.description,
        "status" => data.status,
        "updated_date" => data.updated_date
      }
    end
  end

  @type application_id :: binary
  defmodule(Security) do
    @moduledoc "#{"Security"}
    "
    defstruct(
      close_price: nil,
      close_price_as_of: nil,
      cusip: nil,
      institution_id: nil,
      institution_security_id: nil,
      is_cash_equivalent: nil,
      isin: nil,
      iso_currency_code: nil,
      name: nil,
      proxy_security_id: nil,
      security_id: nil,
      sedol: nil,
      ticker_symbol: nil,
      type: nil,
      unofficial_currency_code: nil
    )

    @type t :: %__MODULE__{
            close_price: number,
            close_price_as_of: binary,
            cusip: binary,
            institution_id: binary,
            institution_security_id: binary,
            is_cash_equivalent: boolean,
            isin: binary,
            iso_currency_code: binary,
            name: binary,
            proxy_security_id: binary,
            security_id: binary,
            sedol: binary,
            ticker_symbol: binary,
            type: binary,
            unofficial_currency_code: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, close_price} <-
          case(data["close_price"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["close_price"]}}
          end,
        {:ok, close_price_as_of} <-
          case(data["close_price_as_of"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["close_price_as_of"]}}
          end,
        {:ok, cusip} <-
          case(data["cusip"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["cusip"]}}
          end,
        {:ok, institution_id} <-
          case(data["institution_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["institution_id"]}}
          end,
        {:ok, institution_security_id} <-
          case(data["institution_security_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["institution_security_id"]}}
          end,
        {:ok, is_cash_equivalent} <-
          case(data["is_cash_equivalent"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["is_cash_equivalent"]}}
          end,
        {:ok, isin} <-
          case(data["isin"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["isin"]}}
          end,
        {:ok, iso_currency_code} <-
          case(data["iso_currency_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["iso_currency_code"]}}
          end,
        {:ok, name} <-
          case(data["name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["name"]}}
          end,
        {:ok, proxy_security_id} <-
          case(data["proxy_security_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["proxy_security_id"]}}
          end,
        {:ok, security_id} <-
          case(data["security_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["security_id"]}}
          end,
        {:ok, sedol} <-
          case(data["sedol"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["sedol"]}}
          end,
        {:ok, ticker_symbol} <-
          case(data["ticker_symbol"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["ticker_symbol"]}}
          end,
        {:ok, type} <-
          case(data["type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["type"]}}
          end,
        {:ok, unofficial_currency_code} <-
          case(data["unofficial_currency_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["unofficial_currency_code"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           close_price: close_price,
           close_price_as_of: close_price_as_of,
           cusip: cusip,
           institution_id: institution_id,
           institution_security_id: institution_security_id,
           is_cash_equivalent: is_cash_equivalent,
           isin: isin,
           iso_currency_code: iso_currency_code,
           name: name,
           proxy_security_id: proxy_security_id,
           security_id: security_id,
           sedol: sedol,
           ticker_symbol: ticker_symbol,
           type: type,
           unofficial_currency_code: unofficial_currency_code
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Security" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "close_price" => data.close_price,
        "close_price_as_of" => data.close_price_as_of,
        "cusip" => data.cusip,
        "institution_id" => data.institution_id,
        "institution_security_id" => data.institution_security_id,
        "is_cash_equivalent" => data.is_cash_equivalent,
        "isin" => data.isin,
        "iso_currency_code" => data.iso_currency_code,
        "name" => data.name,
        "proxy_security_id" => data.proxy_security_id,
        "security_id" => data.security_id,
        "sedol" => data.sedol,
        "ticker_symbol" => data.ticker_symbol,
        "type" => data.type,
        "unofficial_currency_code" => data.unofficial_currency_code
      }
    end
  end

  defmodule(CreditCardLiability) do
    @moduledoc "#{"CreditCardLiability"}
    "
    defstruct(
      account_id: nil,
      aprs: nil,
      is_overdue: nil,
      last_payment_amount: nil,
      last_payment_date: nil,
      last_statement_issue_date: nil,
      minimum_payment_amount: nil,
      next_payment_due_date: nil
    )

    @type t :: %__MODULE__{
            account_id: binary,
            aprs: [Plaid.APR.t()],
            is_overdue: boolean,
            last_payment_amount: number,
            last_payment_date: binary,
            last_statement_issue_date: binary,
            minimum_payment_amount: number,
            next_payment_due_date: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, aprs} <-
          data["aprs"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.APR.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, is_overdue} <-
          case(data["is_overdue"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["is_overdue"]}}
          end,
        {:ok, last_payment_amount} <-
          case(data["last_payment_amount"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["last_payment_amount"]}}
          end,
        {:ok, last_payment_date} <-
          case(data["last_payment_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["last_payment_date"]}}
          end,
        {:ok, last_statement_issue_date} <-
          case(data["last_statement_issue_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["last_statement_issue_date"]}}
          end,
        {:ok, minimum_payment_amount} <-
          case(data["minimum_payment_amount"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["minimum_payment_amount"]}}
          end,
        {:ok, next_payment_due_date} <-
          case(data["next_payment_due_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["next_payment_due_date"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           account_id: account_id,
           aprs: aprs,
           is_overdue: is_overdue,
           last_payment_amount: last_payment_amount,
           last_payment_date: last_payment_date,
           last_statement_issue_date: last_statement_issue_date,
           minimum_payment_amount: minimum_payment_amount,
           next_payment_due_date: next_payment_due_date
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["CreditCardLiability" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_id" => data.account_id,
        "aprs" =>
          case(data.aprs) do
            nil ->
              nil

            _ ->
              Enum.map(data.aprs, fn item -> Plaid.APR.encode(item) end)
          end,
        "is_overdue" => data.is_overdue,
        "last_payment_amount" => data.last_payment_amount,
        "last_payment_date" => data.last_payment_date,
        "last_statement_issue_date" => data.last_statement_issue_date,
        "minimum_payment_amount" => data.minimum_payment_amount,
        "next_payment_due_date" => data.next_payment_due_date
      }
    end
  end

  defmodule(Category) do
    @moduledoc "#{"Category"}
    "
    defstruct(category_id: nil, group: nil, hierarchy: nil)
    @type t :: %__MODULE__{category_id: binary, group: binary, hierarchy: [binary]}
    @doc false
    def(decode(data)) do
      with(
        {:ok, category_id} <-
          case(data["category_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["category_id"]}}
          end,
        {:ok, group} <-
          case(data["group"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["group"]}}
          end,
        {:ok, hierarchy} <-
          data["hierarchy"]
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
        {:ok, %__MODULE__{category_id: category_id, group: group, hierarchy: hierarchy}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Category" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "category_id" => data.category_id,
        "group" => data.group,
        "hierarchy" =>
          case(data.hierarchy) do
            nil ->
              nil

            _ ->
              Enum.map(data.hierarchy, fn item -> item end)
          end
      }
    end
  end

  defmodule(CreditFilter) do
    @moduledoc "#{"CreditFilter"}
    "
    defstruct(account_subtypes: nil)
    @type t :: %__MODULE__{account_subtypes: [binary]}
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_subtypes} <-
          data["account_subtypes"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with(
                {:ok, item} <-
                  case(data) do
                    x when is_binary(x) ->
                      {:ok, x}

                    x ->
                      {:error, {:decode, {:invalid_string, x}, ["AccountSubtype"]}}
                  end
              ) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok, %__MODULE__{account_subtypes: account_subtypes}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["CreditFilter" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_subtypes" =>
          case(data.account_subtypes) do
            nil ->
              nil

            _ ->
              Enum.map(data.account_subtypes, fn item -> item end)
          end
      }
    end
  end

  nil
  nil

  defmodule(StudentLoan) do
    @moduledoc "#{"StudentLoan"}
    "
    defstruct(
      account_id: nil,
      account_number: nil,
      disbursement_dates: nil,
      expected_payoff_date: nil,
      guarantor: nil,
      interest_rate_percentage: nil,
      is_overdue: nil,
      last_payment_amount: nil,
      last_payment_date: nil,
      last_statement_issue_date: nil,
      loan_name: nil,
      loan_status: nil,
      minimum_payment_amount: nil,
      next_payment_due_date: nil,
      origination_date: nil,
      origination_principal_amount: nil,
      outstanding_interest_amount: nil,
      payment_reference_number: nil,
      pslf_status: nil,
      repayment_plan: nil,
      sequence_number: nil,
      servicer_address: nil,
      ytd_interest_paid: nil,
      ytd_principal_paid: nil
    )

    @type t :: %__MODULE__{
            account_id: binary,
            account_number: binary,
            disbursement_dates: [binary],
            expected_payoff_date: binary,
            guarantor: binary,
            interest_rate_percentage: number,
            is_overdue: boolean,
            last_payment_amount: number,
            last_payment_date: binary,
            last_statement_issue_date: binary,
            loan_name: binary,
            loan_status: Plaid.StudentLoanStatus.t(),
            minimum_payment_amount: number,
            next_payment_due_date: binary,
            origination_date: binary,
            origination_principal_amount: number,
            outstanding_interest_amount: number,
            payment_reference_number: binary,
            pslf_status: Plaid.PSLFStatus.t(),
            repayment_plan: Plaid.StudentRepaymentPlan.t(),
            sequence_number: binary,
            servicer_address: Plaid.ServicerAddressData.t(),
            ytd_interest_paid: number,
            ytd_principal_paid: number
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, account_number} <-
          case(data["account_number"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_number"]}}
          end,
        {:ok, disbursement_dates} <-
          data["disbursement_dates"]
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
        {:ok, expected_payoff_date} <-
          case(data["expected_payoff_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["expected_payoff_date"]}}
          end,
        {:ok, guarantor} <-
          case(data["guarantor"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["guarantor"]}}
          end,
        {:ok, interest_rate_percentage} <-
          case(data["interest_rate_percentage"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["interest_rate_percentage"]}}
          end,
        {:ok, is_overdue} <-
          case(data["is_overdue"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["is_overdue"]}}
          end,
        {:ok, last_payment_amount} <-
          case(data["last_payment_amount"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["last_payment_amount"]}}
          end,
        {:ok, last_payment_date} <-
          case(data["last_payment_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["last_payment_date"]}}
          end,
        {:ok, last_statement_issue_date} <-
          case(data["last_statement_issue_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["last_statement_issue_date"]}}
          end,
        {:ok, loan_name} <-
          case(data["loan_name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["loan_name"]}}
          end,
        {:ok, loan_status} <- Plaid.StudentLoanStatus.decode(data["loan_status"]),
        {:ok, minimum_payment_amount} <-
          case(data["minimum_payment_amount"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["minimum_payment_amount"]}}
          end,
        {:ok, next_payment_due_date} <-
          case(data["next_payment_due_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["next_payment_due_date"]}}
          end,
        {:ok, origination_date} <-
          case(data["origination_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["origination_date"]}}
          end,
        {:ok, origination_principal_amount} <-
          case(data["origination_principal_amount"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["origination_principal_amount"]}}
          end,
        {:ok, outstanding_interest_amount} <-
          case(data["outstanding_interest_amount"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["outstanding_interest_amount"]}}
          end,
        {:ok, payment_reference_number} <-
          case(data["payment_reference_number"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["payment_reference_number"]}}
          end,
        {:ok, pslf_status} <- Plaid.PSLFStatus.decode(data["pslf_status"]),
        {:ok, repayment_plan} <- Plaid.StudentRepaymentPlan.decode(data["repayment_plan"]),
        {:ok, sequence_number} <-
          case(data["sequence_number"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["sequence_number"]}}
          end,
        {:ok, servicer_address} <- Plaid.ServicerAddressData.decode(data["servicer_address"]),
        {:ok, ytd_interest_paid} <-
          case(data["ytd_interest_paid"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["ytd_interest_paid"]}}
          end,
        {:ok, ytd_principal_paid} <-
          case(data["ytd_principal_paid"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["ytd_principal_paid"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           account_id: account_id,
           account_number: account_number,
           disbursement_dates: disbursement_dates,
           expected_payoff_date: expected_payoff_date,
           guarantor: guarantor,
           interest_rate_percentage: interest_rate_percentage,
           is_overdue: is_overdue,
           last_payment_amount: last_payment_amount,
           last_payment_date: last_payment_date,
           last_statement_issue_date: last_statement_issue_date,
           loan_name: loan_name,
           loan_status: loan_status,
           minimum_payment_amount: minimum_payment_amount,
           next_payment_due_date: next_payment_due_date,
           origination_date: origination_date,
           origination_principal_amount: origination_principal_amount,
           outstanding_interest_amount: outstanding_interest_amount,
           payment_reference_number: payment_reference_number,
           pslf_status: pslf_status,
           repayment_plan: repayment_plan,
           sequence_number: sequence_number,
           servicer_address: servicer_address,
           ytd_interest_paid: ytd_interest_paid,
           ytd_principal_paid: ytd_principal_paid
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["StudentLoan" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_id" => data.account_id,
        "account_number" => data.account_number,
        "disbursement_dates" =>
          case(data.disbursement_dates) do
            nil ->
              nil

            _ ->
              Enum.map(data.disbursement_dates, fn item -> item end)
          end,
        "expected_payoff_date" => data.expected_payoff_date,
        "guarantor" => data.guarantor,
        "interest_rate_percentage" => data.interest_rate_percentage,
        "is_overdue" => data.is_overdue,
        "last_payment_amount" => data.last_payment_amount,
        "last_payment_date" => data.last_payment_date,
        "last_statement_issue_date" => data.last_statement_issue_date,
        "loan_name" => data.loan_name,
        "loan_status" => Plaid.StudentLoanStatus.encode(data.loan_status),
        "minimum_payment_amount" => data.minimum_payment_amount,
        "next_payment_due_date" => data.next_payment_due_date,
        "origination_date" => data.origination_date,
        "origination_principal_amount" => data.origination_principal_amount,
        "outstanding_interest_amount" => data.outstanding_interest_amount,
        "payment_reference_number" => data.payment_reference_number,
        "pslf_status" => Plaid.PSLFStatus.encode(data.pslf_status),
        "repayment_plan" => Plaid.StudentRepaymentPlan.encode(data.repayment_plan),
        "sequence_number" => data.sequence_number,
        "servicer_address" => Plaid.ServicerAddressData.encode(data.servicer_address),
        "ytd_interest_paid" => data.ytd_interest_paid,
        "ytd_principal_paid" => data.ytd_principal_paid
      }
    end
  end

  defmodule(APR) do
    @moduledoc "#{"APR"}
    "
    defstruct(
      apr_percentage: nil,
      apr_type: nil,
      balance_subject_to_apr: nil,
      interest_charge_amount: nil
    )

    @type t :: %__MODULE__{
            apr_percentage: number,
            apr_type: binary,
            balance_subject_to_apr: number,
            interest_charge_amount: number
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, apr_percentage} <-
          case(data["apr_percentage"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["apr_percentage"]}}
          end,
        {:ok, apr_type} <-
          case(data["apr_type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["apr_type"]}}
          end,
        {:ok, balance_subject_to_apr} <-
          case(data["balance_subject_to_apr"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["balance_subject_to_apr"]}}
          end,
        {:ok, interest_charge_amount} <-
          case(data["interest_charge_amount"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["interest_charge_amount"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           apr_percentage: apr_percentage,
           apr_type: apr_type,
           balance_subject_to_apr: balance_subject_to_apr,
           interest_charge_amount: interest_charge_amount
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["APR" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "apr_percentage" => data.apr_percentage,
        "apr_type" => data.apr_type,
        "balance_subject_to_apr" => data.balance_subject_to_apr,
        "interest_charge_amount" => data.interest_charge_amount
      }
    end
  end

  defmodule(SignalReturnReportResponse) do
    @moduledoc "#{"SignalReturnReportResponse"}
    "
    defstruct(request_id: nil)
    @type t :: %__MODULE__{request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SignalReturnReportResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id}
    end
  end

  @type account_subtype :: binary
  defmodule(PaymentInitiationMetadata) do
    @moduledoc "#{"PaymentInitiationMetadata"}
    "
    defstruct(
      maximum_payment_amount: nil,
      standing_order_metadata: nil,
      supports_international_payments: nil,
      supports_refund_details: nil
    )

    @type t :: %__MODULE__{
            maximum_payment_amount: %{},
            standing_order_metadata: Plaid.PaymentInitiationStandingOrderMetadata.t(),
            supports_international_payments: boolean,
            supports_refund_details: boolean
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, maximum_payment_amount} <-
          with do
            {:ok, %{}}
          end,
        {:ok, standing_order_metadata} <-
          Plaid.PaymentInitiationStandingOrderMetadata.decode(data["standing_order_metadata"]),
        {:ok, supports_international_payments} <-
          case(data["supports_international_payments"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["supports_international_payments"]}}
          end,
        {:ok, supports_refund_details} <-
          case(data["supports_refund_details"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["supports_refund_details"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           maximum_payment_amount: maximum_payment_amount,
           standing_order_metadata: standing_order_metadata,
           supports_international_payments: supports_international_payments,
           supports_refund_details: supports_refund_details
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaymentInitiationMetadata" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "maximum_payment_amount" => %{},
        "standing_order_metadata" =>
          Plaid.PaymentInitiationStandingOrderMetadata.encode(data.standing_order_metadata),
        "supports_international_payments" => data.supports_international_payments,
        "supports_refund_details" => data.supports_refund_details
      }
    end
  end

  defmodule(InvestmentsTransactionsGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(
      accounts: nil,
      investment_transactions: nil,
      item: nil,
      request_id: nil,
      securities: nil,
      total_investment_transactions: nil
    )

    @type t :: %__MODULE__{
            accounts: [Plaid.AccountBase.t()],
            investment_transactions: [Plaid.InvestmentTransaction.t()],
            item: Plaid.Item.t(),
            request_id: binary,
            securities: [Plaid.Security.t()],
            total_investment_transactions: integer
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, accounts} <-
          data["accounts"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.AccountBase.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, investment_transactions} <-
          data["investment_transactions"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.InvestmentTransaction.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, item} <- Plaid.Item.decode(data["item"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, securities} <-
          data["securities"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.Security.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, total_investment_transactions} <-
          case(data["total_investment_transactions"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["total_investment_transactions"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           accounts: accounts,
           investment_transactions: investment_transactions,
           item: item,
           request_id: request_id,
           securities: securities,
           total_investment_transactions: total_investment_transactions
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["InvestmentsTransactionsGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "accounts" =>
          case(data.accounts) do
            nil ->
              nil

            _ ->
              Enum.map(data.accounts, fn item -> Plaid.AccountBase.encode(item) end)
          end,
        "investment_transactions" =>
          case(data.investment_transactions) do
            nil ->
              nil

            _ ->
              Enum.map(data.investment_transactions, fn item ->
                Plaid.InvestmentTransaction.encode(item)
              end)
          end,
        "item" => Plaid.Item.encode(data.item),
        "request_id" => data.request_id,
        "securities" =>
          case(data.securities) do
            nil ->
              nil

            _ ->
              Enum.map(data.securities, fn item -> Plaid.Security.encode(item) end)
          end,
        "total_investment_transactions" => data.total_investment_transactions
      }
    end
  end

  @type bank_transfer_event_type :: binary
  defmodule(BankTransferUser) do
    @moduledoc "#{"BankTransferUser"}
    "
    defstruct(email_address: nil, legal_name: nil, routing_number: nil)

    @type t :: %__MODULE__{
            email_address: binary | nil,
            legal_name: binary,
            routing_number: binary | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, email_address} <-
          case(data["email_address"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["email_address"]}}
          end,
        {:ok, legal_name} <-
          case(data["legal_name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["legal_name"]}}
          end,
        {:ok, routing_number} <-
          case(data["routing_number"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["routing_number"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           email_address: email_address,
           legal_name: legal_name,
           routing_number: routing_number
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferUser" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "email_address" => data.email_address,
        "legal_name" => data.legal_name,
        "routing_number" => data.routing_number
      }
    end
  end

  defmodule(LoanFilter) do
    @moduledoc "#{"LoanFilter"}
    "
    defstruct(account_subtypes: nil)
    @type t :: %__MODULE__{account_subtypes: [binary]}
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_subtypes} <-
          data["account_subtypes"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with(
                {:ok, item} <-
                  case(data) do
                    x when is_binary(x) ->
                      {:ok, x}

                    x ->
                      {:error, {:decode, {:invalid_string, x}, ["AccountSubtype"]}}
                  end
              ) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok, %__MODULE__{account_subtypes: account_subtypes}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["LoanFilter" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_subtypes" =>
          case(data.account_subtypes) do
            nil ->
              nil

            _ ->
              Enum.map(data.account_subtypes, fn item -> item end)
          end
      }
    end
  end

  defmodule(IncomeVerificationPrecheckResponse) do
    @moduledoc "#{"IncomeVerificationPrecheckResponse"}
    "
    defstruct(confidence: nil, precheck_id: nil, request_id: nil)
    @type t :: %__MODULE__{confidence: binary, precheck_id: binary, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, confidence} <-
          case(data["confidence"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["confidence"]}}
          end,
        {:ok, precheck_id} <-
          case(data["precheck_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["precheck_id"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok,
         %__MODULE__{confidence: confidence, precheck_id: precheck_id, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["IncomeVerificationPrecheckResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "confidence" => data.confidence,
        "precheck_id" => data.precheck_id,
        "request_id" => data.request_id
      }
    end
  end

  defmodule(HealthIncident) do
    @moduledoc "#{"HealthIncident"}
    "
    defstruct(end_date: nil, incident_updates: nil, start_date: nil, title: nil)

    @type t :: %__MODULE__{
            end_date: binary | nil,
            incident_updates: [Plaid.IncidentUpdate.t()],
            start_date: binary,
            title: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, end_date} <-
          case(data["end_date"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["end_date"]}}
          end,
        {:ok, incident_updates} <-
          data["incident_updates"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.IncidentUpdate.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, start_date} <-
          case(data["start_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["start_date"]}}
          end,
        {:ok, title} <-
          case(data["title"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["title"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           end_date: end_date,
           incident_updates: incident_updates,
           start_date: start_date,
           title: title
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["HealthIncident" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "end_date" => data.end_date,
        "incident_updates" =>
          case(data.incident_updates) do
            nil ->
              nil

            _ ->
              Enum.map(data.incident_updates, fn item -> Plaid.IncidentUpdate.encode(item) end)
          end,
        "start_date" => data.start_date,
        "title" => data.title
      }
    end
  end

  defmodule(SandboxBankTransferFireWebhookResponse) do
    @moduledoc "#{"SandboxBankTransferFireWebhookResponse"}
    "
    defstruct(request_id: nil)
    @type t :: %__MODULE__{request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SandboxBankTransferFireWebhookResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id}
    end
  end

  defmodule(InstitutionsSearchResponse) do
    @moduledoc "#{nil}
    "
    defstruct(institutions: nil, request_id: nil)
    @type t :: %__MODULE__{institutions: [Plaid.Institution.t()], request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, institutions} <-
          data["institutions"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.Institution.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{institutions: institutions, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["InstitutionsSearchResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "institutions" =>
          case(data.institutions) do
            nil ->
              nil

            _ ->
              Enum.map(data.institutions, fn item -> Plaid.Institution.encode(item) end)
          end,
        "request_id" => data.request_id
      }
    end
  end

  @type bank_transfer_network :: binary
  defmodule(InstitutionsGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(institutions: nil, request_id: nil, total: nil)

    @type t :: %__MODULE__{
            institutions: [Plaid.Institution.t()],
            request_id: binary,
            total: integer
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, institutions} <-
          data["institutions"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.Institution.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, total} <-
          case(data["total"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["total"]}}
          end
      ) do
        {:ok, %__MODULE__{institutions: institutions, request_id: request_id, total: total}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["InstitutionsGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "institutions" =>
          case(data.institutions) do
            nil ->
              nil

            _ ->
              Enum.map(data.institutions, fn item -> Plaid.Institution.encode(item) end)
          end,
        "request_id" => data.request_id,
        "total" => data.total
      }
    end
  end

  @type asset_report_pdf_get_response :: binary
  defmodule(ItemRemoveResponse) do
    @moduledoc "#{nil}
    "
    defstruct(request_id: nil)
    @type t :: %__MODULE__{request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ItemRemoveResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id}
    end
  end

  defmodule(Employer) do
    @moduledoc "#{"Employer"}
    "
    defstruct(address: nil, confidence_score: nil, employer_id: nil, name: nil)

    @type t :: %__MODULE__{
            address: any,
            confidence_score: number,
            employer_id: binary,
            name: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, address} <- {:ok, data["address"]},
        {:ok, confidence_score} <-
          case(data["confidence_score"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["confidence_score"]}}
          end,
        {:ok, employer_id} <-
          case(data["employer_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["employer_id"]}}
          end,
        {:ok, name} <-
          case(data["name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["name"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           address: address,
           confidence_score: confidence_score,
           employer_id: employer_id,
           name: name
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Employer" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "address" => data.address,
        "confidence_score" => data.confidence_score,
        "employer_id" => data.employer_id,
        "name" => data.name
      }
    end
  end

  defmodule(AssetReportCreateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(asset_report_id: nil, asset_report_token: nil, request_id: nil)

    @type t :: %__MODULE__{
            asset_report_id: binary,
            asset_report_token: binary,
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, asset_report_id} <-
          case(data["asset_report_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["AssetReportId"]}}
          end,
        {:ok, asset_report_token} <-
          case(data["asset_report_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["AssetReportToken"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           asset_report_id: asset_report_id,
           asset_report_token: asset_report_token,
           request_id: request_id
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AssetReportCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "asset_report_id" => data.asset_report_id,
        "asset_report_token" => data.asset_report_token,
        "request_id" => data.request_id
      }
    end
  end

  defmodule(EmployersSearchResponse) do
    @moduledoc "#{"EmployersSearchResponse"}
    "
    defstruct(employers: nil, request_id: nil)
    @type t :: %__MODULE__{employers: [Plaid.Employer.t()], request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, employers} <-
          data["employers"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.Employer.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{employers: employers, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["EmployersSearchResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "employers" =>
          case(data.employers) do
            nil ->
              nil

            _ ->
              Enum.map(data.employers, fn item -> Plaid.Employer.encode(item) end)
          end,
        "request_id" => data.request_id
      }
    end
  end

  @type transfer_status :: binary
  @type bank_transfer_type :: binary
  defmodule(EmploymentDetails) do
    @moduledoc "#{"EmploymentDetails"}
    "
    defstruct(annual_salary: nil, hire_date: nil)
    @type t :: %__MODULE__{annual_salary: Plaid.Pay.t() | nil, hire_date: binary | nil}
    @doc false
    def(decode(data)) do
      with(
        {:ok, annual_salary} <- Plaid.Pay.decode(data["annual_salary"]),
        {:ok, hire_date} <-
          case(data["hire_date"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["hire_date"]}}
          end
      ) do
        {:ok, %__MODULE__{annual_salary: annual_salary, hire_date: hire_date}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["EmploymentDetails" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"annual_salary" => Plaid.Pay.encode(data.annual_salary), "hire_date" => data.hire_date}
    end
  end

  defmodule(ProcessorBankTransferCreateResponse) do
    @moduledoc "#{"ProcessorBankTransferCreateResponse"}
    "
    defstruct(bank_transfer: nil, request_id: nil)
    @type t :: %__MODULE__{bank_transfer: Plaid.BankTransfer.t(), request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, bank_transfer} <- Plaid.BankTransfer.decode(data["bank_transfer"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{bank_transfer: bank_transfer, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ProcessorBankTransferCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "bank_transfer" => Plaid.BankTransfer.encode(data.bank_transfer),
        "request_id" => data.request_id
      }
    end
  end

  defmodule(ProcessorTokenCreateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(processor_token: nil, request_id: nil)
    @type t :: %__MODULE__{processor_token: binary, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, processor_token} <-
          case(data["processor_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["processor_token"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{processor_token: processor_token, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ProcessorTokenCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"processor_token" => data.processor_token, "request_id" => data.request_id}
    end
  end

  defmodule(AssetReportGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(report: nil, request_id: nil, warnings: nil)

    @type t :: %__MODULE__{
            report: Plaid.AssetReport.t(),
            request_id: binary,
            warnings: [Plaid.Warning.t()]
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, report} <- Plaid.AssetReport.decode(data["report"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, warnings} <-
          data["warnings"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.Warning.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok, %__MODULE__{report: report, request_id: request_id, warnings: warnings}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AssetReportGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "report" => Plaid.AssetReport.encode(data.report),
        "request_id" => data.request_id,
        "warnings" =>
          case(data.warnings) do
            nil ->
              nil

            _ ->
              Enum.map(data.warnings, fn item -> Plaid.Warning.encode(item) end)
          end
      }
    end
  end

  defmodule(ProductAccess) do
    @moduledoc "#{nil}
    "
    defstruct(auth: nil, identity: nil, statements: nil, transactions: nil)

    @type t :: %__MODULE__{
            auth: boolean | nil,
            identity: boolean | nil,
            statements: boolean | nil,
            transactions: boolean | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, auth} <-
          case(data["auth"]) do
            x when is_nil(x) or is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["auth"]}}
          end,
        {:ok, identity} <-
          case(data["identity"]) do
            x when is_nil(x) or is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["identity"]}}
          end,
        {:ok, statements} <-
          case(data["statements"]) do
            x when is_nil(x) or is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["statements"]}}
          end,
        {:ok, transactions} <-
          case(data["transactions"]) do
            x when is_nil(x) or is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["transactions"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           auth: auth,
           identity: identity,
           statements: statements,
           transactions: transactions
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ProductAccess" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "auth" => data.auth,
        "identity" => data.identity,
        "statements" => data.statements,
        "transactions" => data.transactions
      }
    end
  end

  defmodule(StudentRepaymentPlan) do
    @moduledoc "#{"StudentRepaymentPlan"}
    "
    defstruct(description: nil, type: nil)
    @type t :: %__MODULE__{description: binary, type: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, description} <-
          case(data["description"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["description"]}}
          end,
        {:ok, type} <-
          case(data["type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["type"]}}
          end
      ) do
        {:ok, %__MODULE__{description: description, type: type}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["StudentRepaymentPlan" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"description" => data.description, "type" => data.type}
    end
  end

  defmodule(MortgageLiability) do
    @moduledoc "#{"MortgageLiability"}
    "
    defstruct(
      account_id: nil,
      account_number: nil,
      current_late_fee: nil,
      escrow_balance: nil,
      has_pmi: nil,
      has_prepayment_penalty: nil,
      interest_rate: nil,
      last_payment_amount: nil,
      last_payment_date: nil,
      loan_term: nil,
      loan_type_description: nil,
      maturity_date: nil,
      next_monthly_payment: nil,
      next_payment_due_date: nil,
      origination_date: nil,
      origination_principal_amount: nil,
      past_due_amount: nil,
      property_address: nil,
      ytd_interest_paid: nil,
      ytd_principal_paid: nil
    )

    @type t :: %__MODULE__{
            account_id: binary,
            account_number: binary,
            current_late_fee: number,
            escrow_balance: number,
            has_pmi: boolean,
            has_prepayment_penalty: boolean,
            interest_rate: Plaid.MortgageInterestRate.t(),
            last_payment_amount: number,
            last_payment_date: binary,
            loan_term: binary,
            loan_type_description: binary,
            maturity_date: binary,
            next_monthly_payment: number,
            next_payment_due_date: binary,
            origination_date: binary,
            origination_principal_amount: number,
            past_due_amount: number,
            property_address: Plaid.MortgagePropertyAddress.t(),
            ytd_interest_paid: number,
            ytd_principal_paid: number
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, account_number} <-
          case(data["account_number"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_number"]}}
          end,
        {:ok, current_late_fee} <-
          case(data["current_late_fee"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["current_late_fee"]}}
          end,
        {:ok, escrow_balance} <-
          case(data["escrow_balance"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["escrow_balance"]}}
          end,
        {:ok, has_pmi} <-
          case(data["has_pmi"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["has_pmi"]}}
          end,
        {:ok, has_prepayment_penalty} <-
          case(data["has_prepayment_penalty"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["has_prepayment_penalty"]}}
          end,
        {:ok, interest_rate} <- Plaid.MortgageInterestRate.decode(data["interest_rate"]),
        {:ok, last_payment_amount} <-
          case(data["last_payment_amount"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["last_payment_amount"]}}
          end,
        {:ok, last_payment_date} <-
          case(data["last_payment_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["last_payment_date"]}}
          end,
        {:ok, loan_term} <-
          case(data["loan_term"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["loan_term"]}}
          end,
        {:ok, loan_type_description} <-
          case(data["loan_type_description"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["loan_type_description"]}}
          end,
        {:ok, maturity_date} <-
          case(data["maturity_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["maturity_date"]}}
          end,
        {:ok, next_monthly_payment} <-
          case(data["next_monthly_payment"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["next_monthly_payment"]}}
          end,
        {:ok, next_payment_due_date} <-
          case(data["next_payment_due_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["next_payment_due_date"]}}
          end,
        {:ok, origination_date} <-
          case(data["origination_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["origination_date"]}}
          end,
        {:ok, origination_principal_amount} <-
          case(data["origination_principal_amount"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["origination_principal_amount"]}}
          end,
        {:ok, past_due_amount} <-
          case(data["past_due_amount"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["past_due_amount"]}}
          end,
        {:ok, property_address} <- Plaid.MortgagePropertyAddress.decode(data["property_address"]),
        {:ok, ytd_interest_paid} <-
          case(data["ytd_interest_paid"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["ytd_interest_paid"]}}
          end,
        {:ok, ytd_principal_paid} <-
          case(data["ytd_principal_paid"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["ytd_principal_paid"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           account_id: account_id,
           account_number: account_number,
           current_late_fee: current_late_fee,
           escrow_balance: escrow_balance,
           has_pmi: has_pmi,
           has_prepayment_penalty: has_prepayment_penalty,
           interest_rate: interest_rate,
           last_payment_amount: last_payment_amount,
           last_payment_date: last_payment_date,
           loan_term: loan_term,
           loan_type_description: loan_type_description,
           maturity_date: maturity_date,
           next_monthly_payment: next_monthly_payment,
           next_payment_due_date: next_payment_due_date,
           origination_date: origination_date,
           origination_principal_amount: origination_principal_amount,
           past_due_amount: past_due_amount,
           property_address: property_address,
           ytd_interest_paid: ytd_interest_paid,
           ytd_principal_paid: ytd_principal_paid
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["MortgageLiability" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_id" => data.account_id,
        "account_number" => data.account_number,
        "current_late_fee" => data.current_late_fee,
        "escrow_balance" => data.escrow_balance,
        "has_pmi" => data.has_pmi,
        "has_prepayment_penalty" => data.has_prepayment_penalty,
        "interest_rate" => Plaid.MortgageInterestRate.encode(data.interest_rate),
        "last_payment_amount" => data.last_payment_amount,
        "last_payment_date" => data.last_payment_date,
        "loan_term" => data.loan_term,
        "loan_type_description" => data.loan_type_description,
        "maturity_date" => data.maturity_date,
        "next_monthly_payment" => data.next_monthly_payment,
        "next_payment_due_date" => data.next_payment_due_date,
        "origination_date" => data.origination_date,
        "origination_principal_amount" => data.origination_principal_amount,
        "past_due_amount" => data.past_due_amount,
        "property_address" => Plaid.MortgagePropertyAddress.encode(data.property_address),
        "ytd_interest_paid" => data.ytd_interest_paid,
        "ytd_principal_paid" => data.ytd_principal_paid
      }
    end
  end

  defmodule(SignalDecisionReportResponse) do
    @moduledoc "#{"SignalDecisionReportResponse"}
    "
    defstruct(request_id: nil)
    @type t :: %__MODULE__{request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SignalDecisionReportResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id}
    end
  end

  nil

  defmodule(ItemPublicTokenCreateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(expiration: nil, public_token: nil, request_id: nil)
    @type t :: %__MODULE__{expiration: binary | nil, public_token: binary, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, expiration} <-
          case(data["expiration"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["expiration"]}}
          end,
        {:ok, public_token} <-
          case(data["public_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["public_token"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok,
         %__MODULE__{expiration: expiration, public_token: public_token, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ItemPublicTokenCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "expiration" => data.expiration,
        "public_token" => data.public_token,
        "request_id" => data.request_id
      }
    end
  end

  nil

  defmodule(TransferAuthorizationProposedTransfer) do
    @moduledoc "#{"TransferAuthorizationProposedTransfer"}
    "
    defstruct(
      account_id: nil,
      ach_class: nil,
      amount: nil,
      network: nil,
      origination_account_id: nil,
      type: nil,
      user: nil
    )

    @type t :: %__MODULE__{
            account_id: binary,
            ach_class: binary,
            amount: binary,
            network: binary,
            origination_account_id: binary,
            type: binary,
            user: Plaid.TransferUserInResponse.t()
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, ach_class} <-
          case(data["ach_class"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["ACHClass"]}}
          end,
        {:ok, amount} <-
          case(data["amount"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["TransferAmount"]}}
          end,
        {:ok, network} <-
          case(data["network"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["network"]}}
          end,
        {:ok, origination_account_id} <-
          case(data["origination_account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["origination_account_id"]}}
          end,
        {:ok, type} <-
          case(data["type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["TransferType"]}}
          end,
        {:ok, user} <- Plaid.TransferUserInResponse.decode(data["user"])
      ) do
        {:ok,
         %__MODULE__{
           account_id: account_id,
           ach_class: ach_class,
           amount: amount,
           network: network,
           origination_account_id: origination_account_id,
           type: type,
           user: user
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransferAuthorizationProposedTransfer" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_id" => data.account_id,
        "ach_class" => data.ach_class,
        "amount" => data.amount,
        "network" => data.network,
        "origination_account_id" => data.origination_account_id,
        "type" => data.type,
        "user" => Plaid.TransferUserInResponse.encode(data.user)
      }
    end
  end

  defmodule(ConnectedApplication) do
    @moduledoc "#{nil}
    "
    defstruct(
      application_id: nil,
      application_url: nil,
      created_at: nil,
      logo: nil,
      logo_url: nil,
      name: nil,
      product_data_types: nil,
      reason_for_access: nil,
      requested_scopes: nil,
      scopes: nil
    )

    @type t :: %__MODULE__{
            application_id: binary,
            application_url: binary,
            created_at: binary,
            logo: binary,
            logo_url: binary,
            name: binary,
            product_data_types: [binary],
            reason_for_access: binary,
            requested_scopes: Plaid.RequestedScopes.t() | nil,
            scopes: any | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, application_id} <-
          case(data["application_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["ApplicationID"]}}
          end,
        {:ok, application_url} <-
          case(data["application_url"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["application_url"]}}
          end,
        {:ok, created_at} <-
          case(data["created_at"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["created_at"]}}
          end,
        {:ok, logo} <-
          case(data["logo"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["logo"]}}
          end,
        {:ok, logo_url} <-
          case(data["logo_url"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["logo_url"]}}
          end,
        {:ok, name} <-
          case(data["name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["name"]}}
          end,
        {:ok, product_data_types} <-
          data["product_data_types"]
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
        {:ok, reason_for_access} <-
          case(data["reason_for_access"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["reason_for_access"]}}
          end,
        {:ok, requested_scopes} <- Plaid.RequestedScopes.decode(data["requested_scopes"]),
        {:ok, scopes} <- {:ok, data["scopes"]}
      ) do
        {:ok,
         %__MODULE__{
           application_id: application_id,
           application_url: application_url,
           created_at: created_at,
           logo: logo,
           logo_url: logo_url,
           name: name,
           product_data_types: product_data_types,
           reason_for_access: reason_for_access,
           requested_scopes: requested_scopes,
           scopes: scopes
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ConnectedApplication" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "application_id" => data.application_id,
        "application_url" => data.application_url,
        "created_at" => data.created_at,
        "logo" => data.logo,
        "logo_url" => data.logo_url,
        "name" => data.name,
        "product_data_types" =>
          case(data.product_data_types) do
            nil ->
              nil

            _ ->
              Enum.map(data.product_data_types, fn item -> item end)
          end,
        "reason_for_access" => data.reason_for_access,
        "requested_scopes" => Plaid.RequestedScopes.encode(data.requested_scopes),
        "scopes" => data.scopes
      }
    end
  end

  nil

  defmodule(DepositSwitchCreateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(deposit_switch_id: nil, request_id: nil)
    @type t :: %__MODULE__{deposit_switch_id: binary, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, deposit_switch_id} <-
          case(data["deposit_switch_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["deposit_switch_id"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{deposit_switch_id: deposit_switch_id, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["DepositSwitchCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"deposit_switch_id" => data.deposit_switch_id, "request_id" => data.request_id}
    end
  end

  defmodule(StudentLoanStatus) do
    @moduledoc "#{"StudentLoanStatus"}
    "
    defstruct(end_date: nil, type: nil)
    @type t :: %__MODULE__{end_date: binary, type: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, end_date} <-
          case(data["end_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["end_date"]}}
          end,
        {:ok, type} <-
          case(data["type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["type"]}}
          end
      ) do
        {:ok, %__MODULE__{end_date: end_date, type: type}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["StudentLoanStatus" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"end_date" => data.end_date, "type" => data.type}
    end
  end

  defmodule(IncomeVerificationRefreshResponse) do
    @moduledoc "#{nil}
    "
    defstruct(request_id: nil, verification_refresh_status: nil)
    @type t :: %__MODULE__{request_id: binary, verification_refresh_status: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, verification_refresh_status} <-
          case(data["verification_refresh_status"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["VerificationRefreshStatus"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           request_id: request_id,
           verification_refresh_status: verification_refresh_status
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["IncomeVerificationRefreshResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "request_id" => data.request_id,
        "verification_refresh_status" => data.verification_refresh_status
      }
    end
  end

  defmodule(ApplicationGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(application: nil, request_id: nil)
    @type t :: %__MODULE__{application: Plaid.Application.t(), request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, application} <- Plaid.Application.decode(data["application"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{application: application, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ApplicationGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "application" => Plaid.Application.encode(data.application),
        "request_id" => data.request_id
      }
    end
  end

  defmodule(PaymentInitiationRecipientCreateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(recipient_id: nil, request_id: nil)
    @type t :: %__MODULE__{recipient_id: binary, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, recipient_id} <-
          case(data["recipient_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["recipient_id"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{recipient_id: recipient_id, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaymentInitiationRecipientCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"recipient_id" => data.recipient_id, "request_id" => data.request_id}
    end
  end

  defmodule(SandboxItemSetVerificationStatusResponse) do
    @moduledoc "#{nil}
    "
    defstruct(request_id: nil)
    @type t :: %__MODULE__{request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SandboxItemSetVerificationStatusResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id}
    end
  end

  defmodule(BankTransferEvent) do
    @moduledoc "#{"BankTransferEvent"}
    "
    defstruct(
      account_id: nil,
      bank_transfer_amount: nil,
      bank_transfer_id: nil,
      bank_transfer_iso_currency_code: nil,
      bank_transfer_type: nil,
      direction: nil,
      event_id: nil,
      event_type: nil,
      failure_reason: nil,
      origination_account_id: nil,
      receiver_details: nil,
      timestamp: nil
    )

    @type t :: %__MODULE__{
            account_id: binary,
            bank_transfer_amount: binary,
            bank_transfer_id: binary,
            bank_transfer_iso_currency_code: binary,
            bank_transfer_type: binary,
            direction: binary,
            event_id: integer,
            event_type: binary,
            failure_reason: Plaid.BankTransferFailure.t(),
            origination_account_id: binary,
            receiver_details: Plaid.BankTransferReceiverDetails.t(),
            timestamp: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, bank_transfer_amount} <-
          case(data["bank_transfer_amount"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["bank_transfer_amount"]}}
          end,
        {:ok, bank_transfer_id} <-
          case(data["bank_transfer_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["BankTransferID"]}}
          end,
        {:ok, bank_transfer_iso_currency_code} <-
          case(data["bank_transfer_iso_currency_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["bank_transfer_iso_currency_code"]}}
          end,
        {:ok, bank_transfer_type} <-
          case(data["bank_transfer_type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["BankTransferType"]}}
          end,
        {:ok, direction} <-
          case(data["direction"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["BankTransferDirection"]}}
          end,
        {:ok, event_id} <-
          case(data["event_id"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["event_id"]}}
          end,
        {:ok, event_type} <-
          case(data["event_type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["BankTransferEventType"]}}
          end,
        {:ok, failure_reason} <- Plaid.BankTransferFailure.decode(data["failure_reason"]),
        {:ok, origination_account_id} <-
          case(data["origination_account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["origination_account_id"]}}
          end,
        {:ok, receiver_details} <-
          Plaid.BankTransferReceiverDetails.decode(data["receiver_details"]),
        {:ok, timestamp} <-
          case(data["timestamp"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["timestamp"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           account_id: account_id,
           bank_transfer_amount: bank_transfer_amount,
           bank_transfer_id: bank_transfer_id,
           bank_transfer_iso_currency_code: bank_transfer_iso_currency_code,
           bank_transfer_type: bank_transfer_type,
           direction: direction,
           event_id: event_id,
           event_type: event_type,
           failure_reason: failure_reason,
           origination_account_id: origination_account_id,
           receiver_details: receiver_details,
           timestamp: timestamp
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferEvent" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_id" => data.account_id,
        "bank_transfer_amount" => data.bank_transfer_amount,
        "bank_transfer_id" => data.bank_transfer_id,
        "bank_transfer_iso_currency_code" => data.bank_transfer_iso_currency_code,
        "bank_transfer_type" => data.bank_transfer_type,
        "direction" => data.direction,
        "event_id" => data.event_id,
        "event_type" => data.event_type,
        "failure_reason" => Plaid.BankTransferFailure.encode(data.failure_reason),
        "origination_account_id" => data.origination_account_id,
        "receiver_details" => Plaid.BankTransferReceiverDetails.encode(data.receiver_details),
        "timestamp" => data.timestamp
      }
    end
  end

  defmodule(PayPeriodDetails) do
    @moduledoc "#{"PayPeriodDetails"}
    "
    defstruct(
      check_amount: nil,
      end_date: nil,
      gross_earnings: nil,
      pay_day: nil,
      start_date: nil
    )

    @type t :: %__MODULE__{
            check_amount: number,
            end_date: binary,
            gross_earnings: number,
            pay_day: binary,
            start_date: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, check_amount} <-
          case(data["check_amount"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["check_amount"]}}
          end,
        {:ok, end_date} <-
          case(data["end_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["end_date"]}}
          end,
        {:ok, gross_earnings} <-
          case(data["gross_earnings"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["gross_earnings"]}}
          end,
        {:ok, pay_day} <-
          case(data["pay_day"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["pay_day"]}}
          end,
        {:ok, start_date} <-
          case(data["start_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["start_date"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           check_amount: check_amount,
           end_date: end_date,
           gross_earnings: gross_earnings,
           pay_day: pay_day,
           start_date: start_date
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PayPeriodDetails" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "check_amount" => data.check_amount,
        "end_date" => data.end_date,
        "gross_earnings" => data.gross_earnings,
        "pay_day" => data.pay_day,
        "start_date" => data.start_date
      }
    end
  end

  defmodule(NumbersInternational) do
    @moduledoc "#{"NumbersInternational"}
    "
    defstruct(account_id: nil, bic: nil, iban: nil)
    @type t :: %__MODULE__{account_id: binary, bic: binary, iban: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, bic} <-
          case(data["bic"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["bic"]}}
          end,
        {:ok, iban} <-
          case(data["iban"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["iban"]}}
          end
      ) do
        {:ok, %__MODULE__{account_id: account_id, bic: bic, iban: iban}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["NumbersInternational" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"account_id" => data.account_id, "bic" => data.bic, "iban" => data.iban}
    end
  end

  defmodule(BankTransferBalance) do
    @moduledoc "#{"BankTransferBalance"}
    "
    defstruct(available: nil, transactable: nil)
    @type t :: %__MODULE__{available: binary, transactable: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, available} <-
          case(data["available"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["available"]}}
          end,
        {:ok, transactable} <-
          case(data["transactable"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["transactable"]}}
          end
      ) do
        {:ok, %__MODULE__{available: available, transactable: transactable}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferBalance" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"available" => data.available, "transactable" => data.transactable}
    end
  end

  defmodule(RequestedScopes) do
    @moduledoc "#{nil}
    "
    defstruct(
      account_filters: nil,
      account_selection_cardinality: nil,
      optional_product_access: nil,
      required_product_access: nil
    )

    @type t :: %__MODULE__{
            account_filters: Plaid.AccountFilter.t() | nil,
            account_selection_cardinality: binary,
            optional_product_access: Plaid.ProductAccess.t(),
            required_product_access: Plaid.ProductAccess.t()
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_filters} <- Plaid.AccountFilter.decode(data["account_filters"]),
        {:ok, account_selection_cardinality} <-
          case(data["account_selection_cardinality"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["AccountSelectionCardinality"]}}
          end,
        {:ok, optional_product_access} <-
          Plaid.ProductAccess.decode(data["optional_product_access"]),
        {:ok, required_product_access} <-
          Plaid.ProductAccess.decode(data["required_product_access"])
      ) do
        {:ok,
         %__MODULE__{
           account_filters: account_filters,
           account_selection_cardinality: account_selection_cardinality,
           optional_product_access: optional_product_access,
           required_product_access: required_product_access
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["RequestedScopes" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_filters" => Plaid.AccountFilter.encode(data.account_filters),
        "account_selection_cardinality" => data.account_selection_cardinality,
        "optional_product_access" => Plaid.ProductAccess.encode(data.optional_product_access),
        "required_product_access" => Plaid.ProductAccess.encode(data.required_product_access)
      }
    end
  end

  defmodule(TransferAuthorizationDecisionRationale) do
    @moduledoc "#{"TransferAuthorizationDecisionRationale"}
    "
    defstruct(code: nil, description: nil)
    @type t :: %__MODULE__{code: binary, description: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, code} <-
          case(data["code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["code"]}}
          end,
        {:ok, description} <-
          case(data["description"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["description"]}}
          end
      ) do
        {:ok, %__MODULE__{code: code, description: description}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransferAuthorizationDecisionRationale" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"code" => data.code, "description" => data.description}
    end
  end

  defmodule(PaymentInitiationPaymentListResponse) do
    @moduledoc "#{nil}
    "
    defstruct(next_cursor: nil, payments: nil, request_id: nil)

    @type t :: %__MODULE__{
            next_cursor: binary,
            payments: [Plaid.PaymentInitiationPayment.t()],
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, next_cursor} <-
          case(data["next_cursor"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["next_cursor"]}}
          end,
        {:ok, payments} <-
          data["payments"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.PaymentInitiationPayment.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{next_cursor: next_cursor, payments: payments, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaymentInitiationPaymentListResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "next_cursor" => data.next_cursor,
        "payments" =>
          case(data.payments) do
            nil ->
              nil

            _ ->
              Enum.map(data.payments, fn item -> Plaid.PaymentInitiationPayment.encode(item) end)
          end,
        "request_id" => data.request_id
      }
    end
  end

  @type customer_initiated_risk_tier :: integer
  defmodule(BankTransferReceiverDetails) do
    @moduledoc "#{"BankTransferReceiverDetails"}
    "
    defstruct(available_balance: nil)
    @type t :: %__MODULE__{available_balance: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, available_balance} <-
          case(data["available_balance"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["available_balance"]}}
          end
      ) do
        {:ok, %__MODULE__{available_balance: available_balance}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferReceiverDetails" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"available_balance" => data.available_balance}
    end
  end

  defmodule(PaystubAddress) do
    @moduledoc "#{"Address"}
    "
    defstruct(
      city: nil,
      country: nil,
      line1: nil,
      line2: nil,
      postal_code: nil,
      region: nil,
      state_code: nil,
      street: nil
    )

    @type t :: %__MODULE__{
            city: binary | nil,
            country: binary | nil,
            line1: binary | nil,
            line2: binary | nil,
            postal_code: binary | nil,
            region: binary | nil,
            state_code: binary | nil,
            street: binary | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, city} <-
          case(data["city"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["city"]}}
          end,
        {:ok, country} <-
          case(data["country"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["country"]}}
          end,
        {:ok, line1} <-
          case(data["line1"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["line1"]}}
          end,
        {:ok, line2} <-
          case(data["line2"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["line2"]}}
          end,
        {:ok, postal_code} <-
          case(data["postal_code"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["postal_code"]}}
          end,
        {:ok, region} <-
          case(data["region"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["region"]}}
          end,
        {:ok, state_code} <-
          case(data["state_code"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["state_code"]}}
          end,
        {:ok, street} <-
          case(data["street"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["street"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           city: city,
           country: country,
           line1: line1,
           line2: line2,
           postal_code: postal_code,
           region: region,
           state_code: state_code,
           street: street
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaystubAddress" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "city" => data.city,
        "country" => data.country,
        "line1" => data.line1,
        "line2" => data.line2,
        "postal_code" => data.postal_code,
        "region" => data.region,
        "state_code" => data.state_code,
        "street" => data.street
      }
    end
  end

  defmodule(AccountFilterSubtypes) do
    @type t :: [binary]
    def(decode(items)) do
      items
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
    end
  end

  defmodule(InstitutionsGetByIdResponse) do
    @moduledoc "#{nil}
    "
    defstruct(institution: nil, request_id: nil)
    @type t :: %__MODULE__{institution: Plaid.Institution.t(), request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, institution} <- Plaid.Institution.decode(data["institution"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{institution: institution, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["InstitutionsGetByIdResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "institution" => Plaid.Institution.encode(data.institution),
        "request_id" => data.request_id
      }
    end
  end

  @type item_id :: binary
  defmodule(DepositoryFilter) do
    @moduledoc "#{"DepositoryFilter"}
    "
    defstruct(account_subtypes: nil)
    @type t :: %__MODULE__{account_subtypes: [binary]}
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_subtypes} <-
          data["account_subtypes"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with(
                {:ok, item} <-
                  case(data) do
                    x when is_binary(x) ->
                      {:ok, x}

                    x ->
                      {:error, {:decode, {:invalid_string, x}, ["AccountSubtype"]}}
                  end
              ) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok, %__MODULE__{account_subtypes: account_subtypes}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["DepositoryFilter" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_subtypes" =>
          case(data.account_subtypes) do
            nil ->
              nil

            _ ->
              Enum.map(data.account_subtypes, fn item -> item end)
          end
      }
    end
  end

  nil
  nil
  nil

  defmodule(TransferAuthorization) do
    @moduledoc "#{"TransferAuthorization"}
    "
    defstruct(
      created: nil,
      decision: nil,
      decision_rationale: nil,
      id: nil,
      proposed_transfer: nil
    )

    @type t :: %__MODULE__{
            created: binary,
            decision: binary,
            decision_rationale: Plaid.TransferAuthorizationDecisionRationale.t(),
            id: binary,
            proposed_transfer: Plaid.TransferAuthorizationProposedTransfer.t()
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, created} <-
          case(data["created"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["created"]}}
          end,
        {:ok, decision} <-
          case(data["decision"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["decision"]}}
          end,
        {:ok, decision_rationale} <-
          Plaid.TransferAuthorizationDecisionRationale.decode(data["decision_rationale"]),
        {:ok, id} <-
          case(data["id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["TransferAuthorizationID"]}}
          end,
        {:ok, proposed_transfer} <-
          Plaid.TransferAuthorizationProposedTransfer.decode(data["proposed_transfer"])
      ) do
        {:ok,
         %__MODULE__{
           created: created,
           decision: decision,
           decision_rationale: decision_rationale,
           id: id,
           proposed_transfer: proposed_transfer
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransferAuthorization" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "created" => data.created,
        "decision" => data.decision,
        "decision_rationale" =>
          Plaid.TransferAuthorizationDecisionRationale.encode(data.decision_rationale),
        "id" => data.id,
        "proposed_transfer" =>
          Plaid.TransferAuthorizationProposedTransfer.encode(data.proposed_transfer)
      }
    end
  end

  nil

  defmodule(CustomerInitiatedReturnRisk) do
    @moduledoc "#{"CustomerInitiatedReturnRisk"}
    "
    defstruct(risk_tier: nil, score: nil)
    @type t :: %__MODULE__{risk_tier: integer, score: integer}
    @doc false
    def(decode(data)) do
      with(
        {:ok, risk_tier} <-
          case(data["risk_tier"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["CustomerInitiatedRiskTier"]}}
          end,
        {:ok, score} <-
          case(data["score"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["SignalScore"]}}
          end
      ) do
        {:ok, %__MODULE__{risk_tier: risk_tier, score: score}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["CustomerInitiatedReturnRisk" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"risk_tier" => data.risk_tier, "score" => data.score}
    end
  end

  defmodule(InvestmentFilter) do
    @moduledoc "#{"InvestmentFilter"}
    "
    defstruct(account_subtypes: nil)
    @type t :: %__MODULE__{account_subtypes: [binary]}
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_subtypes} <-
          data["account_subtypes"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with(
                {:ok, item} <-
                  case(data) do
                    x when is_binary(x) ->
                      {:ok, x}

                    x ->
                      {:error, {:decode, {:invalid_string, x}, ["AccountSubtype"]}}
                  end
              ) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok, %__MODULE__{account_subtypes: account_subtypes}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["InvestmentFilter" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_subtypes" =>
          case(data.account_subtypes) do
            nil ->
              nil

            _ ->
              Enum.map(data.account_subtypes, fn item -> item end)
          end
      }
    end
  end

  @type transfer_event_type :: binary
  defmodule(PaystubEmployer) do
    @moduledoc "#{"Employer"}
    "
    defstruct(address: nil, name: nil)
    @type t :: %__MODULE__{address: Plaid.PaystubAddress.t() | nil, name: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, address} <- Plaid.PaystubAddress.decode(data["address"]),
        {:ok, name} <-
          case(data["name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["name"]}}
          end
      ) do
        {:ok, %__MODULE__{address: address, name: name}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaystubEmployer" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"address" => Plaid.PaystubAddress.encode(data.address), "name" => data.name}
    end
  end

  defmodule(DocumentMetadata) do
    @moduledoc "#{"DocumentMetadata"}
    "
    defstruct(doc_id: nil, name: nil, status: nil)
    @type t :: %__MODULE__{doc_id: binary | nil, name: binary | nil, status: binary | nil}
    @doc false
    def(decode(data)) do
      with(
        {:ok, doc_id} <-
          case(data["doc_id"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["doc_id"]}}
          end,
        {:ok, name} <-
          case(data["name"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["name"]}}
          end,
        {:ok, status} <-
          case(data["status"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["status"]}}
          end
      ) do
        {:ok, %__MODULE__{doc_id: doc_id, name: name, status: status}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["DocumentMetadata" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"doc_id" => data.doc_id, "name" => data.name, "status" => data.status}
    end
  end

  @type country_code :: binary
  defmodule(MortgageInterestRate) do
    @moduledoc "#{"MortgageInterestRate"}
    "
    defstruct(percentage: nil, type: nil)
    @type t :: %__MODULE__{percentage: number, type: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, percentage} <-
          case(data["percentage"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["percentage"]}}
          end,
        {:ok, type} <-
          case(data["type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["type"]}}
          end
      ) do
        {:ok, %__MODULE__{percentage: percentage, type: type}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["MortgageInterestRate" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"percentage" => data.percentage, "type" => data.type}
    end
  end

  defmodule(Paystub) do
    @moduledoc "#{"Paystub"}
    "
    defstruct(
      deductions: nil,
      doc_id: nil,
      earnings: nil,
      employee: nil,
      employer: nil,
      employment_details: nil,
      income_breakdown: nil,
      net_pay: nil,
      pay_period_details: nil,
      paystub_details: nil,
      ytd_earnings: nil
    )

    @type t :: %__MODULE__{
            deductions: Plaid.Deductions.t() | nil,
            doc_id: binary | nil,
            earnings: Plaid.Earnings.t() | nil,
            employee: Plaid.Employee.t(),
            employer: Plaid.PaystubEmployer.t(),
            employment_details: Plaid.EmploymentDetails.t() | nil,
            income_breakdown: [Plaid.IncomeBreakdown.t()],
            net_pay: Plaid.NetPay.t() | nil,
            pay_period_details: Plaid.PayPeriodDetails.t(),
            paystub_details: Plaid.PaystubDetails.t() | nil,
            ytd_earnings: Plaid.PaystubYTDDetails.t()
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, deductions} <- Plaid.Deductions.decode(data["deductions"]),
        {:ok, doc_id} <-
          case(data["doc_id"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["doc_id"]}}
          end,
        {:ok, earnings} <- Plaid.Earnings.decode(data["earnings"]),
        {:ok, employee} <- Plaid.Employee.decode(data["employee"]),
        {:ok, employer} <- Plaid.PaystubEmployer.decode(data["employer"]),
        {:ok, employment_details} <- Plaid.EmploymentDetails.decode(data["employment_details"]),
        {:ok, income_breakdown} <-
          data["income_breakdown"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.IncomeBreakdown.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, net_pay} <- Plaid.NetPay.decode(data["net_pay"]),
        {:ok, pay_period_details} <- Plaid.PayPeriodDetails.decode(data["pay_period_details"]),
        {:ok, paystub_details} <- Plaid.PaystubDetails.decode(data["paystub_details"]),
        {:ok, ytd_earnings} <- Plaid.PaystubYTDDetails.decode(data["ytd_earnings"])
      ) do
        {:ok,
         %__MODULE__{
           deductions: deductions,
           doc_id: doc_id,
           earnings: earnings,
           employee: employee,
           employer: employer,
           employment_details: employment_details,
           income_breakdown: income_breakdown,
           net_pay: net_pay,
           pay_period_details: pay_period_details,
           paystub_details: paystub_details,
           ytd_earnings: ytd_earnings
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Paystub" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "deductions" => Plaid.Deductions.encode(data.deductions),
        "doc_id" => data.doc_id,
        "earnings" => Plaid.Earnings.encode(data.earnings),
        "employee" => Plaid.Employee.encode(data.employee),
        "employer" => Plaid.PaystubEmployer.encode(data.employer),
        "employment_details" => Plaid.EmploymentDetails.encode(data.employment_details),
        "income_breakdown" =>
          case(data.income_breakdown) do
            nil ->
              nil

            _ ->
              Enum.map(data.income_breakdown, fn item -> Plaid.IncomeBreakdown.encode(item) end)
          end,
        "net_pay" => Plaid.NetPay.encode(data.net_pay),
        "pay_period_details" => Plaid.PayPeriodDetails.encode(data.pay_period_details),
        "paystub_details" => Plaid.PaystubDetails.encode(data.paystub_details),
        "ytd_earnings" => Plaid.PaystubYTDDetails.encode(data.ytd_earnings)
      }
    end
  end

  defmodule(Total) do
    @moduledoc "#{"Total"}
    "
    defstruct(canonical_description: nil, current_pay: nil, description: nil, ytd_pay: nil)

    @type t :: %__MODULE__{
            canonical_description: binary | nil,
            current_pay: Plaid.Pay.t() | nil,
            description: binary | nil,
            ytd_pay: Plaid.Pay.t() | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, canonical_description} <-
          case(data["canonical_description"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["canonical_description"]}}
          end,
        {:ok, current_pay} <- Plaid.Pay.decode(data["current_pay"]),
        {:ok, description} <-
          case(data["description"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["description"]}}
          end,
        {:ok, ytd_pay} <- Plaid.Pay.decode(data["ytd_pay"])
      ) do
        {:ok,
         %__MODULE__{
           canonical_description: canonical_description,
           current_pay: current_pay,
           description: description,
           ytd_pay: ytd_pay
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Total" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "canonical_description" => data.canonical_description,
        "current_pay" => Plaid.Pay.encode(data.current_pay),
        "description" => data.description,
        "ytd_pay" => Plaid.Pay.encode(data.ytd_pay)
      }
    end
  end

  defmodule(BankTransferSweepGetResponse) do
    @moduledoc "#{"BankTransferSweepGetResponse"}
    "
    defstruct(request_id: nil, sweep: nil)
    @type t :: %__MODULE__{request_id: binary, sweep: Plaid.BankTransferSweep.t()}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, sweep} <- Plaid.BankTransferSweep.decode(data["sweep"])
      ) do
        {:ok, %__MODULE__{request_id: request_id, sweep: sweep}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferSweepGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id, "sweep" => Plaid.BankTransferSweep.encode(data.sweep)}
    end
  end

  defmodule(EarningsTotal) do
    @moduledoc "#{"EarningsTotal"}
    "
    defstruct(
      canonical_description: nil,
      current_hours: nil,
      current_pay: nil,
      current_rate: nil,
      description: nil,
      ytd_pay: nil
    )

    @type t :: %__MODULE__{
            canonical_description: binary | nil,
            current_hours: binary | nil,
            current_pay: Plaid.Pay.t() | nil,
            current_rate: binary | nil,
            description: binary | nil,
            ytd_pay: Plaid.Pay.t() | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, canonical_description} <-
          case(data["canonical_description"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["canonical_description"]}}
          end,
        {:ok, current_hours} <-
          case(data["current_hours"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["current_hours"]}}
          end,
        {:ok, current_pay} <- Plaid.Pay.decode(data["current_pay"]),
        {:ok, current_rate} <-
          case(data["current_rate"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["current_rate"]}}
          end,
        {:ok, description} <-
          case(data["description"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["description"]}}
          end,
        {:ok, ytd_pay} <- Plaid.Pay.decode(data["ytd_pay"])
      ) do
        {:ok,
         %__MODULE__{
           canonical_description: canonical_description,
           current_hours: current_hours,
           current_pay: current_pay,
           current_rate: current_rate,
           description: description,
           ytd_pay: ytd_pay
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["EarningsTotal" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "canonical_description" => data.canonical_description,
        "current_hours" => data.current_hours,
        "current_pay" => Plaid.Pay.encode(data.current_pay),
        "current_rate" => data.current_rate,
        "description" => data.description,
        "ytd_pay" => Plaid.Pay.encode(data.ytd_pay)
      }
    end
  end

  defmodule(BankTransferListResponse) do
    @moduledoc "#{"BankTransferListResponse"}
    "
    defstruct(bank_transfers: nil, request_id: nil)
    @type t :: %__MODULE__{bank_transfers: [Plaid.BankTransfer.t()], request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, bank_transfers} <-
          data["bank_transfers"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.BankTransfer.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{bank_transfers: bank_transfers, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferListResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "bank_transfers" =>
          case(data.bank_transfers) do
            nil ->
              nil

            _ ->
              Enum.map(data.bank_transfers, fn item -> Plaid.BankTransfer.encode(item) end)
          end,
        "request_id" => data.request_id
      }
    end
  end

  @type bank_transfer_amount :: binary
  defmodule(AccountBalance) do
    @moduledoc "#{"AccountBalance"}
    "
    defstruct(
      available: nil,
      current: nil,
      iso_currency_code: nil,
      last_updated_datetime: nil,
      limit: nil,
      unofficial_currency_code: nil
    )

    @type t :: %__MODULE__{
            available: number,
            current: number,
            iso_currency_code: binary,
            last_updated_datetime: binary | nil,
            limit: number,
            unofficial_currency_code: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, available} <-
          case(data["available"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["available"]}}
          end,
        {:ok, current} <-
          case(data["current"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["current"]}}
          end,
        {:ok, iso_currency_code} <-
          case(data["iso_currency_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["iso_currency_code"]}}
          end,
        {:ok, last_updated_datetime} <-
          case(data["last_updated_datetime"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["last_updated_datetime"]}}
          end,
        {:ok, limit} <-
          case(data["limit"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["limit"]}}
          end,
        {:ok, unofficial_currency_code} <-
          case(data["unofficial_currency_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["unofficial_currency_code"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           available: available,
           current: current,
           iso_currency_code: iso_currency_code,
           last_updated_datetime: last_updated_datetime,
           limit: limit,
           unofficial_currency_code: unofficial_currency_code
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AccountBalance" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "available" => data.available,
        "current" => data.current,
        "iso_currency_code" => data.iso_currency_code,
        "last_updated_datetime" => data.last_updated_datetime,
        "limit" => data.limit,
        "unofficial_currency_code" => data.unofficial_currency_code
      }
    end
  end

  defmodule(AssetReport) do
    @moduledoc "#{"AssetReport"}
    "
    defstruct(
      asset_report_id: nil,
      client_report_id: nil,
      date_generated: nil,
      days_requested: nil,
      items: nil,
      user: nil
    )

    @type t :: %__MODULE__{
            asset_report_id: binary,
            client_report_id: binary,
            date_generated: binary,
            days_requested: number,
            items: [Plaid.AssetReportItem.t()],
            user: Plaid.AssetReportUser.t()
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, asset_report_id} <-
          case(data["asset_report_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["AssetReportId"]}}
          end,
        {:ok, client_report_id} <-
          case(data["client_report_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["client_report_id"]}}
          end,
        {:ok, date_generated} <-
          case(data["date_generated"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["date_generated"]}}
          end,
        {:ok, days_requested} <-
          case(data["days_requested"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["days_requested"]}}
          end,
        {:ok, items} <-
          data["items"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.AssetReportItem.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, user} <- Plaid.AssetReportUser.decode(data["user"])
      ) do
        {:ok,
         %__MODULE__{
           asset_report_id: asset_report_id,
           client_report_id: client_report_id,
           date_generated: date_generated,
           days_requested: days_requested,
           items: items,
           user: user
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AssetReport" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "asset_report_id" => data.asset_report_id,
        "client_report_id" => data.client_report_id,
        "date_generated" => data.date_generated,
        "days_requested" => data.days_requested,
        "items" =>
          case(data.items) do
            nil ->
              nil

            _ ->
              Enum.map(data.items, fn item -> Plaid.AssetReportItem.encode(item) end)
          end,
        "user" => Plaid.AssetReportUser.encode(data.user)
      }
    end
  end

  defmodule(TransferGetResponse) do
    @moduledoc "#{"TransferGetResponse"}
    "
    defstruct(request_id: nil, transfer: nil)
    @type t :: %__MODULE__{request_id: binary, transfer: Plaid.Transfer.t()}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, transfer} <- Plaid.Transfer.decode(data["transfer"])
      ) do
        {:ok, %__MODULE__{request_id: request_id, transfer: transfer}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransferGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id, "transfer" => Plaid.Transfer.encode(data.transfer)}
    end
  end

  defmodule(NumbersACH) do
    @moduledoc "#{"NumbersACH"}
    "
    defstruct(account: nil, account_id: nil, routing: nil, wire_routing: nil)

    @type t :: %__MODULE__{
            account: binary,
            account_id: binary,
            routing: binary,
            wire_routing: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account} <-
          case(data["account"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account"]}}
          end,
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, routing} <-
          case(data["routing"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["routing"]}}
          end,
        {:ok, wire_routing} <-
          case(data["wire_routing"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["wire_routing"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           account: account,
           account_id: account_id,
           routing: routing,
           wire_routing: wire_routing
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["NumbersACH" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account" => data.account,
        "account_id" => data.account_id,
        "routing" => data.routing,
        "wire_routing" => data.wire_routing
      }
    end
  end

  @type transfer_authorization_id :: binary
  @type account_type :: binary
  defmodule(TransferListResponse) do
    @moduledoc "#{"TransferListResponse"}
    "
    defstruct(request_id: nil, transfers: nil)
    @type t :: %__MODULE__{request_id: binary, transfers: [Plaid.Transfer.t()]}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, transfers} <-
          data["transfers"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.Transfer.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok, %__MODULE__{request_id: request_id, transfers: transfers}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransferListResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "request_id" => data.request_id,
        "transfers" =>
          case(data.transfers) do
            nil ->
              nil

            _ ->
              Enum.map(data.transfers, fn item -> Plaid.Transfer.encode(item) end)
          end
      }
    end
  end

  defmodule(SandboxPublicTokenCreateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(public_token: nil, request_id: nil)
    @type t :: %__MODULE__{public_token: binary, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, public_token} <-
          case(data["public_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["public_token"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{public_token: public_token, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SandboxPublicTokenCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"public_token" => data.public_token, "request_id" => data.request_id}
    end
  end

  defmodule(AuthGetNumbers) do
    @moduledoc "#{nil}
    "
    defstruct(ach: nil, bacs: nil, eft: nil, international: nil)

    @type t :: %__MODULE__{
            ach: [Plaid.NumbersACH.t()],
            bacs: [Plaid.NumbersBACS.t()],
            eft: [Plaid.NumbersEFT.t()],
            international: [Plaid.NumbersInternational.t()]
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, ach} <-
          data["ach"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.NumbersACH.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, bacs} <-
          data["bacs"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.NumbersBACS.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, eft} <-
          data["eft"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.NumbersEFT.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, international} <-
          data["international"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.NumbersInternational.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok, %__MODULE__{ach: ach, bacs: bacs, eft: eft, international: international}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AuthGetNumbers" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "ach" =>
          case(data.ach) do
            nil ->
              nil

            _ ->
              Enum.map(data.ach, fn item -> Plaid.NumbersACH.encode(item) end)
          end,
        "bacs" =>
          case(data.bacs) do
            nil ->
              nil

            _ ->
              Enum.map(data.bacs, fn item -> Plaid.NumbersBACS.encode(item) end)
          end,
        "eft" =>
          case(data.eft) do
            nil ->
              nil

            _ ->
              Enum.map(data.eft, fn item -> Plaid.NumbersEFT.encode(item) end)
          end,
        "international" =>
          case(data.international) do
            nil ->
              nil

            _ ->
              Enum.map(data.international, fn item -> Plaid.NumbersInternational.encode(item) end)
          end
      }
    end
  end

  @type asset_report_token :: binary
  defmodule(BankTransferEventListResponse) do
    @moduledoc "#{"BankTransferEventListResponse"}
    "
    defstruct(bank_transfer_events: nil, request_id: nil)

    @type t :: %__MODULE__{
            bank_transfer_events: [Plaid.BankTransferEvent.t()],
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, bank_transfer_events} <-
          data["bank_transfer_events"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.BankTransferEvent.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{bank_transfer_events: bank_transfer_events, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferEventListResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "bank_transfer_events" =>
          case(data.bank_transfer_events) do
            nil ->
              nil

            _ ->
              Enum.map(data.bank_transfer_events, fn item ->
                Plaid.BankTransferEvent.encode(item)
              end)
          end,
        "request_id" => data.request_id
      }
    end
  end

  defmodule(BankTransferSweepAccount) do
    @moduledoc "#{"BankTransferSweepAccount"}
    "
    defstruct(account_number: nil, routing_number: nil)
    @type t :: %__MODULE__{account_number: binary, routing_number: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_number} <-
          case(data["account_number"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_number"]}}
          end,
        {:ok, routing_number} <-
          case(data["routing_number"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["routing_number"]}}
          end
      ) do
        {:ok, %__MODULE__{account_number: account_number, routing_number: routing_number}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferSweepAccount" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"account_number" => data.account_number, "routing_number" => data.routing_number}
    end
  end

  defmodule(BankInitiatedReturnRisk) do
    @moduledoc "#{"BankInitiatedReturnRisk"}
    "
    defstruct(risk_tier: nil, score: nil)
    @type t :: %__MODULE__{risk_tier: integer, score: integer}
    @doc false
    def(decode(data)) do
      with(
        {:ok, risk_tier} <-
          case(data["risk_tier"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["BankInitiatedRiskTier"]}}
          end,
        {:ok, score} <-
          case(data["score"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["SignalScore"]}}
          end
      ) do
        {:ok, %__MODULE__{risk_tier: risk_tier, score: score}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankInitiatedReturnRisk" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"risk_tier" => data.risk_tier, "score" => data.score}
    end
  end

  defmodule(ItemGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(item: nil, request_id: nil, status: nil)
    @type t :: %__MODULE__{item: Plaid.Item.t(), request_id: binary, status: any | nil}
    @doc false
    def(decode(data)) do
      with(
        {:ok, item} <- Plaid.Item.decode(data["item"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, status} <- {:ok, data["status"]}
      ) do
        {:ok, %__MODULE__{item: item, request_id: request_id, status: status}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ItemGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "item" => Plaid.Item.encode(data.item),
        "request_id" => data.request_id,
        "status" => data.status
      }
    end
  end

  defmodule(SandboxItemResetLoginResponse) do
    @moduledoc "#{nil}
    "
    defstruct(request_id: nil, reset_login: nil)
    @type t :: %__MODULE__{request_id: binary, reset_login: boolean}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, reset_login} <-
          case(data["reset_login"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["reset_login"]}}
          end
      ) do
        {:ok, %__MODULE__{request_id: request_id, reset_login: reset_login}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SandboxItemResetLoginResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id, "reset_login" => data.reset_login}
    end
  end

  nil

  defmodule(SandboxItemFireWebhookResponse) do
    @moduledoc "#{nil}
    "
    defstruct(request_id: nil, webhook_fired: nil)
    @type t :: %__MODULE__{request_id: binary, webhook_fired: boolean}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, webhook_fired} <-
          case(data["webhook_fired"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["webhook_fired"]}}
          end
      ) do
        {:ok, %__MODULE__{request_id: request_id, webhook_fired: webhook_fired}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SandboxItemFireWebhookResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id, "webhook_fired" => data.webhook_fired}
    end
  end

  defmodule(PaymentInitiationRecipient) do
    @moduledoc "#{"PaymentInitiationRecipient"}
    "
    defstruct(
      address: nil,
      bacs: nil,
      emi_recipient_id: nil,
      iban: nil,
      name: nil,
      recipient_id: nil
    )

    @type t :: %__MODULE__{
            address: Plaid.PaymentInitiationAddress.t() | nil,
            bacs: any | nil,
            emi_recipient_id: binary | nil,
            iban: binary | nil,
            name: binary,
            recipient_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, address} <- Plaid.PaymentInitiationAddress.decode(data["address"]),
        {:ok, bacs} <- {:ok, data["bacs"]},
        {:ok, emi_recipient_id} <-
          case(data["emi_recipient_id"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["emi_recipient_id"]}}
          end,
        {:ok, iban} <-
          case(data["iban"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["iban"]}}
          end,
        {:ok, name} <-
          case(data["name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["name"]}}
          end,
        {:ok, recipient_id} <-
          case(data["recipient_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["recipient_id"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           address: address,
           bacs: bacs,
           emi_recipient_id: emi_recipient_id,
           iban: iban,
           name: name,
           recipient_id: recipient_id
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaymentInitiationRecipient" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "address" => Plaid.PaymentInitiationAddress.encode(data.address),
        "bacs" => data.bacs,
        "emi_recipient_id" => data.emi_recipient_id,
        "iban" => data.iban,
        "name" => data.name,
        "recipient_id" => data.recipient_id
      }
    end
  end

  defmodule(AccountsGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(accounts: nil, item: nil, request_id: nil)

    @type t :: %__MODULE__{
            accounts: [Plaid.AccountBase.t()],
            item: Plaid.Item.t(),
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, accounts} <-
          data["accounts"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.AccountBase.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, item} <- Plaid.Item.decode(data["item"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{accounts: accounts, item: item, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AccountsGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "accounts" =>
          case(data.accounts) do
            nil ->
              nil

            _ ->
              Enum.map(data.accounts, fn item -> Plaid.AccountBase.encode(item) end)
          end,
        "item" => Plaid.Item.encode(data.item),
        "request_id" => data.request_id
      }
    end
  end

  defmodule(TransferMetadata) do
    @moduledoc "#{"TransferMetadata"}
    "
    defstruct([])
    @type t :: %__MODULE__{}
    @doc false
    def(decode(_)) do
      {:ok, %__MODULE__{}}
    end

    @doc false
    def(encode(_)) do
      %{}
    end
  end

  defmodule(BankTransferMetadata) do
    @moduledoc "#{"BankTransferMetadata"}
    "
    defstruct([])
    @type t :: %__MODULE__{}
    @doc false
    def(decode(_)) do
      {:ok, %__MODULE__{}}
    end

    @doc false
    def(encode(_)) do
      %{}
    end
  end

  @type asset_report_id :: binary
  defmodule(ItemAccessTokenInvalidateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(new_access_token: nil, request_id: nil)
    @type t :: %__MODULE__{new_access_token: binary, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, new_access_token} <-
          case(data["new_access_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["AccessToken"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{new_access_token: new_access_token, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ItemAccessTokenInvalidateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"new_access_token" => data.new_access_token, "request_id" => data.request_id}
    end
  end

  nil

  defmodule(PaymentInitiationAddress) do
    @moduledoc "#{"PaymentInitiationAddress"}
    "
    defstruct(city: nil, country: nil, postal_code: nil, street: nil)
    @type t :: %__MODULE__{city: binary, country: binary, postal_code: binary, street: [binary]}
    @doc false
    def(decode(data)) do
      with(
        {:ok, city} <-
          case(data["city"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["city"]}}
          end,
        {:ok, country} <-
          case(data["country"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["country"]}}
          end,
        {:ok, postal_code} <-
          case(data["postal_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["postal_code"]}}
          end,
        {:ok, street} <-
          data["street"]
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
        {:ok, %__MODULE__{city: city, country: country, postal_code: postal_code, street: street}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaymentInitiationAddress" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "city" => data.city,
        "country" => data.country,
        "postal_code" => data.postal_code,
        "street" =>
          case(data.street) do
            nil ->
              nil

            _ ->
              Enum.map(data.street, fn item -> item end)
          end
      }
    end
  end

  defmodule(Warning) do
    @moduledoc "#{"Warning"}
    "
    defstruct(cause: nil, warning_code: nil, warning_type: nil)
    @type t :: %__MODULE__{cause: Plaid.Cause.t(), warning_code: binary, warning_type: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, cause} <- Plaid.Cause.decode(data["cause"]),
        {:ok, warning_code} <-
          case(data["warning_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["warning_code"]}}
          end,
        {:ok, warning_type} <-
          case(data["warning_type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["warning_type"]}}
          end
      ) do
        {:ok, %__MODULE__{cause: cause, warning_code: warning_code, warning_type: warning_type}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Warning" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "cause" => Plaid.Cause.encode(data.cause),
        "warning_code" => data.warning_code,
        "warning_type" => data.warning_type
      }
    end
  end

  defmodule(InstitutionStatus) do
    @moduledoc "#{"InstitutionStatus"}
    "
    defstruct(
      auth: nil,
      balance: nil,
      health_incidents: nil,
      identity: nil,
      investments: nil,
      investments_updates: nil,
      item_logins: nil,
      liabilities: nil,
      liabilities_updates: nil,
      transactions_updates: nil
    )

    @type t :: %__MODULE__{
            auth: Plaid.ProductStatus.t(),
            balance: Plaid.ProductStatus.t(),
            health_incidents: [Plaid.HealthIncident.t()] | nil,
            identity: Plaid.ProductStatus.t(),
            investments: Plaid.ProductStatus.t() | nil,
            investments_updates: Plaid.ProductStatus.t(),
            item_logins: Plaid.ProductStatus.t(),
            liabilities: Plaid.ProductStatus.t() | nil,
            liabilities_updates: Plaid.ProductStatus.t() | nil,
            transactions_updates: Plaid.ProductStatus.t()
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, auth} <- Plaid.ProductStatus.decode(data["auth"]),
        {:ok, balance} <- Plaid.ProductStatus.decode(data["balance"]),
        {:ok, health_incidents} <-
          case(data["health_incidents"]) do
            nil ->
              nil

            _ ->
              data["health_incidents"]
              |> Enum.reverse()
              |> Enum.reduce({:ok, []}, fn
                data, {:ok, items} ->
                  with({:ok, item} <- Plaid.HealthIncident.decode(data)) do
                    {:ok, [item | items]}
                  end

                _, error ->
                  error
              end)
          end,
        {:ok, identity} <- Plaid.ProductStatus.decode(data["identity"]),
        {:ok, investments} <- Plaid.ProductStatus.decode(data["investments"]),
        {:ok, investments_updates} <- Plaid.ProductStatus.decode(data["investments_updates"]),
        {:ok, item_logins} <- Plaid.ProductStatus.decode(data["item_logins"]),
        {:ok, liabilities} <- Plaid.ProductStatus.decode(data["liabilities"]),
        {:ok, liabilities_updates} <- Plaid.ProductStatus.decode(data["liabilities_updates"]),
        {:ok, transactions_updates} <- Plaid.ProductStatus.decode(data["transactions_updates"])
      ) do
        {:ok,
         %__MODULE__{
           auth: auth,
           balance: balance,
           health_incidents: health_incidents,
           identity: identity,
           investments: investments,
           investments_updates: investments_updates,
           item_logins: item_logins,
           liabilities: liabilities,
           liabilities_updates: liabilities_updates,
           transactions_updates: transactions_updates
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["InstitutionStatus" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "auth" => Plaid.ProductStatus.encode(data.auth),
        "balance" => Plaid.ProductStatus.encode(data.balance),
        "health_incidents" =>
          case(data.health_incidents) do
            nil ->
              nil

            _ ->
              Enum.map(data.health_incidents, fn item -> Plaid.HealthIncident.encode(item) end)
          end,
        "identity" => Plaid.ProductStatus.encode(data.identity),
        "investments" => Plaid.ProductStatus.encode(data.investments),
        "investments_updates" => Plaid.ProductStatus.encode(data.investments_updates),
        "item_logins" => Plaid.ProductStatus.encode(data.item_logins),
        "liabilities" => Plaid.ProductStatus.encode(data.liabilities),
        "liabilities_updates" => Plaid.ProductStatus.encode(data.liabilities_updates),
        "transactions_updates" => Plaid.ProductStatus.encode(data.transactions_updates)
      }
    end
  end

  defmodule(W2) do
    @moduledoc "#{"W2"}
    "
    defstruct(
      allocated_tips: nil,
      box_12: nil,
      box_9: nil,
      dependent_care_benefits: nil,
      employee: nil,
      employer: nil,
      employer_id_number: nil,
      federal_income_tax_withheld: nil,
      medicare_tax_withheld: nil,
      medicare_wages_and_tips: nil,
      nonqualified_plans: nil,
      other: nil,
      retirement_plan: nil,
      social_security_tax_withheld: nil,
      social_security_tips: nil,
      social_security_wages: nil,
      state_and_local_wages: nil,
      statutory_employee: nil,
      tax_year: nil,
      third_party_sick_pay: nil,
      wages_tips_other_comp: nil
    )

    @type t :: %__MODULE__{
            allocated_tips: binary | nil,
            box_12: [Plaid.W2Box12.t()] | nil,
            box_9: binary | nil,
            dependent_care_benefits: binary | nil,
            employee: Plaid.Employee.t() | nil,
            employer: Plaid.PaystubEmployer.t() | nil,
            employer_id_number: binary | nil,
            federal_income_tax_withheld: binary | nil,
            medicare_tax_withheld: binary | nil,
            medicare_wages_and_tips: binary | nil,
            nonqualified_plans: binary | nil,
            other: binary | nil,
            retirement_plan: binary | nil,
            social_security_tax_withheld: binary | nil,
            social_security_tips: binary | nil,
            social_security_wages: binary | nil,
            state_and_local_wages: [Plaid.W2StateAndLocalWages.t()] | nil,
            statutory_employee: binary | nil,
            tax_year: binary | nil,
            third_party_sick_pay: binary | nil,
            wages_tips_other_comp: binary | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, allocated_tips} <-
          case(data["allocated_tips"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["allocated_tips"]}}
          end,
        {:ok, box_12} <-
          case(data["box_12"]) do
            nil ->
              nil

            _ ->
              data["box_12"]
              |> Enum.reverse()
              |> Enum.reduce({:ok, []}, fn
                data, {:ok, items} ->
                  with({:ok, item} <- Plaid.W2Box12.decode(data)) do
                    {:ok, [item | items]}
                  end

                _, error ->
                  error
              end)
          end,
        {:ok, box_9} <-
          case(data["box_9"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["box_9"]}}
          end,
        {:ok, dependent_care_benefits} <-
          case(data["dependent_care_benefits"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["dependent_care_benefits"]}}
          end,
        {:ok, employee} <- Plaid.Employee.decode(data["employee"]),
        {:ok, employer} <- Plaid.PaystubEmployer.decode(data["employer"]),
        {:ok, employer_id_number} <-
          case(data["employer_id_number"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["employer_id_number"]}}
          end,
        {:ok, federal_income_tax_withheld} <-
          case(data["federal_income_tax_withheld"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["federal_income_tax_withheld"]}}
          end,
        {:ok, medicare_tax_withheld} <-
          case(data["medicare_tax_withheld"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["medicare_tax_withheld"]}}
          end,
        {:ok, medicare_wages_and_tips} <-
          case(data["medicare_wages_and_tips"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["medicare_wages_and_tips"]}}
          end,
        {:ok, nonqualified_plans} <-
          case(data["nonqualified_plans"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["nonqualified_plans"]}}
          end,
        {:ok, other} <-
          case(data["other"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["other"]}}
          end,
        {:ok, retirement_plan} <-
          case(data["retirement_plan"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["retirement_plan"]}}
          end,
        {:ok, social_security_tax_withheld} <-
          case(data["social_security_tax_withheld"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["social_security_tax_withheld"]}}
          end,
        {:ok, social_security_tips} <-
          case(data["social_security_tips"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["social_security_tips"]}}
          end,
        {:ok, social_security_wages} <-
          case(data["social_security_wages"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["social_security_wages"]}}
          end,
        {:ok, state_and_local_wages} <-
          case(data["state_and_local_wages"]) do
            nil ->
              nil

            _ ->
              data["state_and_local_wages"]
              |> Enum.reverse()
              |> Enum.reduce({:ok, []}, fn
                data, {:ok, items} ->
                  with({:ok, item} <- Plaid.W2StateAndLocalWages.decode(data)) do
                    {:ok, [item | items]}
                  end

                _, error ->
                  error
              end)
          end,
        {:ok, statutory_employee} <-
          case(data["statutory_employee"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["statutory_employee"]}}
          end,
        {:ok, tax_year} <-
          case(data["tax_year"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["tax_year"]}}
          end,
        {:ok, third_party_sick_pay} <-
          case(data["third_party_sick_pay"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["third_party_sick_pay"]}}
          end,
        {:ok, wages_tips_other_comp} <-
          case(data["wages_tips_other_comp"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["wages_tips_other_comp"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           allocated_tips: allocated_tips,
           box_12: box_12,
           box_9: box_9,
           dependent_care_benefits: dependent_care_benefits,
           employee: employee,
           employer: employer,
           employer_id_number: employer_id_number,
           federal_income_tax_withheld: federal_income_tax_withheld,
           medicare_tax_withheld: medicare_tax_withheld,
           medicare_wages_and_tips: medicare_wages_and_tips,
           nonqualified_plans: nonqualified_plans,
           other: other,
           retirement_plan: retirement_plan,
           social_security_tax_withheld: social_security_tax_withheld,
           social_security_tips: social_security_tips,
           social_security_wages: social_security_wages,
           state_and_local_wages: state_and_local_wages,
           statutory_employee: statutory_employee,
           tax_year: tax_year,
           third_party_sick_pay: third_party_sick_pay,
           wages_tips_other_comp: wages_tips_other_comp
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["W2" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "allocated_tips" => data.allocated_tips,
        "box_12" =>
          case(data.box_12) do
            nil ->
              nil

            _ ->
              Enum.map(data.box_12, fn item -> Plaid.W2Box12.encode(item) end)
          end,
        "box_9" => data.box_9,
        "dependent_care_benefits" => data.dependent_care_benefits,
        "employee" => Plaid.Employee.encode(data.employee),
        "employer" => Plaid.PaystubEmployer.encode(data.employer),
        "employer_id_number" => data.employer_id_number,
        "federal_income_tax_withheld" => data.federal_income_tax_withheld,
        "medicare_tax_withheld" => data.medicare_tax_withheld,
        "medicare_wages_and_tips" => data.medicare_wages_and_tips,
        "nonqualified_plans" => data.nonqualified_plans,
        "other" => data.other,
        "retirement_plan" => data.retirement_plan,
        "social_security_tax_withheld" => data.social_security_tax_withheld,
        "social_security_tips" => data.social_security_tips,
        "social_security_wages" => data.social_security_wages,
        "state_and_local_wages" =>
          case(data.state_and_local_wages) do
            nil ->
              nil

            _ ->
              Enum.map(data.state_and_local_wages, fn item ->
                Plaid.W2StateAndLocalWages.encode(item)
              end)
          end,
        "statutory_employee" => data.statutory_employee,
        "tax_year" => data.tax_year,
        "third_party_sick_pay" => data.third_party_sick_pay,
        "wages_tips_other_comp" => data.wages_tips_other_comp
      }
    end
  end

  defmodule(Application) do
    @moduledoc "#{nil}
    "
    defstruct(
      application_id: nil,
      application_url: nil,
      created_at: nil,
      logo_url: nil,
      name: nil,
      reason_for_access: nil
    )

    @type t :: %__MODULE__{
            application_id: binary,
            application_url: binary,
            created_at: binary,
            logo_url: binary,
            name: binary,
            reason_for_access: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, application_id} <-
          case(data["application_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["ApplicationID"]}}
          end,
        {:ok, application_url} <-
          case(data["application_url"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["application_url"]}}
          end,
        {:ok, created_at} <-
          case(data["created_at"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["created_at"]}}
          end,
        {:ok, logo_url} <-
          case(data["logo_url"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["logo_url"]}}
          end,
        {:ok, name} <-
          case(data["name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["name"]}}
          end,
        {:ok, reason_for_access} <-
          case(data["reason_for_access"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["reason_for_access"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           application_id: application_id,
           application_url: application_url,
           created_at: created_at,
           logo_url: logo_url,
           name: name,
           reason_for_access: reason_for_access
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Application" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "application_id" => data.application_id,
        "application_url" => data.application_url,
        "created_at" => data.created_at,
        "logo_url" => data.logo_url,
        "name" => data.name,
        "reason_for_access" => data.reason_for_access
      }
    end
  end

  @type verification_status :: binary
  defmodule(TransactionData) do
    @moduledoc "#{"TransactionData"}
    "
    defstruct(account_id: nil, amount: nil, date: nil, description: nil, transaction_id: nil)

    @type t :: %__MODULE__{
            account_id: binary,
            amount: number,
            date: binary,
            description: binary,
            transaction_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, amount} <-
          case(data["amount"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["amount"]}}
          end,
        {:ok, date} <-
          case(data["date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["date"]}}
          end,
        {:ok, description} <-
          case(data["description"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["description"]}}
          end,
        {:ok, transaction_id} <-
          case(data["transaction_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["transaction_id"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           account_id: account_id,
           amount: amount,
           date: date,
           description: description,
           transaction_id: transaction_id
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransactionData" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_id" => data.account_id,
        "amount" => data.amount,
        "date" => data.date,
        "description" => data.description,
        "transaction_id" => data.transaction_id
      }
    end
  end

  defmodule(SignalScores) do
    @moduledoc "#{"SignalEvaluateScores"}
    "
    defstruct(bank_initiated_return_risk: nil, customer_initiated_return_risk: nil)

    @type t :: %__MODULE__{
            bank_initiated_return_risk: Plaid.BankInitiatedReturnRisk.t() | nil,
            customer_initiated_return_risk: Plaid.CustomerInitiatedReturnRisk.t() | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, bank_initiated_return_risk} <-
          Plaid.BankInitiatedReturnRisk.decode(data["bank_initiated_return_risk"]),
        {:ok, customer_initiated_return_risk} <-
          Plaid.CustomerInitiatedReturnRisk.decode(data["customer_initiated_return_risk"])
      ) do
        {:ok,
         %__MODULE__{
           bank_initiated_return_risk: bank_initiated_return_risk,
           customer_initiated_return_risk: customer_initiated_return_risk
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SignalScores" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "bank_initiated_return_risk" =>
          Plaid.BankInitiatedReturnRisk.encode(data.bank_initiated_return_risk),
        "customer_initiated_return_risk" =>
          Plaid.CustomerInitiatedReturnRisk.encode(data.customer_initiated_return_risk)
      }
    end
  end

  defmodule(ProcessorStripeBankAccountTokenCreateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(request_id: nil, stripe_bank_account_token: nil)
    @type t :: %__MODULE__{request_id: binary, stripe_bank_account_token: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, stripe_bank_account_token} <-
          case(data["stripe_bank_account_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["stripe_bank_account_token"]}}
          end
      ) do
        {:ok,
         %__MODULE__{request_id: request_id, stripe_bank_account_token: stripe_bank_account_token}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ProcessorStripeBankAccountTokenCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "request_id" => data.request_id,
        "stripe_bank_account_token" => data.stripe_bank_account_token
      }
    end
  end

  defmodule(ItemApplicationScopesUpdateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(request_id: nil)
    @type t :: %__MODULE__{request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ItemApplicationScopesUpdateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id}
    end
  end

  defmodule(Cause) do
    @moduledoc "#{"Cause"}
    "
    defstruct(error: nil, item_id: nil)
    @type t :: %__MODULE__{error: Plaid.Error.t(), item_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, error} <- Plaid.Error.decode(data["error"]),
        {:ok, item_id} <-
          case(data["item_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["ItemId"]}}
          end
      ) do
        {:ok, %__MODULE__{error: error, item_id: item_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Cause" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"error" => Plaid.Error.encode(data.error), "item_id" => data.item_id}
    end
  end

  defmodule(BankTransferBalanceGetResponse) do
    @moduledoc "#{"BankTransferBalanceGetResponse"}
    "
    defstruct(balance: nil, origination_account_id: nil, request_id: nil)

    @type t :: %__MODULE__{
            balance: Plaid.BankTransferBalance.t(),
            origination_account_id: binary,
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, balance} <- Plaid.BankTransferBalance.decode(data["balance"]),
        {:ok, origination_account_id} <-
          case(data["origination_account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["origination_account_id"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           balance: balance,
           origination_account_id: origination_account_id,
           request_id: request_id
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferBalanceGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "balance" => Plaid.BankTransferBalance.encode(data.balance),
        "origination_account_id" => data.origination_account_id,
        "request_id" => data.request_id
      }
    end
  end

  defmodule(IdentityGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(accounts: nil, item: nil, request_id: nil)
    @type t :: %__MODULE__{accounts: [any], item: Plaid.Item.t(), request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, accounts} <-
          data["accounts"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- {:ok, data}) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, item} <- Plaid.Item.decode(data["item"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{accounts: accounts, item: item, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["IdentityGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "accounts" =>
          case(data.accounts) do
            nil ->
              nil

            _ ->
              Enum.map(data.accounts, fn item -> item end)
          end,
        "item" => Plaid.Item.encode(data.item),
        "request_id" => data.request_id
      }
    end
  end

  defmodule(LiabilitiesObject) do
    @moduledoc "#{"LiabilitiesObject"}
    "
    defstruct(credit: nil, mortgage: nil, student: nil)

    @type t :: %__MODULE__{
            credit: [Plaid.CreditCardLiability.t()],
            mortgage: [Plaid.MortgageLiability.t()],
            student: [Plaid.StudentLoan.t()]
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, credit} <-
          data["credit"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.CreditCardLiability.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, mortgage} <-
          data["mortgage"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.MortgageLiability.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, student} <-
          data["student"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.StudentLoan.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok, %__MODULE__{credit: credit, mortgage: mortgage, student: student}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["LiabilitiesObject" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "credit" =>
          case(data.credit) do
            nil ->
              nil

            _ ->
              Enum.map(data.credit, fn item -> Plaid.CreditCardLiability.encode(item) end)
          end,
        "mortgage" =>
          case(data.mortgage) do
            nil ->
              nil

            _ ->
              Enum.map(data.mortgage, fn item -> Plaid.MortgageLiability.encode(item) end)
          end,
        "student" =>
          case(data.student) do
            nil ->
              nil

            _ ->
              Enum.map(data.student, fn item -> Plaid.StudentLoan.encode(item) end)
          end
      }
    end
  end

  defmodule(SandboxProcessorTokenCreateResponse) do
    @moduledoc "#{nil}
    "
    defstruct(processor_token: nil, request_id: nil)
    @type t :: %__MODULE__{processor_token: binary, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, processor_token} <-
          case(data["processor_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["processor_token"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{processor_token: processor_token, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SandboxProcessorTokenCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"processor_token" => data.processor_token, "request_id" => data.request_id}
    end
  end

  defmodule(PaymentInitiationStandingOrderMetadata) do
    @moduledoc "#{"PaymentInitiationStandingOrderMetadata"}
    "
    defstruct(
      supports_standing_order_end_date: nil,
      supports_standing_order_negative_execution_days: nil,
      valid_standing_order_intervals: nil
    )

    @type t :: %__MODULE__{
            supports_standing_order_end_date: boolean,
            supports_standing_order_negative_execution_days: boolean,
            valid_standing_order_intervals: [binary]
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, supports_standing_order_end_date} <-
          case(data["supports_standing_order_end_date"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["supports_standing_order_end_date"]}}
          end,
        {:ok, supports_standing_order_negative_execution_days} <-
          case(data["supports_standing_order_negative_execution_days"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error,
               {:decode, {:invalid_boolean, x},
                ["supports_standing_order_negative_execution_days"]}}
          end,
        {:ok, valid_standing_order_intervals} <-
          data["valid_standing_order_intervals"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with(
                {:ok, item} <-
                  case(data) do
                    x when is_binary(x) ->
                      {:ok, x}

                    x ->
                      {:error, {:decode, {:invalid_string, x}, ["PaymentScheduleInterval"]}}
                  end
              ) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok,
         %__MODULE__{
           supports_standing_order_end_date: supports_standing_order_end_date,
           supports_standing_order_negative_execution_days:
             supports_standing_order_negative_execution_days,
           valid_standing_order_intervals: valid_standing_order_intervals
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaymentInitiationStandingOrderMetadata" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "supports_standing_order_end_date" => data.supports_standing_order_end_date,
        "supports_standing_order_negative_execution_days" =>
          data.supports_standing_order_negative_execution_days,
        "valid_standing_order_intervals" =>
          case(data.valid_standing_order_intervals) do
            nil ->
              nil

            _ ->
              Enum.map(data.valid_standing_order_intervals, fn item -> item end)
          end
      }
    end
  end

  defmodule(MortgagePropertyAddress) do
    @moduledoc "#{"MortgagePropertyAddress"}
    "
    defstruct(city: nil, country: nil, postal_code: nil, region: nil, street: nil)

    @type t :: %__MODULE__{
            city: binary,
            country: binary,
            postal_code: binary,
            region: binary,
            street: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, city} <-
          case(data["city"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["city"]}}
          end,
        {:ok, country} <-
          case(data["country"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["country"]}}
          end,
        {:ok, postal_code} <-
          case(data["postal_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["postal_code"]}}
          end,
        {:ok, region} <-
          case(data["region"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["region"]}}
          end,
        {:ok, street} <-
          case(data["street"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["street"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           city: city,
           country: country,
           postal_code: postal_code,
           region: region,
           street: street
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["MortgagePropertyAddress" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "city" => data.city,
        "country" => data.country,
        "postal_code" => data.postal_code,
        "region" => data.region,
        "street" => data.street
      }
    end
  end

  defmodule(AccountSubtypes) do
    @type t :: [binary]
    def(decode(items)) do
      items
      |> Enum.reverse()
      |> Enum.reduce({:ok, []}, fn
        data, {:ok, items} ->
          with(
            {:ok, item} <-
              case(data) do
                x when is_binary(x) ->
                  {:ok, x}

                x ->
                  {:error, {:decode, {:invalid_string, x}, ["AccountSubtype"]}}
              end
          ) do
            {:ok, [item | items]}
          end

        _, error ->
          error
      end)
    end
  end

  defmodule(DistributionDetails) do
    @moduledoc "#{"DistributionDetails"}
    "
    defstruct(
      account_number: nil,
      bank_account_type: nil,
      bank_name: nil,
      current_pay: nil,
      description: nil
    )

    @type t :: %__MODULE__{
            account_number: binary | nil,
            bank_account_type: binary | nil,
            bank_name: binary | nil,
            current_pay: Plaid.Pay.t() | nil,
            description: binary | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_number} <-
          case(data["account_number"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_number"]}}
          end,
        {:ok, bank_account_type} <-
          case(data["bank_account_type"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["bank_account_type"]}}
          end,
        {:ok, bank_name} <-
          case(data["bank_name"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["bank_name"]}}
          end,
        {:ok, current_pay} <- Plaid.Pay.decode(data["current_pay"]),
        {:ok, description} <-
          case(data["description"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["description"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           account_number: account_number,
           bank_account_type: bank_account_type,
           bank_name: bank_name,
           current_pay: current_pay,
           description: description
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["DistributionDetails" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_number" => data.account_number,
        "bank_account_type" => data.bank_account_type,
        "bank_name" => data.bank_name,
        "current_pay" => Plaid.Pay.encode(data.current_pay),
        "description" => data.description
      }
    end
  end

  defmodule(TransactionsGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(
      accounts: nil,
      item: nil,
      request_id: nil,
      total_transactions: nil,
      transactions: nil
    )

    @type t :: %__MODULE__{
            accounts: [Plaid.AccountBase.t()],
            item: Plaid.Item.t(),
            request_id: binary,
            total_transactions: integer,
            transactions: [any]
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, accounts} <-
          data["accounts"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.AccountBase.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, item} <- Plaid.Item.decode(data["item"]),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, total_transactions} <-
          case(data["total_transactions"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["total_transactions"]}}
          end,
        {:ok, transactions} <-
          data["transactions"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- {:ok, data}) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end)
      ) do
        {:ok,
         %__MODULE__{
           accounts: accounts,
           item: item,
           request_id: request_id,
           total_transactions: total_transactions,
           transactions: transactions
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransactionsGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "accounts" =>
          case(data.accounts) do
            nil ->
              nil

            _ ->
              Enum.map(data.accounts, fn item -> Plaid.AccountBase.encode(item) end)
          end,
        "item" => Plaid.Item.encode(data.item),
        "request_id" => data.request_id,
        "total_transactions" => data.total_transactions,
        "transactions" =>
          case(data.transactions) do
            nil ->
              nil

            _ ->
              Enum.map(data.transactions, fn item -> item end)
          end
      }
    end
  end

  nil

  defmodule(PaymentInitiationPaymentReverseResponse) do
    @moduledoc "#{nil}
    "
    defstruct(refund_id: nil, request_id: nil, status: nil)
    @type t :: %__MODULE__{refund_id: binary, request_id: binary, status: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, refund_id} <-
          case(data["refund_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["refund_id"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, status} <-
          case(data["status"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["status"]}}
          end
      ) do
        {:ok, %__MODULE__{refund_id: refund_id, request_id: request_id, status: status}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaymentInitiationPaymentReverseResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"refund_id" => data.refund_id, "request_id" => data.request_id, "status" => data.status}
    end
  end

  defmodule(Deductions) do
    @moduledoc "#{"Deductions"}
    "
    defstruct(subtotals: nil, totals: nil)
    @type t :: %__MODULE__{subtotals: [Plaid.Total.t()] | nil, totals: [Plaid.Total.t()] | nil}
    @doc false
    def(decode(data)) do
      with(
        {:ok, subtotals} <-
          case(data["subtotals"]) do
            nil ->
              nil

            _ ->
              data["subtotals"]
              |> Enum.reverse()
              |> Enum.reduce({:ok, []}, fn
                data, {:ok, items} ->
                  with({:ok, item} <- Plaid.Total.decode(data)) do
                    {:ok, [item | items]}
                  end

                _, error ->
                  error
              end)
          end,
        {:ok, totals} <-
          case(data["totals"]) do
            nil ->
              nil

            _ ->
              data["totals"]
              |> Enum.reverse()
              |> Enum.reduce({:ok, []}, fn
                data, {:ok, items} ->
                  with({:ok, item} <- Plaid.Total.decode(data)) do
                    {:ok, [item | items]}
                  end

                _, error ->
                  error
              end)
          end
      ) do
        {:ok, %__MODULE__{subtotals: subtotals, totals: totals}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Deductions" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "subtotals" =>
          case(data.subtotals) do
            nil ->
              nil

            _ ->
              Enum.map(data.subtotals, fn item -> Plaid.Total.encode(item) end)
          end,
        "totals" =>
          case(data.totals) do
            nil ->
              nil

            _ ->
              Enum.map(data.totals, fn item -> Plaid.Total.encode(item) end)
          end
      }
    end
  end

  defmodule(NumbersBACS) do
    @moduledoc "#{"NumbersBACS"}
    "
    defstruct(account: nil, account_id: nil, sort_code: nil)
    @type t :: %__MODULE__{account: binary, account_id: binary, sort_code: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, account} <-
          case(data["account"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account"]}}
          end,
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, sort_code} <-
          case(data["sort_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["sort_code"]}}
          end
      ) do
        {:ok, %__MODULE__{account: account, account_id: account_id, sort_code: sort_code}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["NumbersBACS" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"account" => data.account, "account_id" => data.account_id, "sort_code" => data.sort_code}
    end
  end

  defmodule(AssetReportRefreshResponse) do
    @moduledoc "#{nil}
    "
    defstruct(asset_report_id: nil, asset_report_token: nil, request_id: nil)

    @type t :: %__MODULE__{
            asset_report_id: binary,
            asset_report_token: binary,
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, asset_report_id} <-
          case(data["asset_report_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["AssetReportId"]}}
          end,
        {:ok, asset_report_token} <-
          case(data["asset_report_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["AssetReportToken"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           asset_report_id: asset_report_id,
           asset_report_token: asset_report_token,
           request_id: request_id
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AssetReportRefreshResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "asset_report_id" => data.asset_report_id,
        "asset_report_token" => data.asset_report_token,
        "request_id" => data.request_id
      }
    end
  end

  @type verification_refresh_status :: binary
  defmodule(PayFrequency) do
    @moduledoc "#{"PayFrequency"}
    "
    defstruct(value: nil, verification_status: nil)
    @type t :: %__MODULE__{value: binary, verification_status: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, value} <-
          case(data["value"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["value"]}}
          end,
        {:ok, verification_status} <-
          case(data["verification_status"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["VerificationStatus"]}}
          end
      ) do
        {:ok, %__MODULE__{value: value, verification_status: verification_status}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PayFrequency" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"value" => data.value, "verification_status" => data.verification_status}
    end
  end

  defmodule(IncomeVerificationSummaryGetResponse) do
    @moduledoc "#{"IncomeVerificationSummaryGetResponse"}
    "
    defstruct(error: nil, income_summaries: nil, request_id: nil)

    @type t :: %__MODULE__{
            error: Plaid.Error.t() | nil,
            income_summaries: [Plaid.IncomeSummary.t()],
            request_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, error} <- Plaid.Error.decode(data["error"]),
        {:ok, income_summaries} <-
          data["income_summaries"]
          |> Enum.reverse()
          |> Enum.reduce({:ok, []}, fn
            data, {:ok, items} ->
              with({:ok, item} <- Plaid.IncomeSummary.decode(data)) do
                {:ok, [item | items]}
              end

            _, error ->
              error
          end),
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok,
         %__MODULE__{error: error, income_summaries: income_summaries, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["IncomeVerificationSummaryGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "error" => Plaid.Error.encode(data.error),
        "income_summaries" =>
          case(data.income_summaries) do
            nil ->
              nil

            _ ->
              Enum.map(data.income_summaries, fn item -> Plaid.IncomeSummary.encode(item) end)
          end,
        "request_id" => data.request_id
      }
    end
  end

  defmodule(SandboxTransferSimulateResponse) do
    @moduledoc "#{"SandboxTransferSimulateResponse"}
    "
    defstruct(request_id: nil)
    @type t :: %__MODULE__{request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["SandboxTransferSimulateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id}
    end
  end

  defmodule(PSLFStatus) do
    @moduledoc "#{"PSLFStatus"}
    "
    defstruct(estimated_eligibility_date: nil, payments_made: nil, payments_remaining: nil)

    @type t :: %__MODULE__{
            estimated_eligibility_date: binary,
            payments_made: number,
            payments_remaining: number
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, estimated_eligibility_date} <-
          case(data["estimated_eligibility_date"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["estimated_eligibility_date"]}}
          end,
        {:ok, payments_made} <-
          case(data["payments_made"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["payments_made"]}}
          end,
        {:ok, payments_remaining} <-
          case(data["payments_remaining"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["payments_remaining"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           estimated_eligibility_date: estimated_eligibility_date,
           payments_made: payments_made,
           payments_remaining: payments_remaining
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PSLFStatus" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "estimated_eligibility_date" => data.estimated_eligibility_date,
        "payments_made" => data.payments_made,
        "payments_remaining" => data.payments_remaining
      }
    end
  end

  defmodule(ProductStatusBreakdown) do
    @moduledoc "#{"StatusBreakdown"}
    "
    defstruct(error_institution: nil, error_plaid: nil, refresh_interval: nil, success: nil)

    @type t :: %__MODULE__{
            error_institution: number,
            error_plaid: number,
            refresh_interval: binary | nil,
            success: number
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, error_institution} <-
          case(data["error_institution"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["error_institution"]}}
          end,
        {:ok, error_plaid} <-
          case(data["error_plaid"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["error_plaid"]}}
          end,
        {:ok, refresh_interval} <-
          case(data["refresh_interval"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["refresh_interval"]}}
          end,
        {:ok, success} <-
          case(data["success"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["success"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           error_institution: error_institution,
           error_plaid: error_plaid,
           refresh_interval: refresh_interval,
           success: success
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ProductStatusBreakdown" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "error_institution" => data.error_institution,
        "error_plaid" => data.error_plaid,
        "refresh_interval" => data.refresh_interval,
        "success" => data.success
      }
    end
  end

  defmodule(Transfer) do
    @moduledoc "#{"Transfer"}
    "
    defstruct(
      account_id: nil,
      ach_class: nil,
      amount: nil,
      cancellable: nil,
      created: nil,
      description: nil,
      failure_reason: nil,
      id: nil,
      metadata: nil,
      network: nil,
      origination_account_id: nil,
      status: nil,
      type: nil,
      user: nil
    )

    @type t :: %__MODULE__{
            account_id: binary,
            ach_class: binary,
            amount: binary,
            cancellable: boolean,
            created: binary,
            description: binary,
            failure_reason: Plaid.TransferFailure.t(),
            id: binary,
            metadata: Plaid.TransferMetadata.t(),
            network: binary,
            origination_account_id: binary,
            status: binary,
            type: binary,
            user: Plaid.TransferUserInResponse.t()
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, ach_class} <-
          case(data["ach_class"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["ACHClass"]}}
          end,
        {:ok, amount} <-
          case(data["amount"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["TransferAmount"]}}
          end,
        {:ok, cancellable} <-
          case(data["cancellable"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["cancellable"]}}
          end,
        {:ok, created} <-
          case(data["created"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["created"]}}
          end,
        {:ok, description} <-
          case(data["description"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["description"]}}
          end,
        {:ok, failure_reason} <- Plaid.TransferFailure.decode(data["failure_reason"]),
        {:ok, id} <-
          case(data["id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["TransferID"]}}
          end,
        {:ok, metadata} <- Plaid.TransferMetadata.decode(data["metadata"]),
        {:ok, network} <-
          case(data["network"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["TransferNetwork"]}}
          end,
        {:ok, origination_account_id} <-
          case(data["origination_account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["origination_account_id"]}}
          end,
        {:ok, status} <-
          case(data["status"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["TransferStatus"]}}
          end,
        {:ok, type} <-
          case(data["type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["TransferType"]}}
          end,
        {:ok, user} <- Plaid.TransferUserInResponse.decode(data["user"])
      ) do
        {:ok,
         %__MODULE__{
           account_id: account_id,
           ach_class: ach_class,
           amount: amount,
           cancellable: cancellable,
           created: created,
           description: description,
           failure_reason: failure_reason,
           id: id,
           metadata: metadata,
           network: network,
           origination_account_id: origination_account_id,
           status: status,
           type: type,
           user: user
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Transfer" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_id" => data.account_id,
        "ach_class" => data.ach_class,
        "amount" => data.amount,
        "cancellable" => data.cancellable,
        "created" => data.created,
        "description" => data.description,
        "failure_reason" => Plaid.TransferFailure.encode(data.failure_reason),
        "id" => data.id,
        "metadata" => Plaid.TransferMetadata.encode(data.metadata),
        "network" => data.network,
        "origination_account_id" => data.origination_account_id,
        "status" => data.status,
        "type" => data.type,
        "user" => Plaid.TransferUserInResponse.encode(data.user)
      }
    end
  end

  defmodule(ItemImportResponse) do
    @moduledoc "#{nil}
    "
    defstruct(access_token: nil, request_id: nil)
    @type t :: %__MODULE__{access_token: binary, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, access_token} <-
          case(data["access_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["AccessToken"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{access_token: access_token, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ItemImportResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"access_token" => data.access_token, "request_id" => data.request_id}
    end
  end

  @type bank_transfer_id :: binary
  defmodule(TransferCreateResponse) do
    @moduledoc "#{"TransferCreateResponse"}
    "
    defstruct(request_id: nil, transfer: nil)
    @type t :: %__MODULE__{request_id: binary, transfer: Plaid.Transfer.t()}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end,
        {:ok, transfer} <- Plaid.Transfer.decode(data["transfer"])
      ) do
        {:ok, %__MODULE__{request_id: request_id, transfer: transfer}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransferCreateResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id, "transfer" => Plaid.Transfer.encode(data.transfer)}
    end
  end

  defmodule(ProcessorIdentityGetResponse) do
    @moduledoc "#{nil}
    "
    defstruct(account: nil, request_id: nil)
    @type t :: %__MODULE__{account: any, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, account} <- {:ok, data["account"]},
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{account: account, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ProcessorIdentityGetResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"account" => data.account, "request_id" => data.request_id}
    end
  end

  nil

  defmodule(TaxpayerID) do
    @moduledoc "#{"TaxpayerID"}
    "
    defstruct(id_type: nil, last_4_digits: nil)
    @type t :: %__MODULE__{id_type: binary | nil, last_4_digits: binary | nil}
    @doc false
    def(decode(data)) do
      with(
        {:ok, id_type} <-
          case(data["id_type"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["id_type"]}}
          end,
        {:ok, last_4_digits} <-
          case(data["last_4_digits"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["last_4_digits"]}}
          end
      ) do
        {:ok, %__MODULE__{id_type: id_type, last_4_digits: last_4_digits}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TaxpayerID" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"id_type" => data.id_type, "last_4_digits" => data.last_4_digits}
    end
  end

  defmodule(AssetReportUser) do
    @moduledoc "#{"AssetReportUser"}
    "
    defstruct(
      client_user_id: nil,
      email: nil,
      first_name: nil,
      last_name: nil,
      middle_name: nil,
      phone_number: nil,
      ssn: nil
    )

    @type t :: %__MODULE__{
            client_user_id: binary | nil,
            email: binary | nil,
            first_name: binary | nil,
            last_name: binary | nil,
            middle_name: binary | nil,
            phone_number: binary | nil,
            ssn: binary | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, client_user_id} <-
          case(data["client_user_id"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["client_user_id"]}}
          end,
        {:ok, email} <-
          case(data["email"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["email"]}}
          end,
        {:ok, first_name} <-
          case(data["first_name"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["first_name"]}}
          end,
        {:ok, last_name} <-
          case(data["last_name"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["last_name"]}}
          end,
        {:ok, middle_name} <-
          case(data["middle_name"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["middle_name"]}}
          end,
        {:ok, phone_number} <-
          case(data["phone_number"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["phone_number"]}}
          end,
        {:ok, ssn} <-
          case(data["ssn"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["ssn"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           client_user_id: client_user_id,
           email: email,
           first_name: first_name,
           last_name: last_name,
           middle_name: middle_name,
           phone_number: phone_number,
           ssn: ssn
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AssetReportUser" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "client_user_id" => data.client_user_id,
        "email" => data.email,
        "first_name" => data.first_name,
        "last_name" => data.last_name,
        "middle_name" => data.middle_name,
        "phone_number" => data.phone_number,
        "ssn" => data.ssn
      }
    end
  end

  defmodule(TransactionsRefreshResponse) do
    @moduledoc "#{nil}
    "
    defstruct(request_id: nil)
    @type t :: %__MODULE__{request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["TransactionsRefreshResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"request_id" => data.request_id}
    end
  end

  defmodule(BankTransferSweep) do
    @moduledoc "#{"BankTransferSweep"}
    "
    defstruct(
      amount: nil,
      created_at: nil,
      id: nil,
      iso_currency_code: nil,
      sweep_account: nil,
      transfer_id: nil
    )

    @type t :: %__MODULE__{
            amount: binary,
            created_at: binary,
            id: integer,
            iso_currency_code: binary,
            sweep_account: Plaid.BankTransferSweepAccount.t(),
            transfer_id: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, amount} <-
          case(data["amount"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["amount"]}}
          end,
        {:ok, created_at} <-
          case(data["created_at"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["created_at"]}}
          end,
        {:ok, id} <-
          case(data["id"]) do
            x when is_integer(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_integer, x}, ["id"]}}
          end,
        {:ok, iso_currency_code} <-
          case(data["iso_currency_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["iso_currency_code"]}}
          end,
        {:ok, sweep_account} <- Plaid.BankTransferSweepAccount.decode(data["sweep_account"]),
        {:ok, transfer_id} <-
          case(data["transfer_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["transfer_id"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           amount: amount,
           created_at: created_at,
           id: id,
           iso_currency_code: iso_currency_code,
           sweep_account: sweep_account,
           transfer_id: transfer_id
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["BankTransferSweep" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "amount" => data.amount,
        "created_at" => data.created_at,
        "id" => data.id,
        "iso_currency_code" => data.iso_currency_code,
        "sweep_account" => Plaid.BankTransferSweepAccount.encode(data.sweep_account),
        "transfer_id" => data.transfer_id
      }
    end
  end

  defmodule(AuthSupportedMethods) do
    @moduledoc "#{"AuthSupportedMethods"}
    "
    defstruct(automated_micro_deposits: nil, instant_auth: nil, instant_match: nil)

    @type t :: %__MODULE__{
            automated_micro_deposits: boolean,
            instant_auth: boolean,
            instant_match: boolean
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, automated_micro_deposits} <-
          case(data["automated_micro_deposits"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["automated_micro_deposits"]}}
          end,
        {:ok, instant_auth} <-
          case(data["instant_auth"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["instant_auth"]}}
          end,
        {:ok, instant_match} <-
          case(data["instant_match"]) do
            x when is_boolean(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_boolean, x}, ["instant_match"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           automated_micro_deposits: automated_micro_deposits,
           instant_auth: instant_auth,
           instant_match: instant_match
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["AuthSupportedMethods" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "automated_micro_deposits" => data.automated_micro_deposits,
        "instant_auth" => data.instant_auth,
        "instant_match" => data.instant_match
      }
    end
  end

  defmodule(Taxform) do
    @moduledoc "#{"Taxform"}
    "
    defstruct(document_type: nil, w2: nil)
    @type t :: %__MODULE__{document_type: binary, w2: Plaid.W2.t() | nil}
    @doc false
    def(decode(data)) do
      with(
        {:ok, document_type} <-
          case(data["document_type"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["document_type"]}}
          end,
        {:ok, w2} <- Plaid.W2.decode(data["w2"])
      ) do
        {:ok, %__MODULE__{document_type: document_type, w2: w2}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Taxform" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"document_type" => data.document_type, "w2" => Plaid.W2.encode(data.w2)}
    end
  end

  defmodule(PaymentAmount) do
    @moduledoc "#{"PaymentAmount"}
    "
    defstruct(currency: nil, value: nil)
    @type t :: %__MODULE__{currency: binary, value: number}
    @doc false
    def(decode(data)) do
      with(
        {:ok, currency} <-
          case(data["currency"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["currency"]}}
          end,
        {:ok, value} <-
          case(data["value"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["value"]}}
          end
      ) do
        {:ok, %__MODULE__{currency: currency, value: value}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["PaymentAmount" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"currency" => data.currency, "value" => data.value}
    end
  end

  defmodule(Employee) do
    @moduledoc "#{"Employee"}
    "
    defstruct(address: nil, marital_status: nil, name: nil, taxpayer_id: nil)

    @type t :: %__MODULE__{
            address: Plaid.PaystubAddress.t(),
            marital_status: binary | nil,
            name: binary,
            taxpayer_id: Plaid.TaxpayerID.t() | nil
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, address} <- Plaid.PaystubAddress.decode(data["address"]),
        {:ok, marital_status} <-
          case(data["marital_status"]) do
            x when is_nil(x) or is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["marital_status"]}}
          end,
        {:ok, name} <-
          case(data["name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["name"]}}
          end,
        {:ok, taxpayer_id} <- Plaid.TaxpayerID.decode(data["taxpayer_id"])
      ) do
        {:ok,
         %__MODULE__{
           address: address,
           marital_status: marital_status,
           name: name,
           taxpayer_id: taxpayer_id
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Employee" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "address" => Plaid.PaystubAddress.encode(data.address),
        "marital_status" => data.marital_status,
        "name" => data.name,
        "taxpayer_id" => Plaid.TaxpayerID.encode(data.taxpayer_id)
      }
    end
  end

  defmodule(ItemPublicTokenExchangeResponse) do
    @moduledoc "#{nil}
    "
    defstruct(access_token: nil, item_id: nil, request_id: nil)
    @type t :: %__MODULE__{access_token: binary, item_id: binary, request_id: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, access_token} <-
          case(data["access_token"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["AccessToken"]}}
          end,
        {:ok, item_id} <-
          case(data["item_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["item_id"]}}
          end,
        {:ok, request_id} <-
          case(data["request_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["RequestID"]}}
          end
      ) do
        {:ok, %__MODULE__{access_token: access_token, item_id: item_id, request_id: request_id}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ItemPublicTokenExchangeResponse" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "access_token" => data.access_token,
        "item_id" => data.item_id,
        "request_id" => data.request_id
      }
    end
  end

  defmodule(ExternalPaymentRefundDetails) do
    @moduledoc "#{"ExternalPaymentRefundDetails"}
    "
    defstruct(bacs: nil, iban: nil, name: nil)
    @type t :: %__MODULE__{bacs: any, iban: binary, name: binary}
    @doc false
    def(decode(data)) do
      with(
        {:ok, bacs} <- {:ok, data["bacs"]},
        {:ok, iban} <-
          case(data["iban"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["iban"]}}
          end,
        {:ok, name} <-
          case(data["name"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["name"]}}
          end
      ) do
        {:ok, %__MODULE__{bacs: bacs, iban: iban, name: name}}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["ExternalPaymentRefundDetails" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{"bacs" => data.bacs, "iban" => data.iban, "name" => data.name}
    end
  end

  defmodule(Holding) do
    @moduledoc "#{"Holding"}
    "
    defstruct(
      account_id: nil,
      cost_basis: nil,
      institution_price: nil,
      institution_price_as_of: nil,
      institution_value: nil,
      iso_currency_code: nil,
      quantity: nil,
      security_id: nil,
      unofficial_currency_code: nil
    )

    @type t :: %__MODULE__{
            account_id: binary,
            cost_basis: number,
            institution_price: number,
            institution_price_as_of: binary,
            institution_value: number,
            iso_currency_code: binary,
            quantity: number,
            security_id: binary,
            unofficial_currency_code: binary
          }
    @doc false
    def(decode(data)) do
      with(
        {:ok, account_id} <-
          case(data["account_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["account_id"]}}
          end,
        {:ok, cost_basis} <-
          case(data["cost_basis"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["cost_basis"]}}
          end,
        {:ok, institution_price} <-
          case(data["institution_price"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["institution_price"]}}
          end,
        {:ok, institution_price_as_of} <-
          case(data["institution_price_as_of"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["institution_price_as_of"]}}
          end,
        {:ok, institution_value} <-
          case(data["institution_value"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["institution_value"]}}
          end,
        {:ok, iso_currency_code} <-
          case(data["iso_currency_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["iso_currency_code"]}}
          end,
        {:ok, quantity} <-
          case(data["quantity"]) do
            x when is_number(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_number, x}, ["quantity"]}}
          end,
        {:ok, security_id} <-
          case(data["security_id"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["security_id"]}}
          end,
        {:ok, unofficial_currency_code} <-
          case(data["unofficial_currency_code"]) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["unofficial_currency_code"]}}
          end
      ) do
        {:ok,
         %__MODULE__{
           account_id: account_id,
           cost_basis: cost_basis,
           institution_price: institution_price,
           institution_price_as_of: institution_price_as_of,
           institution_value: institution_value,
           iso_currency_code: iso_currency_code,
           quantity: quantity,
           security_id: security_id,
           unofficial_currency_code: unofficial_currency_code
         }}
      else
        {:error, {:decode, reason, trace}} ->
          {:error, {:decode, reason, ["Holding" | trace]}}

        error ->
          error
      end
    end

    @doc false
    def(encode(data)) do
      %{
        "account_id" => data.account_id,
        "cost_basis" => data.cost_basis,
        "institution_price" => data.institution_price,
        "institution_price_as_of" => data.institution_price_as_of,
        "institution_value" => data.institution_value,
        "iso_currency_code" => data.iso_currency_code,
        "quantity" => data.quantity,
        "security_id" => data.security_id,
        "unofficial_currency_code" => data.unofficial_currency_code
      }
    end
  end

  (
    @doc "#{"Filter Asset Report"}
    
    #{"By default, an Asset Report will contain all of the accounts on a given Item. In some cases, you may not want the Asset Report to contain all accounts. For example, you might have the end user choose which accounts are relevant in Link using the Account Select view, which you can enable in the dashboard. Or, you might always exclude certain account types or subtypes, which you can identify by using the `/accounts/get` endpoint. To narrow an Asset Report to only a subset of accounts, use the `/asset_report/filter` endpoint.\n\nTo exclude certain Accounts from an Asset Report, first use the `/asset_report/create` endpoint to create the report, then send the `asset_report_token` along with a list of `account_ids` to exclude to the `/asset_report/filter` endpoint, to create a new Asset Report which contains only a subset of the original Asset Report's data.\n\nBecause Asset Reports are immutable, calling `/asset_report/filter` does not alter the original Asset Report in any way; rather, `/asset_report/filter` creates a new Asset Report with a new token and id. Asset Reports created via `/asset_report/filter` do not contain new Asset data, and are not billed.\n\nPlaid will fire a [`PRODUCT_READY`](https://plaid.com/docs/api/webhooks) webhook once generation of the filtered Asset Report has completed."}
    
    #{""}
    
    #{""}
    "
    @spec asset_report_filter(Tesla.Client.t()) ::
            {:ok, Plaid.AssetReportFilterResponse.t()} | {:error, any}
    def(asset_report_filter(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/filter")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.AssetReportFilterResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(asset_report_filter: 1)
  )

  (
    @doc "#{"Get Link Token"}
    
    #{"The `/link/token/get` endpoint gets information about a previously-created `link_token` using the\n`/link/token/create` endpoint. It can be useful for debugging purposes."}
    
    #{""}
    
    #{""}
    "
    @spec link_token_get(Tesla.Client.t()) ::
            {:ok, Plaid.LinkTokenGetResponse.t()} | {:error, any}
    def(link_token_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/link/token/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.LinkTokenGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(link_token_get: 1)
  )

  (
    @doc "#{"Manually fire an Income webhook"}
    
    #{"Use the `/sandbox/income/fire_webhook` endpoint to manually trigger an Income webhook in the Sandbox environment."}
    
    #{""}
    
    #{""}
    "
    @spec sandbox_income_fire_webhook(Tesla.Client.t()) ::
            {:ok, Plaid.SandboxIncomeFireWebhookResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(sandbox_income_fire_webhook(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/income/fire_webhook")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.SandboxIncomeFireWebhookResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(sandbox_income_fire_webhook: 1)
  )

  (
    @doc "#{"Create payment recipient"}
    
    #{"Create a payment recipient for payment initiation.  The recipient must be in Europe, within a country that is a member of the Single Euro Payment Area (SEPA).  For a standing order (recurring) payment, the recipient must be in the UK.\n\nThe endpoint is idempotent: if a developer has already made a request with the same payment details, Plaid will return the same `recipient_id`.\n"}
    
    #{""}
    
    #{""}
    "
    @spec payment_initiation_recipient_create(Tesla.Client.t()) ::
            {:ok, Plaid.PaymentInitiationRecipientCreateResponse.t()} | {:error, any}
    def(payment_initiation_recipient_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/payment_initiation/recipient/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.PaymentInitiationRecipientCreateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(payment_initiation_recipient_create: 1)
  )

  (
    @doc "#{"Import Item"}
    
    #{"`/item/import` creates an Item via your Plaid Exchange Integration and returns an `access_token`. As part of an `/item/import` request, you will include a User ID (`user_auth.user_id`) and Authentication Token (`user_auth.auth_token`) that enable data aggregation through your Plaid Exchange API endpoints. These authentication principals are to be chosen by you.\n\nUpon creating an Item via `/item/import`, Plaid will automatically begin an extraction of that Item through the Plaid Exchange infrastructure you have already integrated. This will automatically generate the Plaid native account ID for the account the user will switch their direct deposit to (`target_account_id`)."}
    
    #{""}
    
    #{""}
    "
    @spec item_import(Tesla.Client.t()) :: {:ok, Plaid.ItemImportResponse.t()} | {:error, any}
    def(item_import(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/import")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ItemImportResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(item_import: 1)
  )

  (
    @doc "#{"List transfer events"}
    
    #{"Use the `/transfer/event/list` endpoint to get a list of transfer events based on specified filter criteria."}
    
    #{""}
    
    #{""}
    "
    @spec transfer_event_list(Tesla.Client.t()) ::
            {:ok, Plaid.TransferEventListResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(transfer_event_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transfer/event/list")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.TransferEventListResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(transfer_event_list: 1)
  )

  (
    @doc "#{"Create a bank transfer"}
    
    #{"Use the `/bank_transfer/create` endpoint to initiate a new bank transfer."}
    
    #{""}
    
    #{""}
    "
    @spec bank_transfer_create(Tesla.Client.t()) ::
            {:ok, Plaid.BankTransferCreateResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(bank_transfer_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.BankTransferCreateResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(bank_transfer_create: 1)
  )

  (
    @doc "#{"Create a deposit switch token"}
    
    #{"In order for the end user to take action, you will need to create a public token representing the deposit switch. This token is used to initialize Link. It can be used one time and expires after 30 minutes.\n"}
    
    #{""}
    
    #{""}
    "
    @spec deposit_switch_token_create(Tesla.Client.t()) ::
            {:ok, Plaid.DepositSwitchTokenCreateResponse.t()} | {:error, any}
    def(deposit_switch_token_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/deposit_switch/token/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.DepositSwitchTokenCreateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(deposit_switch_token_create: 1)
  )

  (
    @doc "#{"Retrieve an Asset Report Audit Copy"}
    
    #{"`/asset_report/audit_copy/get` allows auditors to get a copy of an Asset Report that was previously shared via the `/asset_report/audit_copy/create` endpoint.  The caller of `/asset_report/audit_copy/create` must provide the `audit_copy_token` to the auditor.  This token can then be used to call `/asset_report/audit_copy/create`."}
    
    #{""}
    
    #{""}
    "
    @spec asset_report_audit_copy_get(Tesla.Client.t()) ::
            {:ok, Plaid.AssetReportGetResponse.t()} | {:error, any}
    def(asset_report_audit_copy_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/audit_copy/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.AssetReportGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(asset_report_audit_copy_get: 1)
  )

  (
    @doc "#{"Get details of all supported institutions"}
    
    #{"Returns a JSON response containing details on all financial institutions currently supported by Plaid. Because Plaid supports thousands of institutions, results are paginated.\n\nIf there is no overlap between an institution’s enabled products and a client’s enabled products, then the institution will be filtered out from the response. As a result, the number of institutions returned may not match the count specified in the call."}
    
    #{""}
    
    #{""}
    "
    @spec institutions_get(Tesla.Client.t()) ::
            {:ok, Plaid.InstitutionsGetResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(institutions_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/institutions/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.InstitutionsGetResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(institutions_get: 1)
  )

  (
    @doc "#{"Check a user's eligibility for the income verification product"}
    
    #{"`/income/verification/precheck` returns whether a given user is supportable by the income product"}
    
    #{""}
    
    #{""}
    "
    @spec income_verification_precheck(Tesla.Client.t()) ::
            {:ok, Plaid.IncomeVerificationPrecheckResponse.t()} | {:error, any}
    def(income_verification_precheck(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/income/verification/precheck")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.IncomeVerificationPrecheckResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(income_verification_precheck: 1)
  )

  (
    @doc "#{"Create Stripe bank account token"}
    
    #{"Used to create a token suitable for sending to Stripe to enable Plaid-Stripe integrations. For a detailed guide on integrating Stripe, see [Add Stripe to your app](https://plaid.com/docs/auth/partnerships/stripe/)."}
    
    #{""}
    
    #{""}
    "
    @spec processor_stripe_bank_account_token_create(Tesla.Client.t()) ::
            {:ok, Plaid.ProcessorStripeBankAccountTokenCreateResponse.t()} | {:error, any}
    def(processor_stripe_bank_account_token_create(client \\ new())) do
      case(
        Tesla.request(client, method: :post, url: "/processor/stripe/bank_account_token/create")
      ) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ProcessorStripeBankAccountTokenCreateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(processor_stripe_bank_account_token_create: 1)
  )

  (
    @doc "#{"Update Webhook URL"}
    
    #{"The POST `/item/webhook/update` allows you to update the webhook URL associated with an Item. This request triggers a [`WEBHOOK_UPDATE_ACKNOWLEDGED`](https://plaid.com/docs/api/webhooks/#item-webhook-url-updated) webhook to the newly specified webhook URL."}
    
    #{""}
    
    #{""}
    "
    @spec item_webhook_update(Tesla.Client.t()) ::
            {:ok, Plaid.ItemWebhookUpdateResponse.t()} | {:error, any}
    def(item_webhook_update(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/webhook/update")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ItemWebhookUpdateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(item_webhook_update: 1)
  )

  (
    @doc "#{"List sweeps"}
    
    #{"The `/bank_transfer/sweep/list` endpoint fetches information about the sweeps matching the given filters."}
    
    #{""}
    
    #{""}
    "
    @spec bank_transfer_sweep_list(Tesla.Client.t()) ::
            {:ok, Plaid.BankTransferSweepListResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(bank_transfer_sweep_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/sweep/list")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.BankTransferSweepListResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(bank_transfer_sweep_list: 1)
  )

  (
    @doc "#{"Create an income verification instance"}
    
    #{"`/income/verification/create` begins the income verification process by returning an `income_verification_id`. You can then provide the `income_verification_id` to `/link/token/create` under the `income_verification` parameter in order to create a Link instance that will prompt the user to go through the income verification flow. Plaid will fire an `INCOME` webhook once the user completes the Payroll Income flow, or when the uploaded documents in the Document Income flow have finished processing. "}
    
    #{""}
    
    #{""}
    "
    @spec income_verification_create(Tesla.Client.t()) ::
            {:ok, Plaid.IncomeVerificationCreateResponse.t()} | {:error, any}
    def(income_verification_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/income/verification/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.IncomeVerificationCreateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(income_verification_create: 1)
  )

  (
    @doc "#{"Get payment details"}
    
    #{"The `/payment_initiation/payment/get` endpoint can be used to check the status of a payment, as well as to receive basic information such as recipient and payment amount. In the case of standing orders, the `/payment_initiation/payment/get` endpoint will provide information about the status of the overall standing order itself; the API cannot be used to retrieve payment status for individual payments within a standing order."}
    
    #{""}
    
    #{""}
    "
    @spec payment_initiation_payment_get(Tesla.Client.t()) :: {:ok, any} | {:error, any}
    def(payment_initiation_payment_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/payment_initiation/payment/get")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, body}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(payment_initiation_payment_get: 1)
  )

  (
    @doc "#{"(Deprecated) Retrieve information from a single paystub used for income verification"}
    
    #{nil}
    
    #{""}
    
    #{""}
    "
    @spec income_verification_paystub_get(Tesla.Client.t()) ::
            {:ok, Plaid.IncomeVerificationPaystubGetResponse.t()} | {:error, any}
    def(income_verification_paystub_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/income/verification/paystub/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.IncomeVerificationPaystubGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(income_verification_paystub_get: 1)
  )

  (
    @doc "#{"Retrieve accounts"}
    
    #{"The `/accounts/get`  endpoint can be used to retrieve information for any linked Item. Note that some information is nullable. Plaid will only return active bank accounts, i.e. accounts that are not closed and are capable of carrying a balance.\n\nThis endpoint retrieves cached information, rather than extracting fresh information from the institution. As a result, balances returned may not be up-to-date; for realtime balance information, use `/accounts/balance/get` instead."}
    
    #{""}
    
    #{""}
    "
    @spec accounts_get(Tesla.Client.t()) ::
            {:ok, Plaid.AccountsGetResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(accounts_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/accounts/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.AccountsGetResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(accounts_get: 1)
  )

  (
    @doc "#{"Refresh an income verification"}
    
    #{"`/income/verification/refresh` refreshes a given income verification."}
    
    #{""}
    
    #{""}
    "
    @spec income_verification_refresh(Tesla.Client.t()) ::
            {:ok, Plaid.IncomeVerificationRefreshResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(income_verification_refresh(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/income/verification/refresh")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.IncomeVerificationRefreshResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(income_verification_refresh: 1)
  )

  (
    @doc "#{"Force a Sandbox Item into an error state"}
    
    #{"`/sandbox/item/reset_login/` forces an Item into an `ITEM_LOGIN_REQUIRED` state in order to simulate an Item whose login is no longer valid. This makes it easy to test Link's [update mode](https://plaid.com/docs/link/update-mode) flow in the Sandbox environment.  After calling `/sandbox/item/reset_login`, You can then use Plaid Link update mode to restore the Item to a good state. An `ITEM_LOGIN_REQUIRED` webhook will also be fired after a call to this endpoint, if one is associated with the Item.\n\n\nIn the Sandbox, Items will transition to an `ITEM_LOGIN_REQUIRED` error state automatically after 30 days, even if this endpoint is not called."}
    
    #{""}
    
    #{""}
    "
    @spec sandbox_item_reset_login(Tesla.Client.t()) ::
            {:ok, Plaid.SandboxItemResetLoginResponse.t()} | {:error, any}
    def(sandbox_item_reset_login(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/item/reset_login")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.SandboxItemResetLoginResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(sandbox_item_reset_login: 1)
  )

  (
    @doc "#{"Evaluate a planned ACH transaction"}
    
    #{"Use `/signal/evaluate` to evaluate a planned ACH transaction to get a return risk assessment (such as a risk score and risk tier) and additional risk signals.\n\nIn order to obtain a valid score for an ACH transaction, Plaid must have an access token for the account, and the Item must be healthy (receiving product updates) or have recently been in a healthy state. If the transaction does not meet eligibility requirements, an error will be returned corresponding to the underlying cause."}
    
    #{""}
    
    #{""}
    "
    @spec signal_evaluate(Tesla.Client.t()) ::
            {:ok, Plaid.SignalEvaluateResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(signal_evaluate(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/signal/evaluate")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.SignalEvaluateResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(signal_evaluate: 1)
  )

  (
    @doc "#{"Search employer database"}
    
    #{"`/employers/search` allows you the ability to search Plaid’s database of known employers, for use with Deposit Switch. You can use this endpoint to look up a user's employer in order to confirm that they are supported. Users with non-supported employers can then be routed out of the Deposit Switch flow.\n\nThe data in the employer database is currently limited. As the Deposit Switch and Income products progress through their respective beta periods, more employers are being regularly added. Because the employer database is frequently updated, we recommend that you do not cache or store data from this endpoint for more than a day."}
    
    #{""}
    
    #{""}
    "
    @spec employers_search(Tesla.Client.t()) ::
            {:ok, Plaid.EmployersSearchResponse.t()} | {:error, any}
    def(employers_search(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/employers/search")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.EmployersSearchResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(employers_search: 1)
  )

  (
    @doc "#{"Retrieve a transfer"}
    
    #{"The `/transfer/get` fetches information about the transfer corresponding to the given `transfer_id`."}
    
    #{""}
    
    #{""}
    "
    @spec transfer_get(Tesla.Client.t()) ::
            {:ok, Plaid.TransferGetResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(transfer_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transfer/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.TransferGetResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(transfer_get: 1)
  )

  (
    @doc "#{"Create processor token"}
    
    #{"Used to create a token suitable for sending to one of Plaid's partners to enable integrations. Note that Stripe partnerships use bank account tokens instead; see `/processor/stripe/bank_account_token/create` for creating tokens for use with Stripe integrations."}
    
    #{""}
    
    #{""}
    "
    @spec processor_token_create(Tesla.Client.t()) ::
            {:ok, Plaid.ProcessorTokenCreateResponse.t()} | {:error, any}
    def(processor_token_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/processor/token/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ProcessorTokenCreateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(processor_token_create: 1)
  )

  (
    @doc "#{"Create a transfer"}
    
    #{"Use the `/transfer/create` endpoint to initiate a new transfer."}
    
    #{""}
    
    #{""}
    "
    @spec transfer_create(Tesla.Client.t()) ::
            {:ok, Plaid.TransferCreateResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(transfer_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transfer/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.TransferCreateResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(transfer_create: 1)
  )

  (
    @doc "#{"Refresh transaction data"}
    
    #{"`/transactions/refresh` is an optional endpoint for users of the Transactions product. It initiates an on-demand extraction to fetch the newest transactions for an Item. This on-demand extraction takes place in addition to the periodic extractions that automatically occur multiple times a day for any Transactions-enabled Item. If changes to transactions are discovered after calling `/transactions/refresh`, Plaid will fire a webhook: [`TRANSACTIONS_REMOVED`](https://plaid.com/docs/api/webhooks#deleted-transactions-detected) will be fired if any removed transactions are detected, and [`DEFAULT_UPDATE`](https://plaid.com/docs/api/webhooks#transactions-default_update) will be fired if any new transactions are detected. New transactions can be fetched by calling `/transactions/get`.\n\nAccess to `/transactions/refresh` in Production is specific to certain pricing plans. If you cannot access `/transactions/refresh` in Production, [contact Sales](https://www.plaid.com/contact) for assistance."}
    
    #{""}
    
    #{""}
    "
    @spec transactions_refresh(Tesla.Client.t()) ::
            {:ok, Plaid.TransactionsRefreshResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(transactions_refresh(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transactions/refresh")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.TransactionsRefreshResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(transactions_refresh: 1)
  )

  (
    @doc "#{"Get investment transactions"}
    
    #{"The `/investments/transactions/get` endpoint allows developers to retrieve user-authorized transaction data for investment accounts.\n\nTransactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and will not shift.\n\nDue to the potentially large number of investment transactions associated with an Item, results are paginated. Manipulate the count and offset parameters in conjunction with the `total_investment_transactions` response body field to fetch all available investment transactions."}
    
    #{""}
    
    #{""}
    "
    @spec investments_transactions_get(Tesla.Client.t()) ::
            {:ok, Plaid.InvestmentsTransactionsGetResponse.t()} | {:error, any}
    def(investments_transactions_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/investments/transactions/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.InvestmentsTransactionsGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(investments_transactions_get: 1)
  )

  (
    @doc "#{"List payment recipients"}
    
    #{"The `/payment_initiation/recipient/list` endpoint list the payment recipients that you have previously created."}
    
    #{""}
    
    #{""}
    "
    @spec payment_initiation_recipient_list(Tesla.Client.t()) ::
            {:ok, Plaid.PaymentInitiationRecipientListResponse.t()} | {:error, any}
    def(payment_initiation_recipient_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/payment_initiation/recipient/list")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.PaymentInitiationRecipientListResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(payment_initiation_recipient_list: 1)
  )

  (
    @doc "#{"Manually fire a Bank Transfer webhook"}
    
    #{"Use the `/sandbox/bank_transfer/fire_webhook` endpoint to manually trigger a Bank Transfers webhook in the Sandbox environment."}
    
    #{""}
    
    #{""}
    "
    @spec sandbox_bank_transfer_fire_webhook(Tesla.Client.t()) ::
            {:ok, Plaid.SandboxBankTransferFireWebhookResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(sandbox_bank_transfer_fire_webhook(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/bank_transfer/fire_webhook")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.SandboxBankTransferFireWebhookResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(sandbox_bank_transfer_fire_webhook: 1)
  )

  (
    @doc "#{"Create public token"}
    
    #{"Note: As of July 2020, the `/item/public_token/create` endpoint is deprecated. Instead, use `/link/token/create` with an `access_token` to create a Link token for use with [update mode](https://plaid.com/docs/link/update-mode).\n\nIf you need your user to take action to restore or resolve an error associated with an Item, generate a public token with the `/item/public_token/create` endpoint and then initialize Link with that `public_token`.\n\nA `public_token` is one-time use and expires after 30 minutes. You use a `public_token` to initialize Link in [update mode](https://plaid.com/docs/link/update-mode) for a particular Item. You can generate a `public_token` for an Item even if you did not use Link to create the Item originally.\n\nThe `/item/public_token/create` endpoint is **not** used to create your initial `public_token`. If you have not already received an `access_token` for a specific Item, use Link to obtain your `public_token` instead. See the [Quickstart](https://plaid.com/docs/quickstart) for more information."}
    
    #{""}
    
    #{""}
    "
    @spec item_create_public_token(Tesla.Client.t()) ::
            {:ok, Plaid.ItemPublicTokenCreateResponse.t()} | {:error, any}
    def(item_create_public_token(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/public_token/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ItemPublicTokenCreateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(item_create_public_token: 1)
  )

  (
    @doc "#{"Sync transfer events"}
    
    #{"`/transfer/event/sync` allows you to request up to the next 25 transfer events that happened after a specific `event_id`. Use the `/transfer/event/sync` endpoint to guarantee you have seen all transfer events."}
    
    #{""}
    
    #{""}
    "
    @spec transfer_event_sync(Tesla.Client.t()) ::
            {:ok, Plaid.TransferEventSyncResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(transfer_event_sync(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transfer/event/sync")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.TransferEventSyncResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(transfer_event_sync: 1)
  )

  (
    @doc "#{"Retrieve information about a Plaid application"}
    
    #{"Allows financial institutions to retrieve information about Plaid clients for the purpose of building control-tower experiences"}
    
    #{""}
    
    #{""}
    "
    @spec application_get(Tesla.Client.t()) ::
            {:ok, Plaid.ApplicationGetResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(application_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/application/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ApplicationGetResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(application_get: 1)
  )

  (
    @doc "#{"Get payment recipient"}
    
    #{"Get details about a payment recipient you have previously created."}
    
    #{""}
    
    #{""}
    "
    @spec payment_initiation_recipient_get(Tesla.Client.t()) :: {:ok, any} | {:error, any}
    def(payment_initiation_recipient_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/payment_initiation/recipient/get")) do
        {:ok, %{status: 200, body: body}} ->
          {:ok, body}

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(payment_initiation_recipient_get: 1)
  )

  (
    @doc "#{"Create Apex bank account token"}
    
    #{"Used to create a token suitable for sending to Apex to enable Plaid-Apex integrations."}
    
    #{""}
    
    #{""}
    "
    @spec processor_apex_processor_token_create(Tesla.Client.t()) ::
            {:ok, Plaid.ProcessorTokenCreateResponse.t()} | {:error, any}
    def(processor_apex_processor_token_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/processor/apex/processor_token/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ProcessorTokenCreateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(processor_apex_processor_token_create: 1)
  )

  (
    @doc "#{"List payments"}
    
    #{"The `/payment_initiation/payment/list` endpoint can be used to retrieve all created payments. By default, the 10 most recent payments are returned. You can request more payments and paginate through the results using the optional `count` and `cursor` parameters."}
    
    #{""}
    
    #{""}
    "
    @spec payment_initiation_payment_list(Tesla.Client.t()) ::
            {:ok, Plaid.PaymentInitiationPaymentListResponse.t()} | {:error, any}
    def(payment_initiation_payment_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/payment_initiation/payment/list")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.PaymentInitiationPaymentListResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(payment_initiation_payment_list: 1)
  )

  (
    @doc "#{"Retrieve Auth data"}
    
    #{"The `/processor/auth/get` endpoint returns the bank account and bank identification number (such as the routing number, for US accounts), for a checking or savings account that's associated with a given `processor_token`. The endpoint also returns high-level account data and balances when available."}
    
    #{""}
    
    #{""}
    "
    @spec processor_auth_get(Tesla.Client.t()) ::
            {:ok, Plaid.ProcessorAuthGetResponse.t()} | {:error, any}
    def(processor_auth_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/processor/auth/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ProcessorAuthGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(processor_auth_get: 1)
  )

  (
    @doc "#{"Simulate a bank transfer event in Sandbox"}
    
    #{"Use the `/sandbox/bank_transfer/simulate` endpoint to simulate a bank transfer event in the Sandbox environment.  Note that while an event will be simulated and will appear when using endpoints such as `/bank_transfer/event/sync` or `/bank_transfer/event/list`, no transactions will actually take place and funds will not move between accounts, even within the Sandbox."}
    
    #{""}
    
    #{""}
    "
    @spec sandbox_bank_transfer_simulate(Tesla.Client.t()) ::
            {:ok, Plaid.SandboxBankTransferSimulateResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(sandbox_bank_transfer_simulate(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/bank_transfer/simulate")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.SandboxBankTransferSimulateResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(sandbox_bank_transfer_simulate: 1)
  )

  (
    @doc "#{"List transfers"}
    
    #{"Use the `/transfer/list` endpoint to see a list of all your transfers and their statuses. Results are paginated; use the `count` and `offset` query parameters to retrieve the desired transfers.\n"}
    
    #{""}
    
    #{""}
    "
    @spec transfer_list(Tesla.Client.t()) ::
            {:ok, Plaid.TransferListResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(transfer_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transfer/list")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.TransferListResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(transfer_list: 1)
  )

  (
    @doc "#{"Set verification status for Sandbox account"}
    
    #{"The `/sandbox/item/set_verification_status` endpoint can be used to change the verification status of an Item in in the Sandbox in order to simulate the Automated Micro-deposit flow.\n\nNote that not all Plaid developer accounts are enabled for micro-deposit based verification by default. Your account must be enabled for this feature in order to test it in Sandbox. To enable this features or check your status, contact your account manager or [submit a product access Support ticket](https://dashboard.plaid.com/support/new/product-and-development/product-troubleshooting/request-product-access).\n\nFor more information on testing Automated Micro-deposits in Sandbox, see [Auth full coverage testing](https://plaid.com/docs/auth/coverage/testing#)."}
    
    #{""}
    
    #{""}
    "
    @spec sandbox_item_set_verification_status(Tesla.Client.t()) ::
            {:ok, Plaid.SandboxItemSetVerificationStatusResponse.t()} | {:error, any}
    def(sandbox_item_set_verification_status(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/item/set_verification_status")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.SandboxItemSetVerificationStatusResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(sandbox_item_set_verification_status: 1)
  )

  (
    @doc "#{"Remove an Item"}
    
    #{"The `/item/remove`  endpoint allows you to remove an Item. Once removed, the `access_token`  associated with the Item is no longer valid and cannot be used to access any data that was associated with the Item.\n\nNote that in the Development environment, issuing an `/item/remove`  request will not decrement your live credential count. To increase your credential account in Development, contact Support.\n\nAlso note that for certain OAuth-based institutions, an Item removed via `/item/remove` may still show as an active connection in the institution's OAuth permission manager."}
    
    #{""}
    
    #{""}
    "
    @spec item_remove(Tesla.Client.t()) ::
            {:ok, Plaid.ItemRemoveResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(item_remove(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/remove")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ItemRemoveResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(item_remove: 1)
  )

  (
    @doc "#{"List bank transfer events"}
    
    #{"Use the `/bank_transfer/event/list` endpoint to get a list of bank transfer events based on specified filter criteria."}
    
    #{""}
    
    #{""}
    "
    @spec bank_transfer_event_list(Tesla.Client.t()) ::
            {:ok, Plaid.BankTransferEventListResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(bank_transfer_event_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/event/list")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.BankTransferEventListResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(bank_transfer_event_list: 1)
  )

  (
    @doc "#{"Cancel a bank transfer"}
    
    #{"Use the `/bank_transfer/cancel` endpoint to cancel a bank transfer.  A transfer is eligible for cancelation if the `cancellable` property returned by `/bank_transfer/get` is `true`."}
    
    #{""}
    
    #{""}
    "
    @spec bank_transfer_cancel(Tesla.Client.t()) ::
            {:ok, Plaid.BankTransferCancelResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(bank_transfer_cancel(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/cancel")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.BankTransferCancelResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(bank_transfer_cancel: 1)
  )

  (
    @doc "#{"Create an Asset Report"}
    
    #{"The `/asset_report/create` endpoint initiates the process of creating an Asset Report, which can then be retrieved by passing the `asset_report_token` return value to the `/asset_report/get` or `/asset_report/pdf/get` endpoints.\n\nThe Asset Report takes some time to be created and is not available immediately after calling `/asset_report/create`. When the Asset Report is ready to be retrieved using `/asset_report/get` or `/asset_report/pdf/get`, Plaid will fire a `PRODUCT_READY` webhook. For full details of the webhook schema, see [Asset Report webhooks](https://plaid.com/docs/api/webhooks/#Assets-webhooks).\n\nThe `/asset_report/create` endpoint creates an Asset Report at a moment in time. Asset Reports are immutable. To get an updated Asset Report, use the `/asset_report/refresh` endpoint."}
    
    #{""}
    
    #{""}
    "
    @spec asset_report_create(Tesla.Client.t()) ::
            {:ok, Plaid.AssetReportCreateResponse.t()} | {:error, any}
    def(asset_report_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.AssetReportCreateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(asset_report_create: 1)
  )

  (
    @doc "#{"Create a deposit switch without using Plaid Exchange"}
    
    #{"This endpoint provides an alternative to `/deposit_switch/create` for customers who have not yet fully integrated with Plaid Exchange. Like `/deposit_switch/create`, it creates a deposit switch entity that will be persisted throughout the lifecycle of the switch."}
    
    #{""}
    
    #{""}
    "
    @spec deposit_switch_alt_create(Tesla.Client.t()) ::
            {:ok, Plaid.DepositSwitchAltCreateResponse.t()} | {:error, any}
    def(deposit_switch_alt_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/deposit_switch/alt/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.DepositSwitchAltCreateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(deposit_switch_alt_create: 1)
  )

  (
    @doc "#{"Retrieve real-time balance data"}
    
    #{"The `/accounts/balance/get` endpoint returns the real-time balance for each of an Item's accounts. While other endpoints may return a balance object, only `/accounts/balance/get` forces the available and current balance fields to be refreshed rather than cached. This endpoint can be used for existing Items that were added via any of Plaid’s other products. This endpoint can be used as long as Link has been initialized with any other product, `balance` itself is not a product that can be used to initialize Link."}
    
    #{""}
    
    #{""}
    "
    @spec accounts_balance_get(Tesla.Client.t()) ::
            {:ok, Plaid.AccountsGetResponse.t()} | {:error, any}
    def(accounts_balance_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/accounts/balance/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.AccountsGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(accounts_balance_get: 1)
  )

  (
    @doc "#{"Get webhook verification key"}
    
    #{"Plaid signs all outgoing webhooks and provides JSON Web Tokens (JWTs) so that you can verify the authenticity of any incoming webhooks to your application. A message signature is included in the `Plaid-Verification` header.\n\nThe `/webhook_verification_key/get` endpoint provides a JSON Web Key (JWK) that can be used to verify a JWT."}
    
    #{""}
    
    #{""}
    "
    @spec webhook_verification_key_get(Tesla.Client.t()) ::
            {:ok, Plaid.WebhookVerificationKeyGetResponse.t()} | {:error, any}
    def(webhook_verification_key_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/webhook_verification_key/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.WebhookVerificationKeyGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(webhook_verification_key_get: 1)
  )

  (
    @doc "#{"Retrieve Balance data"}
    
    #{"The `/processor/balance/get` endpoint returns the real-time balance for each of an Item's accounts. While other endpoints may return a balance object, only `/processor/balance/get` forces the available and current balance fields to be refreshed rather than cached. "}
    
    #{""}
    
    #{""}
    "
    @spec processor_balance_get(Tesla.Client.t()) ::
            {:ok, Plaid.ProcessorBalanceGetResponse.t()} | {:error, any}
    def(processor_balance_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/processor/balance/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ProcessorBalanceGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(processor_balance_get: 1)
  )

  (
    @doc "#{"Create payment token"}
    
    #{"The `/payment_initiation/payment/token/create` endpoint has been deprecated. New Plaid customers will be unable to use this endpoint, and existing customers are encouraged to migrate to the newer, `link_token`-based flow. The recommended flow is to provide the `payment_id` to `/link/token/create`, which returns a `link_token` used to initialize Link.\n\nThe `/payment_initiation/payment/token/create` is used to create a `payment_token`, which can then be used in Link initialization to enter a payment initiation flow. You can only use a `payment_token` once. If this attempt fails, the end user aborts the flow, or the token expires, you will need to create a new payment token. Creating a new payment token does not require end user input."}
    
    #{""}
    
    #{""}
    "
    @spec create_payment_token(Tesla.Client.t()) ::
            {:ok, Plaid.PaymentInitiationPaymentTokenCreateResponse.t()} | {:error, any}
    def(create_payment_token(client \\ new())) do
      case(
        Tesla.request(client, method: :post, url: "/payment_initiation/payment/token/create")
      ) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.PaymentInitiationPaymentTokenCreateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(create_payment_token: 1)
  )

  (
    @doc "#{"Retrieve information from the paystubs used for income verification"}
    
    #{"`/income/verification/paystubs/get` returns the information collected from the paystubs that were used to verify an end user's income. It can be called once the status of the verification has been set to `VERIFICATION_STATUS_PROCESSING_COMPLETE`, as reported by the `INCOME: verification_status` webhook. Attempting to call the endpoint before verification has been completed will result in an error."}
    
    #{""}
    
    #{""}
    "
    @spec income_verification_paystubs_get(Tesla.Client.t()) ::
            {:ok, Plaid.IncomeVerificationPaystubsGetResponse.t()} | {:error, any}
    def(income_verification_paystubs_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/income/verification/paystubs/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.IncomeVerificationPaystubsGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(income_verification_paystubs_get: 1)
  )

  (
    @doc "#{"Create a payment"}
    
    #{"After creating a payment recipient, you can use the `/payment_initiation/payment/create` endpoint to create a payment to that recipient.  Payments can be one-time or standing order (recurring) and can be denominated in either EUR or GBP.  If making domestic GBP-denominated payments, your recipient must have been created with BACS numbers. In general, EUR-denominated payments will be sent via SEPA Credit Transfer and GBP-denominated payments will be sent via the Faster Payments network, but the payment network used will be determined by the institution. Payments sent via Faster Payments will typically arrive immediately, while payments sent via SEPA Credit Transfer will typically arrive in one business day.\n\nStanding orders (recurring payments) must be denominated in GBP and can only be sent to recipients in the UK. Once created, standing order payments cannot be modified or canceled via the API. An end user can cancel or modify a standing order directly on their banking application or website, or by contacting the bank. Standing orders will follow the payment rules of the underlying rails (Faster Payments in UK). Payments can be sent Monday to Friday, excluding bank holidays. If the pre-arranged date falls on a weekend or bank holiday, the payment is made on the next working day. It is not possible to guarantee the exact time the payment will reach the recipient’s account, although at least 90% of standing order payments are sent by 6am.\n\nIn the Development environment, payments must be below 5 GBP / EUR. For details on any payment limits in Production, contact your Plaid Account Manager."}
    
    #{""}
    
    #{""}
    "
    @spec payment_initiation_payment_create(Tesla.Client.t()) ::
            {:ok, Plaid.PaymentInitiationPaymentCreateResponse.t()} | {:error, any}
    def(payment_initiation_payment_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/payment_initiation/payment/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.PaymentInitiationPaymentCreateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(payment_initiation_payment_create: 1)
  )

  (
    @doc "#{"Exchange public token for an access token"}
    
    #{"Exchange a Link `public_token` for an API `access_token`. Link hands off the `public_token` client-side via the `onSuccess` callback once a user has successfully created an Item. The `public_token` is ephemeral and expires after 30 minutes.\n\nThe response also includes an `item_id` that should be stored with the `access_token`. The `item_id` is used to identify an Item in a webhook. The `item_id` can also be retrieved by making an `/item/get` request."}
    
    #{""}
    
    #{""}
    "
    @spec item_public_token_exchange(Tesla.Client.t()) ::
            {:ok, Plaid.ItemPublicTokenExchangeResponse.t()} | {:error, any}
    def(item_public_token_exchange(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/public_token/exchange")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ItemPublicTokenExchangeResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(item_public_token_exchange: 1)
  )

  (
    @doc "#{"Create Asset Report Audit Copy"}
    
    #{"Plaid can provide an Audit Copy of any Asset Report directly to a participating third party on your behalf. For example, Plaid can supply an Audit Copy directly to Fannie Mae on your behalf if you participate in the Day 1 Certainty™ program. An Audit Copy contains the same underlying data as the Asset Report.\n\nTo grant access to an Audit Copy, use the `/asset_report/audit_copy/create` endpoint to create an `audit_copy_token` and then pass that token to the third party who needs access. Each third party has its own `auditor_id`, for example `fannie_mae`. You’ll need to create a separate Audit Copy for each third party to whom you want to grant access to the Report."}
    
    #{""}
    
    #{""}
    "
    @spec asset_report_audit_copy_create(Tesla.Client.t()) ::
            {:ok, Plaid.AssetReportAuditCopyCreateResponse.t()} | {:error, any}
    def(asset_report_audit_copy_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/audit_copy/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.AssetReportAuditCopyCreateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(asset_report_audit_copy_create: 1)
  )

  (
    @doc "#{"Get balance of your Bank Transfer account"}
    
    #{"Use the `/bank_transfer/balance/get` endpoint to see the available balance in your bank transfer account. Debit transfers increase this balance once their status is posted. Credit transfers decrease this balance when they are created.\n\nThe transactable balance shows the amount in your account that you are able to use for transfers, and is essentially your available balance minus your minimum balance.\n\nNote that this endpoint can only be used with FBO accounts, when using Bank Transfers in the Full Service configuration. It cannot be used on your own account when using Bank Transfers in the BTS Platform configuration."}
    
    #{""}
    
    #{""}
    "
    @spec bank_transfer_balance_get(Tesla.Client.t()) ::
            {:ok, Plaid.BankTransferBalanceGetResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(bank_transfer_balance_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/balance/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.BankTransferBalanceGetResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(bank_transfer_balance_get: 1)
  )

  (
    @doc "#{"Retrieve auth data"}
    
    #{"The `/auth/get` endpoint returns the bank account and bank identification numbers (such as routing numbers, for US accounts) associated with an Item's checking and savings accounts, along with high-level account data and balances when available.\n\nNote: This request may take some time to complete if `auth` was not specified as an initial product when creating the Item. This is because Plaid must communicate directly with the institution to retrieve the data.\n\nAlso note that `/auth/get` will not return data for any new accounts opened after the Item was created. To obtain data for new accounts, create a new Item."}
    
    #{""}
    
    #{""}
    "
    @spec auth_get(Tesla.Client.t()) ::
            {:ok, Plaid.AuthGetResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(auth_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/auth/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.AuthGetResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(auth_get: 1)
  )

  (
    @doc "#{"Get Categories"}
    
    #{"Send a request to the `/categories/get`  endpoint to get detailed information on categories returned by Plaid. This endpoint does not require authentication."}
    
    #{""}
    
    #{""}
    "
    @spec categories_get(Tesla.Client.t()) ::
            {:ok, Plaid.CategoriesGetResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(categories_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/categories/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.CategoriesGetResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(categories_get: 1)
  )

  (
    @doc "#{"Refresh an Asset Report"}
    
    #{"An Asset Report is an immutable snapshot of a user's assets. In order to \"refresh\" an Asset Report you created previously, you can use the `/asset_report/refresh` endpoint to create a new Asset Report based on the old one, but with the most recent data available.\n\nThe new Asset Report will contain the same Items as the original Report, as well as the same filters applied by any call to `/asset_report/filter`. By default, the new Asset Report will also use the same parameters you submitted with your original `/asset_report/create` request, but the original `days_requested` value and the values of any parameters in the `options` object can be overridden with new values. To change these arguments, simply supply new values for them in your request to `/asset_report/refresh`. Submit an empty string (\"\") for any previously-populated fields you would like set as empty."}
    
    #{""}
    
    #{""}
    "
    @spec asset_report_refresh(Tesla.Client.t()) ::
            {:ok, Plaid.AssetReportRefreshResponse.t()} | {:error, any}
    def(asset_report_refresh(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/refresh")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.AssetReportRefreshResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(asset_report_refresh: 1)
  )

  (
    @doc "#{"Retrieve a sweep"}
    
    #{"The `/bank_transfer/sweep/get` endpoint fetches information about the sweep corresponding to the given `sweep_id`."}
    
    #{""}
    
    #{""}
    "
    @spec bank_transfer_sweep_get(Tesla.Client.t()) ::
            {:ok, Plaid.BankTransferSweepGetResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(bank_transfer_sweep_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/sweep/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.BankTransferSweepGetResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(bank_transfer_sweep_get: 1)
  )

  (
    @doc "#{"Create a test Item"}
    
    #{"Use the `/sandbox/public_token/create`  endpoint to create a valid `public_token`  for an arbitrary institution ID, initial products, and test credentials. The created `public_token` maps to a new Sandbox Item. You can then call `/item/public_token/exchange` to exchange the `public_token` for an `access_token` and perform all API actions. `/sandbox/public_token/create` can also be used with the [`user_custom` test username](https://plaid.com/docs/sandbox/user-custom) to generate a test account with custom data."}
    
    #{""}
    
    #{""}
    "
    @spec sandbox_public_token_create(Tesla.Client.t()) ::
            {:ok, Plaid.SandboxPublicTokenCreateResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(sandbox_public_token_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/public_token/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.SandboxPublicTokenCreateResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(sandbox_public_token_create: 1)
  )

  (
    @doc "#{"Search institutions"}
    
    #{"Returns a JSON response containing details for institutions that match the query parameters, up to a maximum of ten institutions per query."}
    
    #{""}
    
    #{""}
    "
    @spec institutions_search(Tesla.Client.t()) ::
            {:ok, Plaid.InstitutionsSearchResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(institutions_search(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/institutions/search")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.InstitutionsSearchResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(institutions_search: 1)
  )

  (
    @doc "#{"List a user’s connected applications"}
    
    #{"List a user’s connected applications"}
    
    #{""}
    
    #{""}
    "
    @spec item_application_list(Tesla.Client.t()) ::
            {:ok, Plaid.ItemApplicationListResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(item_application_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/application/list")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ItemApplicationListResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(item_application_list: 1)
  )

  (
    @doc "#{"Invalidate access_token"}
    
    #{"By default, the `access_token` associated with an Item does not expire and should be stored in a persistent, secure manner.\n\nYou can use the `/item/access_token/invalidate` endpoint to rotate the `access_token` associated with an Item. The endpoint returns a new `access_token` and immediately invalidates the previous `access_token`.\n"}
    
    #{""}
    
    #{""}
    "
    @spec item_access_token_invalidate(Tesla.Client.t()) ::
            {:ok, Plaid.ItemAccessTokenInvalidateResponse.t()} | {:error, any}
    def(item_access_token_invalidate(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/access_token/invalidate")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ItemAccessTokenInvalidateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(item_access_token_invalidate: 1)
  )

  (
    @doc "#{"Retrieve an Item"}
    
    #{"Returns information about the status of an Item."}
    
    #{""}
    
    #{""}
    "
    @spec item_get(Tesla.Client.t()) ::
            {:ok, Plaid.ItemGetResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(item_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ItemGetResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(item_get: 1)
  )

  (
    @doc "#{"Retrieve Identity data"}
    
    #{"The `/processor/identity/get` endpoint allows you to retrieve various account holder information on file with the financial institution, including names, emails, phone numbers, and addresses."}
    
    #{""}
    
    #{""}
    "
    @spec processor_identity_get(Tesla.Client.t()) ::
            {:ok, Plaid.ProcessorIdentityGetResponse.t()} | {:error, any}
    def(processor_identity_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/processor/identity/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ProcessorIdentityGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(processor_identity_get: 1)
  )

  (
    @doc "#{"Report a return for an ACH transaction"}
    
    #{"Call the `/signal/return/report` endpoint to report a returned transaction that was previously sent to the `/signal/evaluate` endpoint. Your feedback will be used by the model to incorporate the latest risk trend in your portfolio."}
    
    #{""}
    
    #{""}
    "
    @spec signal_return_report(Tesla.Client.t()) ::
            {:ok, Plaid.SignalReturnReportResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(signal_return_report(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/signal/return/report")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.SignalReturnReportResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(signal_return_report: 1)
  )

  (
    @doc "#{"Retrieve information from the tax documents used for income verification"}
    
    #{"`/income/verification/taxforms/get` returns the information collected from taxforms that were used to verify an end user's. It can be called once the status of the verification has been set to `VERIFICATION_STATUS_PROCESSING_COMPLETE`, as reported by the `INCOME: verification_status` webhook. Attempting to call the endpoint before verification has been completed will result in an error."}
    
    #{""}
    
    #{""}
    "
    @spec income_verification_taxforms_get(Tesla.Client.t()) ::
            {:ok, Plaid.IncomeVerificationTaxformsGetResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(income_verification_taxforms_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/income/verification/taxforms/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.IncomeVerificationTaxformsGetResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(income_verification_taxforms_get: 1)
  )

  (
    @doc "#{"Create Link Token"}
    
    #{"The `/link/token/create` endpoint creates a `link_token`, which is required as a parameter when initializing Link. Once Link has been initialized, it returns a `public_token`, which can then be exchanged for an `access_token` via `/item/public_token/exchange` as part of the main Link flow.\n\nA `link_token` generated by `/link/token/create` is also used to initialize other Link flows, such as the update mode flow for tokens with expired credentials, or the Payment Initiation (Europe) flow."}
    
    #{""}
    
    #{""}
    "
    @spec link_token_create(Tesla.Client.t()) ::
            {:ok, Plaid.LinkTokenCreateResponse.t()} | {:error, any}
    def(link_token_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/link/token/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.LinkTokenCreateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(link_token_create: 1)
  )

  (
    @doc "#{"Get details of an institution"}
    
    #{"Returns a JSON response containing details on a specified financial institution currently supported by Plaid."}
    
    #{""}
    
    #{""}
    "
    @spec institutions_get_by_id(Tesla.Client.t()) ::
            {:ok, Plaid.InstitutionsGetByIdResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(institutions_get_by_id(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/institutions/get_by_id")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.InstitutionsGetByIdResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(institutions_get_by_id: 1)
  )

  (
    @doc "#{"Get Investment holdings"}
    
    #{"The `/investments/holdings/get` endpoint allows developers to receive user-authorized stock position data for `investment`-type accounts."}
    
    #{""}
    
    #{""}
    "
    @spec investments_holdings_get(Tesla.Client.t()) ::
            {:ok, Plaid.InvestmentsHoldingsGetResponse.t()} | {:error, any}
    def(investments_holdings_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/investments/holdings/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.InvestmentsHoldingsGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(investments_holdings_get: 1)
  )

  (
    @doc "#{"Simulate a transfer event in Sandbox"}
    
    #{"Use the `/sandbox/transfer/simulate` endpoint to simulate a transfer event in the Sandbox environment.  Note that while an event will be simulated and will appear when using endpoints such as `/transfer/event/sync` or `/transfer/event/list`, no transactions will actually take place and funds will not move between accounts, even within the Sandbox."}
    
    #{""}
    
    #{""}
    "
    @spec sandbox_transfer_simulate(Tesla.Client.t()) ::
            {:ok, Plaid.SandboxTransferSimulateResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(sandbox_transfer_simulate(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/transfer/simulate")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.SandboxTransferSimulateResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(sandbox_transfer_simulate: 1)
  )

  (
    @doc "#{"Delete an Asset Report"}
    
    #{"The `/item/remove` endpoint allows you to invalidate an `access_token`, meaning you will not be able to create new Asset Reports with it. Removing an Item does not affect any Asset Reports or Audit Copies you have already created, which will remain accessible until you remove them specifically.\n\nThe `/asset_report/remove` endpoint allows you to remove an Asset Report. Removing an Asset Report invalidates its `asset_report_token`, meaning you will no longer be able to use it to access Report data or create new Audit Copies. Removing an Asset Report does not affect the underlying Items, but does invalidate any `audit_copy_tokens` associated with the Asset Report."}
    
    #{""}
    
    #{""}
    "
    @spec asset_report_remove(Tesla.Client.t()) ::
            {:ok, Plaid.AssetReportRemoveResponse.t()} | {:error, any}
    def(asset_report_remove(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/remove")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.AssetReportRemoveResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(asset_report_remove: 1)
  )

  (
    @doc "#{"Create a bank transfer as a processor"}
    
    #{"Use the `/processor/bank_transfer/create` endpoint to initiate a new bank transfer as a processor"}
    
    #{""}
    
    #{""}
    "
    @spec processor_bank_transfer_create(Tesla.Client.t()) ::
            {:ok, Plaid.ProcessorBankTransferCreateResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(processor_bank_transfer_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/processor/bank_transfer/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ProcessorBankTransferCreateResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(processor_bank_transfer_create: 1)
  )

  (
    @doc "#{"Retrieve a PDF Asset Report"}
    
    #{"The `/asset_report/pdf/get` endpoint retrieves the Asset Report in PDF format. Before calling `/asset_report/pdf/get`, you must first create the Asset Report using `/asset_report/create` (or filter an Asset Report using `/asset_report/filter`) and then wait for the [`PRODUCT_READY`](https://plaid.com/docs/api/webhooks) webhook to fire, indicating that the Report is ready to be retrieved.\n\nThe response to `/asset_report/pdf/get` is the PDF binary data. The `request_id`  is returned in the `Plaid-Request-ID` header.\n\n[View a sample PDF Asset Report](https://plaid.com/documents/sample-asset-report.pdf)."}
    
    #{""}
    
    #{""}
    "
    @spec asset_report_pdf_get(Tesla.Client.t()) :: {:ok, binary} | {:error, any}
    def(asset_report_pdf_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/pdf/get")) do
        {:ok, %{status: 200, body: body}} ->
          case(body) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, ["AssetReportPDFGetResponse"]}}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(asset_report_pdf_get: 1)
  )

  (
    @doc "#{"Save the selected accounts when connecting to the Platypus Oauth institution"}
    
    #{nil}
    
    #{""}
    
    #{""}
    "
    @spec sandbox_oauth_select_accounts(Tesla.Client.t()) ::
            {:ok, Plaid.SandboxOauthSelectAccountsResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(sandbox_oauth_select_accounts(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/oauth/select_accounts")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.SandboxOauthSelectAccountsResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(sandbox_oauth_select_accounts: 1)
  )

  (
    @doc "#{"Cancel a transfer"}
    
    #{"Use the `/transfer/cancel` endpoint to cancel a transfer.  A transfer is eligible for cancelation if the `cancellable` property returned by `/transfer/get` is `true`."}
    
    #{""}
    
    #{""}
    "
    @spec transfer_cancel(Tesla.Client.t()) ::
            {:ok, Plaid.TransferCancelResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(transfer_cancel(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transfer/cancel")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.TransferCancelResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(transfer_cancel: 1)
  )

  (
    @doc "#{"Retrieve a deposit switch"}
    
    #{"This endpoint returns information related to how the user has configured their payroll allocation and the state of the switch. You can use this information to build logic related to the user's direct deposit allocation preferences."}
    
    #{""}
    
    #{""}
    "
    @spec deposit_switch_get(Tesla.Client.t()) ::
            {:ok, Plaid.DepositSwitchGetResponse.t()} | {:error, any}
    def(deposit_switch_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/deposit_switch/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.DepositSwitchGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(deposit_switch_get: 1)
  )

  (
    @doc "#{"Remove Asset Report Audit Copy"}
    
    #{"The `/asset_report/audit_copy/remove` endpoint allows you to remove an Audit Copy. Removing an Audit Copy invalidates the `audit_copy_token` associated with it, meaning both you and any third parties holding the token will no longer be able to use it to access Report data. Items associated with the Asset Report, the Asset Report itself and other Audit Copies of it are not affected and will remain accessible after removing the given Audit Copy."}
    
    #{""}
    
    #{""}
    "
    @spec asset_report_audit_copy_remove(Tesla.Client.t()) ::
            {:ok, Plaid.AssetReportAuditCopyRemoveResponse.t()} | {:error, any}
    def(asset_report_audit_copy_remove(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/audit_copy/remove")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.AssetReportAuditCopyRemoveResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(asset_report_audit_copy_remove: 1)
  )

  (
    @doc "#{"Create a transfer authorization"}
    
    #{"Use the `/transfer/authorization/create` endpoint to determine transfer failure risk.\n\nIn Plaid's sandbox environment the decisions will be returned as follows:\n\n  - To approve a transfer, make an authorization request with an `amount` less than the available balance in the account.\n\n  - To decline a transfer with the rationale code `NSF`, the available balance on the account must be less than the authorization `amount`. See [Create Sandbox test data](https://plaid.com/docs/sandbox/user-custom/) for details on how to customize data in Sandbox.\n\n  - To decline a transfer with the rationale code `RISK`, the available balance on the account must be exactly $0. See [Create Sandbox test data](https://plaid.com/docs/sandbox/user-custom/) for details on how to customize data in Sandbox.\n\n  - To permit a transfer with the rationale code `MANUALLY_VERIFIED_ITEM`, create an Item in Link through the [Same Day Micro-deposits flow](https://plaid.com/docs/auth/coverage/testing/#testing-same-day-micro-deposits).\n\n  - To permit a transfer with the rationale code `LOGIN_REQUIRED`, [reset the login for an Item](https://plaid.com/docs/sandbox/#item_login_required).\n\nAll username/password combinations other than the ones listed above will result in a decision of permitted and rationale code `ERROR`."}
    
    #{""}
    
    #{""}
    "
    @spec transfer_authorization_create(Tesla.Client.t()) ::
            {:ok, Plaid.TransferAuthorizationCreateResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(transfer_authorization_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transfer/authorization/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.TransferAuthorizationCreateResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(transfer_authorization_create: 1)
  )

  (
    @doc "#{"Reverse an existing payment"}
    
    #{"Reverse a previously initiated payment.\n\nA payment can only be reversed once and will be refunded to the original sender's account.\n"}
    
    #{""}
    
    #{""}
    "
    @spec payment_initiation_payment_reverse(Tesla.Client.t()) ::
            {:ok, Plaid.PaymentInitiationPaymentReverseResponse.t()} | {:error, any}
    def(payment_initiation_payment_reverse(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/payment_initiation/payment/reverse")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.PaymentInitiationPaymentReverseResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(payment_initiation_payment_reverse: 1)
  )

  (
    @doc "#{"Retrieve a bank transfer"}
    
    #{"The `/bank_transfer/get` fetches information about the bank transfer corresponding to the given `bank_transfer_id`."}
    
    #{""}
    
    #{""}
    "
    @spec bank_transfer_get(Tesla.Client.t()) ::
            {:ok, Plaid.BankTransferGetResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(bank_transfer_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.BankTransferGetResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(bank_transfer_get: 1)
  )

  (
    @doc "#{"Create a test Item and processor token"}
    
    #{"Use the `/sandbox/processor_token/create` endpoint to create a valid `processor_token` for an arbitrary institution ID and test credentials. The created `processor_token` corresponds to a new Sandbox Item. You can then use this `processor_token` with the `/processor/` API endpoints in Sandbox. You can also use `/sandbox/processor_token/create` with the [`user_custom` test username](https://plaid.com/docs/sandbox/user-custom) to generate a test account with custom data."}
    
    #{""}
    
    #{""}
    "
    @spec sandbox_processor_token_create(Tesla.Client.t()) ::
            {:ok, Plaid.SandboxProcessorTokenCreateResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(sandbox_processor_token_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/processor_token/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.SandboxProcessorTokenCreateResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(sandbox_processor_token_create: 1)
  )

  (
    @doc "#{"Retrieve Liabilities data"}
    
    #{"The `/liabilities/get` endpoint returns various details about an Item with loan or credit accounts. Liabilities data is available primarily for US financial institutions, with some limited coverage of Canadian institutions. Currently supported account types are account type `credit` with account subtype `credit card` or `paypal`, and account type `loan` with account subtype `student` or `mortgage`. To limit accounts listed in Link to types and subtypes supported by Liabilities, you can use the `account_filters` parameter when [creating a Link token](https://plaid.com/docs/api/tokens/#linktokencreate).\n\nThe types of information returned by Liabilities can include balances and due dates, loan terms, and account details such as original loan amount and guarantor. Data is refreshed approximately once per day; the latest data can be retrieved by calling `/liabilities/get`.\n\nNote: This request may take some time to complete if `liabilities` was not specified as an initial product when creating the Item. This is because Plaid must communicate directly with the institution to retrieve the additional data."}
    
    #{""}
    
    #{""}
    "
    @spec liabilities_get(Tesla.Client.t()) ::
            {:ok, Plaid.LiabilitiesGetResponse.t()} | {:error, any}
    def(liabilities_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/liabilities/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.LiabilitiesGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(liabilities_get: 1)
  )

  (
    @doc "#{"Download the original documents used for income verification"}
    
    #{"`/income/verification/documents/download` provides the ability to download the source paystub PDF that the end user uploaded via Paystub Import.\n\nThe response to `/income/verification/documents/download` is a ZIP file in binary data. The `request_id`  is returned in the `Plaid-Request-ID` header.\n\nFor Payroll Income, the most recent file available for download with the payroll provider will also be available from this endpoint."}
    
    #{""}
    
    #{""}
    "
    @spec income_verification_documents_download(Tesla.Client.t()) ::
            {:ok, binary} | {:error, any}
    def(income_verification_documents_download(client \\ new())) do
      case(
        Tesla.request(client, method: :post, url: "/income/verification/documents/download")
      ) do
        {:ok, %{status: 200, body: body}} ->
          case(body) do
            x when is_binary(x) ->
              {:ok, x}

            x ->
              {:error, {:decode, {:invalid_string, x}, [nil]}}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(income_verification_documents_download: 1)
  )

  (
    @doc "#{"Retrieve an Asset Report"}
    
    #{"The `/asset_report/get` endpoint retrieves the Asset Report in JSON format. Before calling `/asset_report/get`, you must first create the Asset Report using `/asset_report/create` (or filter an Asset Report using `/asset_report/filter`) and then wait for the [`PRODUCT_READY`](https://plaid.com/docs/api/webhooks) webhook to fire, indicating that the Report is ready to be retrieved.\n\nBy default, an Asset Report includes transaction descriptions as returned by the bank, as opposed to parsed and categorized by Plaid. You can also receive cleaned and categorized transactions, as well as additional insights like merchant name or location information. We call this an Asset Report with Insights. An Asset Report with Insights provides transaction category, location, and merchant information in addition to the transaction strings provided in a standard Asset Report.\n\nTo retrieve an Asset Report with Insights, call the `/asset_report/get` endpoint with `include_insights` set to `true`."}
    
    #{""}
    
    #{""}
    "
    @spec asset_report_get(Tesla.Client.t()) ::
            {:ok, Plaid.AssetReportGetResponse.t()} | {:error, any}
    def(asset_report_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.AssetReportGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(asset_report_get: 1)
  )

  (
    @doc "#{"Create a deposit switch"}
    
    #{"This endpoint creates a deposit switch entity that will be persisted throughout the lifecycle of the switch."}
    
    #{""}
    
    #{""}
    "
    @spec deposit_switch_create(Tesla.Client.t()) ::
            {:ok, Plaid.DepositSwitchCreateResponse.t()} | {:error, any}
    def(deposit_switch_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/deposit_switch/create")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.DepositSwitchCreateResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(deposit_switch_create: 1)
  )

  (
    @doc "#{"Report whether you initiated an ACH transaction"}
    
    #{"After calling `/signal/evaluate`, call `/signal/decision/report` to report whether the transaction was initiated. This endpoint will return an `INVALID_REQUEST` error if called a second time with a different value for `initiated`."}
    
    #{""}
    
    #{""}
    "
    @spec signal_decision_report(Tesla.Client.t()) ::
            {:ok, Plaid.SignalDecisionReportResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(signal_decision_report(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/signal/decision/report")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.SignalDecisionReportResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(signal_decision_report: 1)
  )

  (
    @doc "#{"Retrieve identity data"}
    
    #{"The `/identity/get` endpoint allows you to retrieve various account holder information on file with the financial institution, including names, emails, phone numbers, and addresses. Only name data is guaranteed to be returned; other fields will be empty arrays if not provided by the institution.\n\nNote: This request may take some time to complete if identity was not specified as an initial product when creating the Item. This is because Plaid must communicate directly with the institution to retrieve the data."}
    
    #{""}
    
    #{""}
    "
    @spec identity_get(Tesla.Client.t()) :: {:ok, Plaid.IdentityGetResponse.t()} | {:error, any}
    def(identity_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/identity/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.IdentityGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(identity_get: 1)
  )

  (
    @doc "#{"Fire a test webhook"}
    
    #{"The `/sandbox/item/fire_webhook` endpoint is used to test that code correctly handles webhooks. Calling this endpoint triggers a Transactions `DEFAULT_UPDATE` webhook to be fired for a given Sandbox Item. If the Item does not support Transactions, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result."}
    
    #{""}
    
    #{""}
    "
    @spec sandbox_item_fire_webhook(Tesla.Client.t()) ::
            {:ok, Plaid.SandboxItemFireWebhookResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(sandbox_item_fire_webhook(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/item/fire_webhook")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.SandboxItemFireWebhookResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(sandbox_item_fire_webhook: 1)
  )

  (
    @doc "#{"Retrieve a summary of information derived from income verification"}
    
    #{"`/income/verification/summary/get` returns a verification summary for the income that was verified for an end user. It can be called once the status of the verification has been set to `VERIFICATION_STATUS_PROCESSING_COMPLETE`, as reported by the `INCOME: verification_status` webhook. Attempting to call the endpoint before verification has been completed will result in an error."}
    
    #{""}
    
    #{""}
    "
    @spec income_verification_summary_get(Tesla.Client.t()) ::
            {:ok, Plaid.IncomeVerificationSummaryGetResponse.t()} | {:error, any}
    def(income_verification_summary_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/income/verification/summary/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.IncomeVerificationSummaryGetResponse.decode(body)

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(income_verification_summary_get: 1)
  )

  (
    @doc "#{"Get transaction data"}
    
    #{"The `/transactions/get` endpoint allows developers to receive user-authorized transaction data for credit, depository, and some loan-type accounts (only those with account subtype `student`; coverage may be limited). For transaction history from investments accounts, use the [Investments endpoint](https://plaid.com/docs/api/products#investments) instead. Transaction data is standardized across financial institutions, and in many cases transactions are linked to a clean name, entity type, location, and category. Similarly, account data is standardized and returned with a clean name, number, balance, and other meta information where available.\n\nTransactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and will not shift.  Transactions are not immutable and can also be removed altogether by the institution; a removed transaction will no longer appear in `/transactions/get`.  For more details, see [Pending and posted transactions](https://plaid.com/docs/transactions/transactions-data/#pending-and-posted-transactions).\n\nDue to the potentially large number of transactions associated with an Item, results are paginated. Manipulate the `count` and `offset` parameters in conjunction with the `total_transactions` response body field to fetch all available transactions.\n\nData returned by `/transactions/get` will be the data available for the Item as of the most recent successful check for new transactions. Plaid typically checks for new data multiple times a day, but these checks may occur less frequently, such as once a day, depending on the institution. An Item's `status.transactions.last_successful_update` field will show the timestamp of the most recent successful update. To force Plaid to check for new transactions, you can use the `/transactions/refresh` endpoint.\n\nNote that data may not be immediately available to `/transactions/get`. Plaid will begin to prepare transactions data upon Item link, if Link was initialized with `transactions`, or upon the first call to `/transactions/get`, if it wasn't. To be alerted when transaction data is ready to be fetched, listen for the [`INITIAL_UPDATE`](https://plaid.com/docs/api/webhooks#transactions-initial_update) and [`HISTORICAL_UPDATE`](https://plaid.com/docs/api/webhooks#transactions-historical_update) webhooks. If no transaction history is ready when `/transactions/get` is called, it will return a `PRODUCT_NOT_READY` error."}
    
    #{""}
    
    #{""}
    "
    @spec transactions_get(Tesla.Client.t()) ::
            {:ok, Plaid.TransactionsGetResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(transactions_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transactions/get")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.TransactionsGetResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(transactions_get: 1)
  )

  (
    @doc "#{"Sync bank transfer events"}
    
    #{"`/bank_transfer/event/sync` allows you to request up to the next 25 bank transfer events that happened after a specific `event_id`. Use the `/bank_transfer/event/sync` endpoint to guarantee you have seen all bank transfer events."}
    
    #{""}
    
    #{""}
    "
    @spec bank_transfer_event_sync(Tesla.Client.t()) ::
            {:ok, Plaid.BankTransferEventSyncResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(bank_transfer_event_sync(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/event/sync")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.BankTransferEventSyncResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(bank_transfer_event_sync: 1)
  )

  (
    @doc "#{"Migrate account into Bank Transfers"}
    
    #{"As an alternative to adding Items via Link, you can also use the `/bank_transfer/migrate_account` endpoint to migrate known account and routing numbers to Plaid Items.  Note that Items created in this way are not compatible with endpoints for other products, such as `/accounts/balance/get`, and can only be used with Bank Transfer endpoints.  If you require access to other endpoints, create the Item through Link instead.  Access to `/bank_transfer/migrate_account` is not enabled by default; to obtain access, contact your Plaid Account Manager."}
    
    #{""}
    
    #{""}
    "
    @spec bank_transfer_migrate_account(Tesla.Client.t()) ::
            {:ok, Plaid.BankTransferMigrateAccountResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(bank_transfer_migrate_account(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/migrate_account")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.BankTransferMigrateAccountResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(bank_transfer_migrate_account: 1)
  )

  (
    @doc "#{"List bank transfers"}
    
    #{"Use the `/bank_transfer/list` endpoint to see a list of all your bank transfers and their statuses. Results are paginated; use the `count` and `offset` query parameters to retrieve the desired bank transfers.\n"}
    
    #{""}
    
    #{""}
    "
    @spec bank_transfer_list(Tesla.Client.t()) ::
            {:ok, Plaid.BankTransferListResponse.t()} | {:error, Plaid.Error.t()} | {:error, any}
    def(bank_transfer_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/list")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.BankTransferListResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(bank_transfer_list: 1)
  )

  (
    @doc "#{"Update the scopes of access for a particular application"}
    
    #{"Enable consumers to update product access on selected accounts for an application."}
    
    #{""}
    
    #{""}
    "
    @spec item_application_scopes_update(Tesla.Client.t()) ::
            {:ok, Plaid.ItemApplicationScopesUpdateResponse.t()}
            | {:error, Plaid.Error.t()}
            | {:error, any}
    def(item_application_scopes_update(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/application/scopes/update")) do
        {:ok, %{status: 200, body: body}} ->
          Plaid.ItemApplicationScopesUpdateResponse.decode(body)

        {:ok, %{body: body}} ->
          with({:ok, data} <- Plaid.Error.decode(body)) do
            {:error, data}
          end

        {:error, error} ->
          {:error, error}
      end
    end

    defoverridable(item_application_scopes_update: 1)
  )

  (
    @middleware [
      {Tesla.Middleware.BaseUrl, "/"},
      Tesla.Middleware.PathParams,
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