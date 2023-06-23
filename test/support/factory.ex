defmodule Casheto.Factory do
  use ExMachina

  alias Casheto.Users.User
  alias Casheto.Transactions.Transaction

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
end
