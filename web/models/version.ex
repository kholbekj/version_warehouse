defmodule VersionWarehouse.Version do
  use VersionWarehouse.Web, :model

  schema "versions" do
    field :item_type, :string
    field :item_id, :integer
    field :event, :string
    field :whodunnit, :string
    field :object, :string
    field :ip, :string
    field :request_id, :string
    field :admin_id, :integer
    field :object_changes, :string

    timestamps
  end

  @required_fields ~w(item_type item_id event whodunnit object ip request_id admin_id object_changes)
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
