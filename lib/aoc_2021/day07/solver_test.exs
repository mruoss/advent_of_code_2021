defmodule AOC2021.Day07.SolverTest do
  use ExUnit.Case

  alias AOC2021.Day07.Solver, as: MUT

  describe "solve/2" do
    @tag :day07
    test "should solve first task with first test input from website correctly" do
      stream =
        """
        16,1,2,0,4,2,7,1,2,14
        """
        |> String.split("\n", trim: true)

      assert 37 == MUT.solve(stream, :first)
    end

    @tag :day07
    test "should solve second task with first test input from website correctly" do
      stream =
        """
        16,1,2,0,4,2,7,1,2,14
        """
        |> String.split("\n", trim: true)

      assert 168 == MUT.solve(stream, :second)
    end
  end
end
