defmodule Gc.Board do
  defstruct [:answer, :guesses]

  def new(answer \\ get_random_numbers()),
    do: %__MODULE__{answer: answer, guesses: []}

  defp get_random_numbers() do
    1..8 |> Enum.shuffle() |> Enum.take(4)
  end

  def move(board, guess) do
    %{board | guesses: [guess | board.guesses]}
  end

  def show(_board) do
    """
    1 2 3 4 | RRW
    1 2 3 4 | RRW
    ...
    """
  end
end
