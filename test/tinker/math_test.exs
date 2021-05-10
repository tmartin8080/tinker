defmodule Tinker.MathTest do
  use ExUnit.Case

  import Tinker.Math, only: [add: 2]

  test "Add two positive numbers" do
    assert add(102, 45) == 147
  end
end
