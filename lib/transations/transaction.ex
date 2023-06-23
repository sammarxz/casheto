defmodule Casheto.Transactions.Transaction do
  alias Casheto.Transactions.Categories, as: Categories

  @categories Categories.get_categories()
  @keys [:user_email, :description, :amount, :category, :type]
  @enforce_keys @keys

  defstruct @keys

  def build(user_email, description, amount, category, type)
    when category in @categories do
      amount
      |> Decimal.cast()
      |> build_transaction(user_email, description, category, type)
  end
  def build(_user_email, _description, _amount, _category, _type) do
    {:error, "Invalid Parameters"}
  end

  defp build_transaction(:error, _user_email, _description, _category, _type) , do: {:error, "invalid amount"}
  defp build_transaction({:ok, amount}, user_email, description, category, type) do
    {
      :ok,
      %__MODULE__{
        user_email: user_email,
        amount: amount,
        category: category,
        type: type,
        description: description
      }
    }
  end
end
