defmodule AOC2021.Day01.SolverTest do
  use ExUnit.Case

  alias AOC2021.Day01.Solver, as: MUT

  describe "solve/2" do
    @tag :day01
    test "should solve first task with first test input from website correctly" do
      stream =
        """
        199
        200
        208
        210
        200
        207
        240
        269
        260
        263
        """
        |> String.split("\n", trim: true)

      assert 7 == MUT.solve(stream, :first)
    end

    @tag :day01
    test "should solve second task with first test input from website correctly" do
      stream =
        """
        199
        200
        208
        210
        200
        207
        240
        269
        260
        263
        """
        |> String.split("\n", trim: true)

      assert 5 == MUT.solve(stream, :second)
    end
  end
end
