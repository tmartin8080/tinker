defmodule TinkerWeb.API.AcronymControllerTest do
  use TinkerWeb.ConnCase

  @valid_params %{"phrase" => "Portable Networks Graphic"}
  @invalid_params %{"phrase" => ["Portable Networks Graphic"]}

  describe "POST /api/acronyms" do
    test "returns 200", %{conn: conn} do
      conn = post(conn, Routes.api_acronyms_path(conn, :create, @valid_params))
      assert %{"data" => "PNG"} = json_response(conn, 200)
    end

    test "returns 418 when phrase is sent as list", %{conn: conn} do
      conn = post(conn, Routes.api_acronyms_path(conn, :create, @invalid_params))
      assert %{"error" => "invalid_type"} = json_response(conn, 418)
    end

    test "returns 422 when missing phrase param", %{conn: conn} do
      conn = post(conn, Routes.api_acronyms_path(conn, :create, %{}))
      assert %{"error" => "phrase parameter required"} = json_response(conn, 422)
    end
  end
end
