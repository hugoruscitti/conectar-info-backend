defmodule ConectarInfoBackend.EventTest do
  use ConectarInfoBackend.ModelCase

  alias ConectarInfoBackend.Event

  @valid_attrs %{date: "2010-04-17", ip: "some content", last_update: "2010-04-17", lat: "120.5", lon: "120.5", os: "some content", os_version: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
