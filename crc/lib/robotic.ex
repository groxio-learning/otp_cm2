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
end
