defmodule Casheto.AccountTest do
  use ExUnit.Case

  alias Casheto.Account

  import Casheto.Factory

  describe "build/1" do
    test "should initializes an account with zero balance and empty transactions" do
      account = build(:account)

      assert Decimal.equal?(account.balance, Decimal.new("0.00"))
      assert account.transactions == []
    end
  end

  describe "add_transaction/2" do
    test "should adds a transaction to the account and updates balance, income, and expenses" do
      account = build(:account)

      transaction = build(:transaction, type: :income, amount: "100.00")

      %Account{
        transactions: [new_transaction | _] = updated_transactions,
        balance: updated_balance,
        income: updated_income,
        expenses: updated_expenses
      } = Account.add_transaction(account, transaction)

      assert updated_transactions == [new_transaction]
      assert Decimal.equal?(updated_balance, Decimal.add(account.balance, transaction.amount))
      assert Decimal.equal?(updated_income, Decimal.add(account.income, transaction.amount))
      assert Decimal.equal?(updated_expenses, account.expenses)
    end
  end
end
