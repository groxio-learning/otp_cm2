defmodule Gc do
  @moduledoc """
  Documentation for `Gc`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Gc.hello()
      :world

  """
  def hello do
    :world
  end

  def move(name, guess) do
    Gc.Server.move(name, guess)
  end
end
