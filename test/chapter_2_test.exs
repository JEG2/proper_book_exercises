defmodule Chapter2Test do
  use ExUnit.Case
  use PropCheck

  #
  # exercise 1:
  #
  # iex(1)> :proper_types.integer() |> :proper_gen.pick
  # {:ok, -9}
  #

  #
  # exercise 2:
  #
  # It tests that each succesive element in a list of numbers is equal to the
  # previous element plus one.
  #

  property "exercise 2: a sample", [numtests: 5] do
    forall {start, count} <- {integer(), non_neg_integer()} do
      # IO.inspect({start, count})
      list = Enum.to_list(start..(start + count))
      # IO.inspect(list)
      count + 1 == length(list) and increments(list)
    end
  end

  def increments([head | tail]), do: increments(head, tail)
  defp increments(_, []), do: true

  defp increments(n, [head | tail]) when head == n + 1,
    do: increments(head, tail)

  defp increments(_, _), do: false
end
