defmodule Wolves.EventsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Wolves.Events` context.
  """

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        date: ~N[2022-08-16 06:26:00],
        result1: 42,
        result2: 42,
        rival: "some rival",
        status: "some status"
      })
      |> Wolves.Events.create_event()

    event
  end
end
