defmodule Casheto.Users.UserTest do
  use ExUnit.Case

  test "build/2 creates a valid user" do
    name = "John Doe"
    email = "john@example.com"

    {:ok, user} = Casheto.Users.User.build(name, email)

    assert user.name == name
    assert user.email == email
  end

  test "build/2 raises ArgumentError for invalid email" do
    name = "John Doe"
    email = "invalid_email"

    assert_raise ArgumentError, fn ->
      Casheto.Users.User.build(name, email)
    end
  end
end
