defmodule Tinker.ReportTest do
  use ExUnit.Case

  import Tinker.Report, only: [export: 1]

  setup do
    on_exit(fn ->
      File.rm!("report.txt")
    end)
  end

  describe "export/1" do
    @tag [data: "hello world"]
    test "success: writes to file", %{data: data} do
      assert export(data) == :ok
    end
  end
end
