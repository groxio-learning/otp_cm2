defmodule RoboticTest do
  use ExUnit.Case

  test "new robot" do
    assert %Robotic{} = Robotic.new({0, 0}, :north)
  end

  test "turn_left" do
    robot = %Robotic{orientation: :east}
    assert %{orientation: :north} = Robotic.turn_left(robot)
  end

  test "turn_right" do
    robot = %Robotic{orientation: :east}
    assert %{orientation: :south} = Robotic.turn_right(robot)
  end

end
