defmodule AOC2021.Day18.Solver do
  alias AOC2021.Day18.Tree
  @moduledoc """
  https://adventofcode.com/2021/day/18

  ## Approach

  """
  def solve(input, :first) do
    input
    |> reduce()
    |> Tree.magnitude()
  end

  def reduce(input) do
    input
    |> Enum.map(&Tree.parse/1)
    |> Enum.reduce(fn next, acc ->
      Tree.add(acc, next)
      # |> tap(fn tree ->
      #   IO.puts("after adding:")
      #   tree
      #   |> Tree.print()
      #   |> IO.puts()
      #   IO.puts("")
      # end)
    end)
  end

  def solve(input, :second) do
  end

end
