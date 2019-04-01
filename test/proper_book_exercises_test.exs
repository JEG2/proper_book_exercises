defmodule ProperBookExercisesTest do
  use ExUnit.Case
  doctest ProperBookExercises

  test "greets the world" do
    assert ProperBookExercises.hello() == :world
  end
end
