defmodule VersionWarehouse.VersionView do
  use VersionWarehouse.Web, :view

  def render("index.json", %{versions: versions}) do
    %{data: render_many(versions, VersionWarehouse.VersionView, "version.json")}
  end

  def render("show.json", %{version: version}) do
    %{data: render_one(version, VersionWarehouse.VersionView, "version.json")}
  end

  def render("version.json", %{version: version}) do
    %{id: version.id,
      item_type: version.item_type,
      item_id: version.item_id,
      event: version.event,
      whodunnit: version.whodunnit,
      object: version.object,
      ip: version.ip,
      request_id: version.request_id,
      admin_id: version.admin_id,
      object_changes: version.object_changes,
      created_at: Calendar.DateTime.Format.rfc2822(version.created_at)}
  end
end
