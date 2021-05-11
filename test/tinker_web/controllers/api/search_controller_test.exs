defmodule TinkerWeb.API.SearchControllerTest do
  use TinkerWeb.ConnCase

  describe "GET /api/search" do
    # test "returns 200", %{conn: conn} do
    #   conn = get(conn, Routes.api_search_path(conn, :search, @valid_params))
    #   assert %{"data" => _data} = json_response(conn, 200)
    # end

    # test "returns 418 when phrase is sent as list", %{conn: conn} do
    #   conn = post(conn, Routes.api_acronyms_path(conn, :create, @invalid_params))
    #   assert %{"error" => "invalid_type"} = json_response(conn, 418)
    # end

    # test "returns 422 when missing phrase param", %{conn: conn} do
    #   conn = post(conn, Routes.api_acronyms_path(conn, :create, %{}))
    #   assert %{"error" => "phrase parameter required"} = json_response(conn, 422)
    # end
  end
end
