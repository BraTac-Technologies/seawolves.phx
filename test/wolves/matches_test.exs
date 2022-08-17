defmodule Wolves.MatchesTest do
  use Wolves.DataCase

  alias Wolves.Matches

  describe "matches" do
    alias Wolves.Matches.Match

    import Wolves.MatchesFixtures

    @invalid_attrs %{player_id: nil, result1: nil, result2: nil, rival_player: nil}

    test "list_matches/0 returns all matches" do
      match = match_fixture()
      assert Matches.list_matches() == [match]
    end

    test "get_match!/1 returns the match with given id" do
      match = match_fixture()
      assert Matches.get_match!(match.id) == match
    end

    test "create_match/1 with valid data creates a match" do
      valid_attrs = %{player_id: "some player_id", result1: 42, result2: 42, rival_player: "some rival_player"}

      assert {:ok, %Match{} = match} = Matches.create_match(valid_attrs)
      assert match.player_id == "some player_id"
      assert match.result1 == 42
      assert match.result2 == 42
      assert match.rival_player == "some rival_player"
    end

    test "create_match/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Matches.create_match(@invalid_attrs)
    end

    test "update_match/2 with valid data updates the match" do
      match = match_fixture()
      update_attrs = %{player_id: "some updated player_id", result1: 43, result2: 43, rival_player: "some updated rival_player"}

      assert {:ok, %Match{} = match} = Matches.update_match(match, update_attrs)
      assert match.player_id == "some updated player_id"
      assert match.result1 == 43
      assert match.result2 == 43
      assert match.rival_player == "some updated rival_player"
    end

    test "update_match/2 with invalid data returns error changeset" do
      match = match_fixture()
      assert {:error, %Ecto.Changeset{}} = Matches.update_match(match, @invalid_attrs)
      assert match == Matches.get_match!(match.id)
    end

    test "delete_match/1 deletes the match" do
      match = match_fixture()
      assert {:ok, %Match{}} = Matches.delete_match(match)
      assert_raise Ecto.NoResultsError, fn -> Matches.get_match!(match.id) end
    end

    test "change_match/1 returns a match changeset" do
      match = match_fixture()
      assert %Ecto.Changeset{} = Matches.change_match(match)
    end
  end
end
