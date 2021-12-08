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
