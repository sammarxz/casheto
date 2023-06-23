defmodule Casheto.Transactions.Categories do
  @categories [
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

  def get_categories, do: @categories
end
