defmodule Server do
  use GenServer

  @impl true
  def init({p, o}) do
    {:ok, Robotic.new(p, o)}
  end

  @impl true
  def handle_call(:status, _from, robot) do
    {:reply, Robotic.humanize(robot), robot}
  end

  @impl true
  def handle_cast({:move, action}, robot) do
    {:noreply, Robotic.move(robot, action)}
  end

  def start_link(default) when is_list(default) do
    GenServer.start_link(__MODULE__, {{0,0}, :north})
  end

  def move(pid, direction) do
    GenServer.cast(pid, {:move, direction})
  end

  def status(pid) do
    GenServer.call(pid, :status)
  end
end


#  # Start the server
#  {:ok, pid} = GenServer.start_link(Stack, [:hello])

#  # This is the client
#  GenServer.call(pid, :pop)
#  #=> :hello

#  GenServer.cast(pid, {:push, :world})
#  #=> :ok

#  GenServer.call(pid, :pop)
#  #=> :world
