defmodule GcTest do
  use ExUnit.Case
  doctest Gc

  test "greets the world" do
    assert Gc.hello() == :world
  end
end
