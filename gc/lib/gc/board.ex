defmodule Gc.Board do
  defstruct [:answer, :guesses, :total_moves]

  @default_options %{
    total_moves: 10,
    guess_size: 4,
    allow_dups: false
  }

  def new(options \\ @default_options) do
    %__MODULE__{
      answer: get_random_numbers(options.guess_size, options.allow_dups),
      guesses: [],
      total_moves: options.total_moves
    }
  end

  def move(board, guess) do
    %{board | guesses: [guess | board.guesses]}
  end

  def show(board) do
    board.guesses
    |> Enum.map(& row(&1, board.answer))
    |> Enum.join("\n")
    |> Kernel.<>("\n")
    |> Kernel.<>(status(board))
  end

  def status(%{guesses: guesses, total_moves: total_moves} = board) do
    cond do
      won?(board) ->
        "Congratulation you win!"
      guesses |> Enum.count > total_moves ->
        "Unfortunately you lost("
      true ->
        "Still playing"
    end
  end

  defp get_random_numbers(guess_size, true), do:
    Stream.repeatedly(fn -> :rand.uniform(8) end) |> Enum.take(guess_size)
  defp get_random_numbers(guess_size, false), do:
    1..8 |> Enum.shuffle() |> Enum.take(guess_size)

  defp won?(%{answer: answer, guesses: [answer | _rest]}), do: true
  defp won?(_board), do: false

  defp row(guess, answer) do
    score = Gc.Score.new(answer, guess)
    |> Gc.Score.show()
    guess = guess |> Enum.join(" ")
    "#{guess} | #{score}"
  end
end
