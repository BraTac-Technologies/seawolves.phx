defmodule WolvesWeb.MatchControllerTest do
  use WolvesWeb.ConnCase

  import Wolves.MatchesFixtures

  @create_attrs %{player_id: "some player_id", result1: 42, result2: 42, rival_player: "some rival_player"}
  @update_attrs %{player_id: "some updated player_id", result1: 43, result2: 43, rival_player: "some updated rival_player"}
  @invalid_attrs %{player_id: nil, result1: nil, result2: nil, rival_player: nil}

  describe "index" do
    test "lists all matches", %{conn: conn} do
      conn = get(conn, Routes.match_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Matches"
    end
  end

  describe "new match" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.match_path(conn, :new))
      assert html_response(conn, 200) =~ "New Match"
    end
  end

  describe "create match" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.match_path(conn, :create), match: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.match_path(conn, :show, id)

      conn = get(conn, Routes.match_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Match"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.match_path(conn, :create), match: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Match"
    end
  end

  describe "edit match" do
    setup [:create_match]

    test "renders form for editing chosen match", %{conn: conn, match: match} do
      conn = get(conn, Routes.match_path(conn, :edit, match))
      assert html_response(conn, 200) =~ "Edit Match"
    end
  end

  describe "update match" do
    setup [:create_match]

    test "redirects when data is valid", %{conn: conn, match: match} do
      conn = put(conn, Routes.match_path(conn, :update, match), match: @update_attrs)
      assert redirected_to(conn) == Routes.match_path(conn, :show, match)

      conn = get(conn, Routes.match_path(conn, :show, match))
      assert html_response(conn, 200) =~ "some updated player_id"
    end

    test "renders errors when data is invalid", %{conn: conn, match: match} do
      conn = put(conn, Routes.match_path(conn, :update, match), match: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Match"
    end
  end

  describe "delete match" do
    setup [:create_match]

    test "deletes chosen match", %{conn: conn, match: match} do
      conn = delete(conn, Routes.match_path(conn, :delete, match))
      assert redirected_to(conn) == Routes.match_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.match_path(conn, :show, match))
      end
    end
  end

  defp create_match(_) do
    match = match_fixture()
    %{match: match}
  end
end
