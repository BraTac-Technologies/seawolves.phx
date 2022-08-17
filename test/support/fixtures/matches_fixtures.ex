defmodule Wolves.MatchesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Wolves.Matches` context.
  """

  @doc """
  Generate a match.
  """
  def match_fixture(attrs \\ %{}) do
    {:ok, match} =
      attrs
      |> Enum.into(%{
        player_id: "some player_id",
        result1: 42,
        result2: 42,
        rival_player: "some rival_player"
      })
      |> Wolves.Matches.create_match()

    match
  end
end
