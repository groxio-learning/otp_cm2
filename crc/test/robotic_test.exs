defmodule RoboticTest do
  use ExUnit.Case

  test "new robot" do
    assert %Robotic{} = Robotic.new({0, 0}, :north)
  end
end
