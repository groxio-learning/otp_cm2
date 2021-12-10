defmodule Gc.Board do
  defstruct [:answer, :guesses]

  def new(answer \\ get_random_numbers()),
    do: %__MODULE__{answer: answer, guesses: []}

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

  def status(%{guesses: guesses} = board) do
    cond do
      won?(board) ->
        "Congratulation you win!"
      guesses |> Enum.count > 10 ->
        "Unfortunately you lost("
      true ->
        "Still playing"
    end
  end

  defp get_random_numbers() do
    1..8 |> Enum.shuffle() |> Enum.take(4)
  end

  defp won?(%{answer: answer, guesses: [answer | _rest]}), do: true
  defp won?(_board), do: false

  defp row(guess, answer) do
    score = Gc.Score.new(answer, guess)
    |> Gc.Score.show()
    guess = guess |> Enum.join(" ")
    "#{guess} | #{score}"
  end
end
