defmodule Service do
  # Server Layer
  def start({p, o}) do
    spawn(fn -> loop(Robotic.new(p, o)) end)
  end

  def loop(robot) do
    robot |> listen |> loop
  end

  def listen(robot) do
    receive do
      {:move, action} ->
        Robotic.move(robot, action)

      {:status, from} ->
        send(from, Robotic.humanize(robot))
        robot
    end
  end

  #  Client Layer
  def left(robot_pid) do
    send(robot_pid, {:move, :left})
  end

  def right(robot_pid) do
    send(robot_pid, {:move, :right})
  end

  def forward(robot_pid) do
    send(robot_pid, {:move, :forward})
  end

  def status(robot_pid) do
    send(robot_pid, {:status, self()})

    receive do
      string -> string
    end
  end
end
