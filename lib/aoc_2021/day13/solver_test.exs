defmodule AOC2021.Day13.SolverTest do
  use ExUnit.Case

  alias AOC2021.Day13.Solver, as: MUT

  describe "solve/2" do
    @tag :day13
    test "should solve first task with first test input from website correctly" do
      stream =
        """
        6,10
        0,14
        9,10
        0,3
        10,4
        4,11
        6,0
        6,12
        4,1
        0,13
        10,12
        3,4
        3,0
        8,4
        1,10
        2,14
        8,10
        9,0

        fold along y=7
        fold along x=5
        """
        |> String.split("\n", trim: true)

      assert 17 == MUT.solve(stream, :first)
    end
  end
end
