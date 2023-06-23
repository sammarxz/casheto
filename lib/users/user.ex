defmodule Casheto.Users.User do
  @keys [:name, :email]
  @enforce_keys @keys

  defstruct @keys

  def build(name, email) when is_bitstring(name) and is_bitstring(email) do
    {
      :ok,
      %__MODULE__{
        name: name,
        email: email
      }
    }
  end
  def build(_name, _email), do: {:error, "Invalid Parameters"}
end
