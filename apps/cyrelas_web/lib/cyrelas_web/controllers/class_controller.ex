defmodule CyrelasWeb.ClassController do
  use CyrelasWeb, :controller

  alias Cyrelas.Champions
  alias Cyrelas.Champions.Class

  action_fallback CyrelasWeb.FallbackController

  def index(conn, _params) do
    classes = Champions.list_classes()
    render(conn, "index.json", classes: classes)
  end

  def create(conn, %{"class" => class_params}) do
    with {:ok, %Class{} = class} <- Champions.create_class(class_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.class_path(conn, :show, class))
      |> render("show.json", class: class)
    end
  end

  def show(conn, %{"id" => id}) do
    class = Champions.get_class!(id)
    render(conn, "show.json", class: class)
  end

  def update(conn, %{"id" => id, "class" => class_params}) do
    class = Champions.get_class!(id)

    with {:ok, %Class{} = class} <- Champions.update_class(class, class_params) do
      render(conn, "show.json", class: class)
    end
  end

  def delete(conn, %{"id" => id}) do
    class = Champions.get_class!(id)

    with {:ok, %Class{}} <- Champions.delete_class(class) do
      send_resp(conn, :no_content, "")
    end
  end
end
