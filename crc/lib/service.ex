defmodule Service do
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
end
