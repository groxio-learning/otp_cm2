defmodule RoboticTest do
  use ExUnit.Case

  test "new robot" do
    assert %Robotic{} = Robotic.new({0, 0}, :north)
  end

  test "move turn_left" do
    robot = %Robotic{orientation: :east}
    assert %{orientation: :north} = Robotic.move(robot, :left)
  end

  test "move turn_right" do
    robot = %Robotic{orientation: :east}
    assert %{orientation: :south} = Robotic.move(robot, :right)
  end

  test "move forward" do
    robot = %Robotic{orientation: :east, position: {0, 0}}
    assert %{position: {1, 0}} = Robotic.move(robot, :forward)
  end

  test "forward forward backward" do
    %Robotic{orientation: :north, position: {0, 0}}
    |> Robotic.move(:forward)
    |> assert_key(:position, {0, 1})
    |> Robotic.move(:forward)
    |> assert_key(:position, {0, 2})
    |> Robotic.move(:left)
    |> assert_key(:orientation, :west)
    |> Robotic.move(:left)
    |> assert_key(:orientation, :south)
    |> Robotic.move(:forward)
    |> assert_key(position: {0, 1}, orientation: :south)
  end

  test "move all!!!" do
    moves = [:forward, :forward, :left, :left, :forward]

    %Robotic{orientation: :north, position: {0, 0}}
    |> Robotic.move_all(moves)
    |> assert_key(position: {0, 1}, orientation: :south)
  end

  defp assert_key(robot, list) do
    Enum.reduce(list, robot, fn {key, value}, robot ->
      assert_key(robot, key, value)
    end)
  end

  defp assert_key(robot, key, expected) do
    assert Map.fetch!(robot, key) == expected
    robot
  end
end
