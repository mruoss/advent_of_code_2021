defmodule AOC2021.Day05.SolverTest do
  use ExUnit.Case

  alias AOC2021.Day05.Solver, as: MUT

  describe "solve/2" do
    @tag :day05
    test "should solve first task with first test input from website correctly" do
      stream =
        """
        0,9 -> 5,9
        8,0 -> 0,8
        9,4 -> 3,4
        2,2 -> 2,1
        7,0 -> 7,4
        6,4 -> 2,0
        0,9 -> 2,9
        3,4 -> 1,4
        0,0 -> 8,8
        5,5 -> 8,2
        """
        |> String.split("\n", trim: true)

      assert 5 == MUT.solve(stream, :first)
    end

    @tag :day05
    test "should solve second task with first test input from website correctly" do
      stream =
        """
        0,9 -> 5,9
        8,0 -> 0,8
        9,4 -> 3,4
        2,2 -> 2,1
        7,0 -> 7,4
        6,4 -> 2,0
        0,9 -> 2,9
        3,4 -> 1,4
        0,0 -> 8,8
        5,5 -> 8,2
        """
        |> String.split("\n", trim: true)

      assert 12 == MUT.solve(stream, :second)
    end
  end
end
