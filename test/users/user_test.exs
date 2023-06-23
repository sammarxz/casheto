defmodule Casheto.Users.UserTest do
  use ExUnit.Case

  alias Casheto.Users.User

  import Casheto.Factory

  describe "build/2" do
    test "should create a valid user" do
      response = User.build(
        "John Doe",
        "john@example.com"
      )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "should raise ArgumentError for invalid email" do
      assert_raise ArgumentError, fn ->
        User.build("John Doe", "invalid_email")
      end
    end
  end
end
