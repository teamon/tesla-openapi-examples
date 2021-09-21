defmodule(Plaid) do
  (
    @external_resource "priv/specs/plaid.json"
    @moduledoc "#{"The Plaid API"}
    
    #{"The Plaid REST API. Please see https://plaid.com/docs/api for more details."}
    
    Version #{"2020-09-14_1.33.0"}
    "
  )

  (
    @doc "#{"Filter Asset Report"}
    
    #{"By default, an Asset Report will contain all of the accounts on a given Item. In some cases, you may not want the Asset Report to contain all accounts. For example, you might have the end user choose which accounts are relevant in Link using the Account Select view, which you can enable in the dashboard. Or, you might always exclude certain account types or subtypes, which you can identify by using the `/accounts/get` endpoint. To narrow an Asset Report to only a subset of accounts, use the `/asset_report/filter` endpoint.\n\nTo exclude certain Accounts from an Asset Report, first use the `/asset_report/create` endpoint to create the report, then send the `asset_report_token` along with a list of `account_ids` to exclude to the `/asset_report/filter` endpoint, to create a new Asset Report which contains only a subset of the original Asset Report's data.\n\nBecause Asset Reports are immutable, calling `/asset_report/filter` does not alter the original Asset Report in any way; rather, `/asset_report/filter` creates a new Asset Report with a new token and id. Asset Reports created via `/asset_report/filter` do not contain new Asset data, and are not billed.\n\nPlaid will fire a [`PRODUCT_READY`](https://plaid.com/docs/api/webhooks) webhook once generation of the filtered Asset Report has completed."}
    
    #{""}
    
    #{""}
    "
    @spec asset_report_filter(Tesla.Client.t()) :: :ok | {:error, any}
    def(asset_report_filter(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/filter")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec link_token_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(link_token_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/link/token/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec sandbox_income_fire_webhook(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(sandbox_income_fire_webhook(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/income/fire_webhook")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec payment_initiation_recipient_create(Tesla.Client.t()) :: :ok | {:error, any}
    def(payment_initiation_recipient_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/payment_initiation/recipient/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec item_import(Tesla.Client.t()) :: :ok | {:error, any}
    def(item_import(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/import")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec transfer_event_list(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(transfer_event_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transfer/event/list")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec bank_transfer_create(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(bank_transfer_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec deposit_switch_token_create(Tesla.Client.t()) :: :ok | {:error, any}
    def(deposit_switch_token_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/deposit_switch/token/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec asset_report_audit_copy_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(asset_report_audit_copy_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/audit_copy/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec institutions_get(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(institutions_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/institutions/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec income_verification_precheck(Tesla.Client.t()) :: :ok | {:error, any}
    def(income_verification_precheck(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/income/verification/precheck")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec processor_stripe_bank_account_token_create(Tesla.Client.t()) :: :ok | {:error, any}
    def(processor_stripe_bank_account_token_create(client \\ new())) do
      case(
        Tesla.request(client, method: :post, url: "/processor/stripe/bank_account_token/create")
      ) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec item_webhook_update(Tesla.Client.t()) :: :ok | {:error, any}
    def(item_webhook_update(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/webhook/update")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec bank_transfer_sweep_list(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(bank_transfer_sweep_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/sweep/list")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec income_verification_create(Tesla.Client.t()) :: :ok | {:error, any}
    def(income_verification_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/income/verification/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec payment_initiation_payment_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(payment_initiation_payment_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/payment_initiation/payment/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec income_verification_paystub_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(income_verification_paystub_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/income/verification/paystub/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec accounts_get(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(accounts_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/accounts/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec income_verification_refresh(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(income_verification_refresh(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/income/verification/refresh")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec sandbox_item_reset_login(Tesla.Client.t()) :: :ok | {:error, any}
    def(sandbox_item_reset_login(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/item/reset_login")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec signal_evaluate(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(signal_evaluate(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/signal/evaluate")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec employers_search(Tesla.Client.t()) :: :ok | {:error, any}
    def(employers_search(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/employers/search")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec transfer_get(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(transfer_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transfer/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec processor_token_create(Tesla.Client.t()) :: :ok | {:error, any}
    def(processor_token_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/processor/token/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec transfer_create(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(transfer_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transfer/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec transactions_refresh(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(transactions_refresh(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transactions/refresh")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec investments_transactions_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(investments_transactions_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/investments/transactions/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec payment_initiation_recipient_list(Tesla.Client.t()) :: :ok | {:error, any}
    def(payment_initiation_recipient_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/payment_initiation/recipient/list")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec sandbox_bank_transfer_fire_webhook(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(sandbox_bank_transfer_fire_webhook(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/bank_transfer/fire_webhook")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec item_create_public_token(Tesla.Client.t()) :: :ok | {:error, any}
    def(item_create_public_token(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/public_token/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec transfer_event_sync(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(transfer_event_sync(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transfer/event/sync")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec application_get(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(application_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/application/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec payment_initiation_recipient_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(payment_initiation_recipient_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/payment_initiation/recipient/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec processor_apex_processor_token_create(Tesla.Client.t()) :: :ok | {:error, any}
    def(processor_apex_processor_token_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/processor/apex/processor_token/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec payment_initiation_payment_list(Tesla.Client.t()) :: :ok | {:error, any}
    def(payment_initiation_payment_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/payment_initiation/payment/list")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec processor_auth_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(processor_auth_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/processor/auth/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec sandbox_bank_transfer_simulate(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(sandbox_bank_transfer_simulate(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/bank_transfer/simulate")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec transfer_list(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(transfer_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transfer/list")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec sandbox_item_set_verification_status(Tesla.Client.t()) :: :ok | {:error, any}
    def(sandbox_item_set_verification_status(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/item/set_verification_status")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec item_remove(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(item_remove(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/remove")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec bank_transfer_event_list(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(bank_transfer_event_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/event/list")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec bank_transfer_cancel(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(bank_transfer_cancel(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/cancel")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec asset_report_create(Tesla.Client.t()) :: :ok | {:error, any}
    def(asset_report_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec deposit_switch_alt_create(Tesla.Client.t()) :: :ok | {:error, any}
    def(deposit_switch_alt_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/deposit_switch/alt/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec accounts_balance_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(accounts_balance_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/accounts/balance/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec webhook_verification_key_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(webhook_verification_key_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/webhook_verification_key/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec processor_balance_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(processor_balance_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/processor/balance/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec create_payment_token(Tesla.Client.t()) :: :ok | {:error, any}
    def(create_payment_token(client \\ new())) do
      case(
        Tesla.request(client, method: :post, url: "/payment_initiation/payment/token/create")
      ) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec income_verification_paystubs_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(income_verification_paystubs_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/income/verification/paystubs/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec payment_initiation_payment_create(Tesla.Client.t()) :: :ok | {:error, any}
    def(payment_initiation_payment_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/payment_initiation/payment/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec item_public_token_exchange(Tesla.Client.t()) :: :ok | {:error, any}
    def(item_public_token_exchange(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/public_token/exchange")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec asset_report_audit_copy_create(Tesla.Client.t()) :: :ok | {:error, any}
    def(asset_report_audit_copy_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/audit_copy/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec bank_transfer_balance_get(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(bank_transfer_balance_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/balance/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec auth_get(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(auth_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/auth/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec categories_get(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(categories_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/categories/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec asset_report_refresh(Tesla.Client.t()) :: :ok | {:error, any}
    def(asset_report_refresh(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/refresh")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec bank_transfer_sweep_get(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(bank_transfer_sweep_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/sweep/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec sandbox_public_token_create(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(sandbox_public_token_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/public_token/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec institutions_search(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(institutions_search(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/institutions/search")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec item_application_list(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(item_application_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/application/list")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec item_access_token_invalidate(Tesla.Client.t()) :: :ok | {:error, any}
    def(item_access_token_invalidate(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/access_token/invalidate")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec item_get(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(item_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec processor_identity_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(processor_identity_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/processor/identity/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec signal_return_report(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(signal_return_report(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/signal/return/report")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec income_verification_taxforms_get(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(income_verification_taxforms_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/income/verification/taxforms/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec link_token_create(Tesla.Client.t()) :: :ok | {:error, any}
    def(link_token_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/link/token/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec institutions_get_by_id(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(institutions_get_by_id(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/institutions/get_by_id")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec investments_holdings_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(investments_holdings_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/investments/holdings/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec sandbox_transfer_simulate(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(sandbox_transfer_simulate(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/transfer/simulate")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec asset_report_remove(Tesla.Client.t()) :: :ok | {:error, any}
    def(asset_report_remove(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/remove")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec processor_bank_transfer_create(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(processor_bank_transfer_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/processor/bank_transfer/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec asset_report_pdf_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(asset_report_pdf_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/pdf/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec sandbox_oauth_select_accounts(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(sandbox_oauth_select_accounts(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/oauth/select_accounts")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec transfer_cancel(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(transfer_cancel(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transfer/cancel")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec deposit_switch_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(deposit_switch_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/deposit_switch/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec asset_report_audit_copy_remove(Tesla.Client.t()) :: :ok | {:error, any}
    def(asset_report_audit_copy_remove(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/audit_copy/remove")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec transfer_authorization_create(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(transfer_authorization_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transfer/authorization/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec payment_initiation_payment_reverse(Tesla.Client.t()) :: :ok | {:error, any}
    def(payment_initiation_payment_reverse(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/payment_initiation/payment/reverse")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec bank_transfer_get(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(bank_transfer_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec sandbox_processor_token_create(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(sandbox_processor_token_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/processor_token/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec liabilities_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(liabilities_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/liabilities/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec income_verification_documents_download(Tesla.Client.t()) :: :ok | {:error, any}
    def(income_verification_documents_download(client \\ new())) do
      case(
        Tesla.request(client, method: :post, url: "/income/verification/documents/download")
      ) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec asset_report_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(asset_report_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/asset_report/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec deposit_switch_create(Tesla.Client.t()) :: :ok | {:error, any}
    def(deposit_switch_create(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/deposit_switch/create")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec signal_decision_report(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(signal_decision_report(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/signal/decision/report")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec identity_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(identity_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/identity/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec sandbox_item_fire_webhook(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(sandbox_item_fire_webhook(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/sandbox/item/fire_webhook")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec income_verification_summary_get(Tesla.Client.t()) :: :ok | {:error, any}
    def(income_verification_summary_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/income/verification/summary/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

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
    @spec transactions_get(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(transactions_get(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/transactions/get")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec bank_transfer_event_sync(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(bank_transfer_event_sync(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/event/sync")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec bank_transfer_migrate_account(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(bank_transfer_migrate_account(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/migrate_account")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec bank_transfer_list(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(bank_transfer_list(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/bank_transfer/list")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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
    @spec item_application_scopes_update(Tesla.Client.t()) :: :ok | :error | {:error, any}
    def(item_application_scopes_update(client \\ new())) do
      case(Tesla.request(client, method: :post, url: "/item/application/scopes/update")) do
        {:ok, %{status: 200, body: _any}} ->
          {:ok, nil}

        {:ok, %{body: _any}} ->
          {:error, :default}

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