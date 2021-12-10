defmodule Gc.Score do
  defstruct [:reds, :whites]

  def new(answer, guess) do
    %__MODULE__{reds: reds(answer, guess), whites: whites(answer, guess)}
  end

  def show(%{reds: r, whites: w}) do
    String.duplicate("R", r) <> String.duplicate("W", w)
  end

  defp reds(answer, guess) do
    answer
    |> Enum.zip(guess)
    |> Enum.count(fn {a, g} -> a == g end)
  end

  defp misses(answer, guess) do
    guess
    |> Kernel.--(answer)
    |> Enum.count
  end

  defp whites(answer, guess) do
    4 - misses(answer, guess) - reds(answer, guess)
  end
end
