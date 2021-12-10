defmodule Gc.Server do
  use GenServer
  alias Gc.Board
  @impl true
  def init(name) do
    IO.puts("Starting #{name}")
    {:ok, Board.new()}
  end

  @impl true
  def handle_call({:move, guess}, _from, board) do
    new_board = Board.move(board, guess)
    {:reply, Board.show(new_board), new_board}
  end

  @impl true
  def handle_cast(:die, board) do
    raise "boom"
    {:noreply, board}
  end

  #CLIENT'S API
  def start_link(name) do
    GenServer.start_link(__MODULE__,  name, name: name)
  end

  def die(pid \\ __MODULE__) do
    GenServer.cast(pid, :die)
  end

  def move(pid \\ __MODULE__, guess) do
    GenServer.call(pid, {:move, guess})
    |> IO.puts()

    :ok
  end

  def child_spec(name) do
    IO.puts("Fetching child's spec for #{name}")
    %{
      id: name,
      start: {__MODULE__, :start_link, [name]}
    }
  end

end
