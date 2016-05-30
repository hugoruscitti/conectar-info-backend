defmodule ConectarInfoBackend.EventView do
  use ConectarInfoBackend.Web, :view

  def render("index.json", %{events: events}) do
    %{data: render_many(events, ConectarInfoBackend.EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, ConectarInfoBackend.EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      ip: event.ip,
      os: event.os,
      os_version: event.os_version,
      last_update: event.last_update,
      lat: event.lat,
      lon: event.lon,
      date: event.date}
  end
end
