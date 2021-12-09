defmodule AOC2021.Day09.SolverTest do
  use ExUnit.Case

  alias AOC2021.Day09.Solver, as: MUT

  describe "solve/2" do
    @tag :day09
    test "should solve first task with first test input from website correctly" do
      stream =
        """
        2199943210
        3987894921
        9856789892
        8767896789
        9899965678
        """
        |> String.split("\n", trim: true)

      assert 15 == MUT.solve(stream, :first)
    end

    @tag :day09
    test "should solve second task with first test input from website correctly" do
      stream =
        """
        2199943210
        3987894921
        9856789892
        8767896789
        9899965678
        """
        |> String.split("\n", trim: true)

      assert 1134 == MUT.solve(stream, :second)
    end
  end
end
