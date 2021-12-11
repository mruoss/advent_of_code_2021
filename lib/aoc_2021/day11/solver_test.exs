defmodule AOC2021.Day11.SolverTest do
  use ExUnit.Case

  alias AOC2021.Day11.Solver, as: MUT

  describe "solve/2" do
    @tag :day11
    test "should solve first task with first test input from website correctly" do
      stream =
        """
        5483143223
        2745854711
        5264556173
        6141336146
        6357385478
        4167524645
        2176841721
        6882881134
        4846848554
        5283751526
        """
        |> String.split("\n", trim: true)

      assert 1656 == MUT.solve(stream, :first)
    end

    @tag :day11
    test "should solve second task with first test input from website correctly" do
      stream =
        """
        5483143223
        2745854711
        5264556173
        6141336146
        6357385478
        4167524645
        2176841721
        6882881134
        4846848554
        5283751526
        """
        |> String.split("\n", trim: true)

      assert 195 == MUT.solve(stream, :second)
    end
  end
end
