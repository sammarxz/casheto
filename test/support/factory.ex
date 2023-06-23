defmodule Casheto.Factory do
  use ExMachina

  alias Casheto.Users.User
  alias Casheto.Transactions.Transaction
  alias Casheto.Account

  def user_factory do
    %User{
      name: "John Doe",
      email: "john@example.com"
    }
  end

  def transaction_factory do
    %Transaction{
      description: "Expense",
      amount: Decimal.new("50.00"),
      category: "Transporte",
      type: :expense
    }
  end

  def account_factory do
    %Account{
      user: build(:user),
      balance: Decimal.new("0.00"),
      transactions: [],
      income: Decimal.new("0.00"),
      expenses: Decimal.new("0.00")
    }
  end
end
