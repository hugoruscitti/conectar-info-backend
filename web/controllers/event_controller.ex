defmodule ConectarInfoBackend.EventController do
  use ConectarInfoBackend.Web, :controller

  alias ConectarInfoBackend.Event

  plug :scrub_params, "event" when action in [:create, :update]

  def index(conn, _params) do
    query = from p in Event,
            order_by: [desc: p.date]
    events = Repo.all(query)
    render(conn, "index.json", events: events)
  end

  def create(conn, %{"event" => event_params}) do
    changeset = Event.changeset(%Event{}, event_params)
    ip = conn.remote_ip |> Tuple.to_list |> (Enum.join ".")

    changeset = Ecto.Changeset.put_change(changeset, :ip, ip)
    changeset = Ecto.Changeset.put_change(changeset, :date, Ecto.DateTime.utc())

    IO.puts "Se conecta desde " <> ip

    # Usar un request similar a este cuando
    # se necesite geo posicionar:
    #
    #               http://freegeoip.net/json/201.216.201.129
    #

    #require IEx
    #IEx.pry

    case Repo.insert(changeset) do
      {:ok, event} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", event_path(conn, :show, event))
        |> render("show.json", event: event)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ConectarInfoBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    event = Repo.get!(Event, id)
    render(conn, "show.json", event: event)
  end

  def update(conn, %{"id" => id, "event" => event_params}) do
    event = Repo.get!(Event, id)
    changeset = Event.changeset(event, event_params)

    case Repo.update(changeset) do
      {:ok, event} ->
        render(conn, "show.json", event: event)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ConectarInfoBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = Repo.get!(Event, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(event)

    send_resp(conn, :no_content, "")
  end
end
