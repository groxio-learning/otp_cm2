defmodule Gc.Board do
  defstruct [:answer, :guess, :number_of_try]

  def new(), do: %__MODULE__{answer: get_random_numbers(), guess: [], number_of_try: 0}

  defp get_random_numbers() do
    numbers = [1,2,3,4,5,6,7,8]
    answer = []
    set_random_numbers(numbers, answer)
  end

  def set_random_numbers(numbers, answer) do
    if length(answer) < 4 do
      random_number = Enum.random(numbers)
      answer = answer ++ [random_number]
      numbers = List.delete(numbers, random_number)
      set_random_numbers(numbers, answer)
    else
      answer
    end
  end
end
