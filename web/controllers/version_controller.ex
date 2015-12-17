defmodule VersionWarehouse.VersionController do
  use VersionWarehouse.Web, :controller

  alias VersionWarehouse.Version

  plug :scrub_params, "version" when action in [:create, :update]

  def index(conn, _params) do
    versions = Repo.all(Version)
    render(conn, "index.json", versions: versions)
  end

  def create(conn, %{"version" => version_params}) do
    changeset = Version.changeset(%Version{}, version_params)

    case Repo.insert(changeset) do
      {:ok, version} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", version_path(conn, :show, version))
        |> render("show.json", version: version)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(VersionWarehouse.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    version = Repo.get!(Version, id)
    render(conn, "show.json", version: version)
  end

  def update(conn, %{"id" => id, "version" => version_params}) do
    version = Repo.get!(Version, id)
    changeset = Version.changeset(version, version_params)

    case Repo.update(changeset) do
      {:ok, version} ->
        render(conn, "show.json", version: version)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(VersionWarehouse.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    version = Repo.get!(Version, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(version)

    send_resp(conn, :no_content, "")
  end
end
