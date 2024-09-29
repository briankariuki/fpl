defmodule FplTest do
  use ExUnit.Case
  doctest Fpl

  test "greets the world" do
    assert Fpl.hello() == :world
  end
end
