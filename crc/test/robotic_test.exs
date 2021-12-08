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

  test "forward" do
    robot = %Robotic{orientation: :east, position: {0, 0}}
    assert %{position: {1, 0}} = Robotic.forward(robot)
  end

  test "forward forward backward" do
    robot =
      %Robotic{orientation: :north, position: {0, 0}}
      |> Robotic.forward()
      |> assert_key(:position, {0, 1})
      |> Robotic.forward()
      |> assert_key(:position, {0, 2})
      |> Robotic.turn_left()
      |> assert_key(:orientation, :west)
      |> Robotic.turn_left()
      |> assert_key(:orientation, :south)
      |> Robotic.forward()
    assert %{position: {0, 1}, orientation: :south} = robot
  end

  defp assert_key(robot, key, expected) do
    assert Map.fetch!(robot, key) == expected
    robot
  end
end
