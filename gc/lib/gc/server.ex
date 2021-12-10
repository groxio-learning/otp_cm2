defmodule Gc.Server do
  use GenServer
  alias Gc.Board
  @impl true
  def init(_answer) do
    {:ok, Board.new()}
  end

   @impl true
  def handle_call({:move, guess}, _from, board) do
    new_board = Board.move(board, guess)
    {:reply, Board.show(new_board), new_board}
  end

  def start_link(default) when is_list(default) do
    GenServer.start_link(__MODULE__,  default, name: __MODULE__)
  end

  def move(pid \\ __MODULE__, guess) do
    GenServer.call(pid, {:move, guess})
    |> IO.puts()

    :ok
  end
end
