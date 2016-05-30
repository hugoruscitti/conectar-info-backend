defmodule ConectarInfoBackend.Event do
  use ConectarInfoBackend.Web, :model

  schema "events" do
    field :ip, :string
    field :os, :string
    field :os_version, :string
    field :last_update, Ecto.Date
    field :lat, :float
    field :lon, :float
    field :date, Ecto.Date

    timestamps
  end

  @required_fields ~w(ip os os_version last_update lat lon date)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
