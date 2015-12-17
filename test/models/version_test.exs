defmodule VersionWarehouse.VersionTest do
  use VersionWarehouse.ModelCase

  alias VersionWarehouse.Version

  @valid_attrs %{admin_id: 42, event: "some content", ip: "some content", item_id: 42, item_type: "some content", object: "some content", object_changes: "some content", request_id: "some content", whodunnit: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Version.changeset(%Version{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Version.changeset(%Version{}, @invalid_attrs)
    refute changeset.valid?
  end
end
