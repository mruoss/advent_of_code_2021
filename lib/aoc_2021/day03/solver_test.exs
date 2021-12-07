defmodule AOC2021.Day03.SolverTest do
  use ExUnit.Case

  alias AOC2021.Day03.Solver, as: MUT

  describe "solve/2" do
    @tag :day03
    test "should solve first task with first test input from website correctly" do
      stream =
        """
        00100
        11110
        10110
        10111
        10101
        01111
        00111
        11100
        10000
        11001
        00010
        01010
        """
        |> String.split("\n", trim: true)

      assert 198 == MUT.solve(stream, :first)
    end

    @tag :day03
    test "should solve second task with first test input from website correctly" do
      stream =
        """
        00100
        11110
        10110
        10111
        10101
        01111
        00111
        11100
        10000
        11001
        00010
        01010
        """
        |> String.split("\n", trim: true)

      assert 230 == MUT.solve(stream, :second)
    end
  end
end
