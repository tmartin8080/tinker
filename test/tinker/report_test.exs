defmodule Tinker.ReportTest do
  use ExUnit.Case

  import Tinker.Report, only: [export: 1]

  @report_file "report.txt"

  setup do
    on_exit(fn ->
      File.rm!(@report_file)
    end)
  end

  describe "export/1" do
    @tag [data: "hello world"]
    test "success: writes to file", %{data: data} do
      assert export(data) == :ok
      {:ok, data} = File.read(@report_file)
      assert data == "hello world"
    end
  end
end
