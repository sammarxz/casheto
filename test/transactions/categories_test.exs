defmodule Casheto.Transactions.CategoriesTest do
  use ExUnit.Case

  import Casheto.Transactions.Categories

  test "get_categories/0 returns the list of categories" do
    expected_categories = [
      "Alimentação",
      "Transporte",
      "Moradia",
      "Educação",
      "Saúde",
      "Lazer",
      "Dívidas",
      "Investimentos",
      "Doações",
      "Salário",
      "Outros"
    ]

    assert get_categories() == expected_categories
  end
end
