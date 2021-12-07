defmodule Robotic do
  defstruct [:position, :orientation]

  def new(p, o), do: %__MODULE__{position: p, orientation: o}

end
