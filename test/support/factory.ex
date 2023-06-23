defmodule Casheto.Factory do
  use ExMachina

  alias Casheto.Users.User

  def user_factory do
    %User{
      name: "John Doe",
      email: "john@example.com"
    }
  end
end
