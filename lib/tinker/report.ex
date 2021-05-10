defmodule Tinker.Report do
  def export(data) do
    with {:ok, file} <- File.open("report.txt", [:write]),
         :ok <- IO.write(file, data),
         :ok <- File.close(file) do
      :ok
    end
  end
end
