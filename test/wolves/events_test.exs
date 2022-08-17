defmodule Wolves.EventsTest do
  use Wolves.DataCase

  alias Wolves.Events

  describe "events" do
    alias Wolves.Events.Event

    import Wolves.EventsFixtures

    @invalid_attrs %{date: nil, result1: nil, result2: nil, rival: nil, status: nil}

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      valid_attrs = %{date: ~N[2022-08-16 06:26:00], result1: 42, result2: 42, rival: "some rival", status: "some status"}

      assert {:ok, %Event{} = event} = Events.create_event(valid_attrs)
      assert event.date == ~N[2022-08-16 06:26:00]
      assert event.result1 == 42
      assert event.result2 == 42
      assert event.rival == "some rival"
      assert event.status == "some status"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      update_attrs = %{date: ~N[2022-08-17 06:26:00], result1: 43, result2: 43, rival: "some updated rival", status: "some updated status"}

      assert {:ok, %Event{} = event} = Events.update_event(event, update_attrs)
      assert event.date == ~N[2022-08-17 06:26:00]
      assert event.result1 == 43
      assert event.result2 == 43
      assert event.rival == "some updated rival"
      assert event.status == "some updated status"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end
