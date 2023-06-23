defmodule Casheto.Account do
  alias Casheto.Users.User
  alias Casheto.Transactions.Transaction

  @keys [:user, :balance, :transactions, :income, :expenses]
  @enforce_keys @keys

  defstruct @keys

  def build(%User{} = user) do
    {
      :ok,
      %__MODULE__{
        user: user,
        balance: Decimal.new("0.00"),
        transactions: [],
        income: Decimal.new("0.00"),
        expenses: Decimal.new("0.00")
      }
    }
  end

  def add_transaction(%__MODULE__{} = account, %Transaction{} = transaction) do
    updated_transactions = [transaction | account.transactions]
    updated_balance = calculate_balance(updated_transactions)
    updated_income = calculate_income(updated_transactions)
    updated_expenses = calculate_expenses(updated_transactions)

    %__MODULE__{
      account | transactions: updated_transactions,
      balance: updated_balance,
      income: updated_income,
      expenses: updated_expenses
    }
  end

  defp calculate_balance([]), do: Decimal.new("0.00")
  defp calculate_balance(transactions) do
    Enum.reduce(transactions, Decimal.new("0.00"), &calc_values(&1, &2))
  end

  defp calculate_total(transactions, type) do
    transactions
    |> Enum.filter(&(&1.type == type))
    |> Enum.reduce(Decimal.new("0.00"), &Decimal.add(&1.amount, &2))
  end

  defp calculate_income(transactions) do
    calculate_total(transactions, :income)
  end

  defp calculate_expenses(transactions) do
    calculate_total(transactions, :expense)
  end

  defp calc_values(%Transaction{type: :income, amount: amount}, balance), do: Decimal.add(balance, amount)
  defp calc_values(%Transaction{type: :expense, amount: amount}, balance), do: Decimal.sub(balance, amount)
end
