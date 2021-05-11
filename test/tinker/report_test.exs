defmodule Tinker.ReportTest do
  use ExUnit.Case

  import Tinker.Report, only: [export: 1]

  @report_file "report.txt"

  describe "success: export/1" do
    setup do
      on_exit(fn ->
        File.rm!(@report_file)
      end)
    end

    @tag [content: "hello world"]
    test "success: writes to file", %{content: content} do
      assert export(content) == :ok
      {:ok, result} = File.read(@report_file)
      assert result == content
    end
  end
end
