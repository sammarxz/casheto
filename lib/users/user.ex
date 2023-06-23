defmodule Casheto.Users.User do
  @keys [:name, :email]
  @enforce_keys @keys

  defstruct @keys

  def build(name, email)do
    {
      :ok,
      %__MODULE__{
        name: name,
        email: validate_email(email)
      }
    }
  end

  defp validate_email(email) when is_binary(email) do
    case Regex.match?(~r/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,})+$/, email) do
      true -> email
      false -> raise ArgumentError, "Invalid email address"
    end
  end
end
