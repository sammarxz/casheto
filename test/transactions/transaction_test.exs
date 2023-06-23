defmodule Casheto.Transactions.TransactionTest do
  use ExUnit.Case

  alias Casheto.Transactions.Transaction

  import Casheto.Factory

  describe "build/4" do
    test "when all params are valid, return an Transaction" do
      description = "Expense"
      amount = "50.00"
      category = "Transporte"
      type = :expense

      response = Transaction.build(description, amount, category, type)

      expected_response = {
        :ok,
        build(:transaction)
      }

      assert response == expected_response
    end

    test "When there is an invalid category, return an error" do
      description = "Expense"
      amount = "50.00"
      category = "InvalidCategory"
      type = :expense

      response = Transaction.build(description, amount, category, type)

      expected_response = {:error, "Invalid Parameters"}

      assert response == expected_response
    end

    test "When there is am invalid price, returns an error" do
      description = "Expense"
      amount = "InvalidAmount"
      category = "Transporte"
      type = :expense

      response = Transaction.build(description, amount, category, type)

      expected_response = {:error, "invalid amount"}

      assert response == expected_response
    end
  end
end
