defmodule Robotic do
  defstruct [:position, :orientation]

  def new(p, o), do: %__MODULE__{position: p, orientation: o}

  def turn_left(%Robotic{orientation: orientation} = robot) do
    case orientation do
      :north -> %{robot | orientation: :west}
      :south -> %{robot | orientation: :east}
      :east -> %{robot | orientation: :north}
      :west -> %{robot | orientation: :south}
    end
  end

  def turn_right(%Robotic{orientation: orientation} = robot) do
    case orientation do
      :north -> %{robot | orientation: :east}
      :south -> %{robot | orientation: :west}
      :east -> %{robot | orientation: :south}
      :west -> %{robot | orientation: :north}
    end
  end

  # defp forward(%{position: {x, y}, orientation: :north} = robot), do: %{robot | position: {x, y + 1}}
  # defp forward({x, y},:south), do: %{robot | position: {x, y - 1}}
  # defp forward({x, y},:east), do: %{robot | position: {x + 1, y}}
  # defp forward({x, y},:west), do: %{robot | position: {x - 1, y}}

  def forward(%Robotic{orientation: orientation, position: {x, y}} = robot) do
    case orientation do
      :north -> %{robot | position: {x, y + 1}}
      :south -> %{robot | position: {x, y - 1}}
      :east -> %{robot | position: {x + 1, y}}
      :west -> %{robot | position: {x - 1, y}}
    end
  end
end
