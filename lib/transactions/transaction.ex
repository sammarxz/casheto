defmodule Casheto.Transactions.Transaction do
  alias Casheto.Transactions.Categories, as: Categories

  @categories Categories.get_categories()
  @keys [:description, :amount, :category, :type]
  @enforce_keys @keys

  defstruct @keys

  def build(description, amount, category, type) when category in @categories do
    amount
    |> Decimal.cast()
    |> build_transaction(description, category, type)
  end
  def build(_description, _amount, _category, _type), do: {:error, "Invalid Parameters"}

  defp build_transaction(:error, _description, _category, _type) , do: {:error, "invalid amount"}
  defp build_transaction({:ok, amount}, description, category, type) do
    {
      :ok,
      %__MODULE__{
        description: description,
        category: category,
        amount: amount,
        type: type
      }
    }
  end
end
