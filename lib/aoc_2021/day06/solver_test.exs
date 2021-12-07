defmodule AOC2021.Day06.SolverTest do
  use ExUnit.Case

  alias AOC2021.Day06.Solver, as: MUT

  describe "solve/2" do
    @tag :day06
    test "should solve first task with first test input from website correctly" do
      stream =
        """
        3,4,3,1,2
        """
        |> String.split("\n", trim: true)

      assert 5934 == MUT.solve(stream, :first)
    end

    @tag :day06
    test "should solve second task with first test input from website correctly" do
      stream =
        """
        3,4,3,1,2
        """
        |> String.split("\n", trim: true)

      assert 26_984_457_539 == MUT.solve(stream, :second)
    end
  end
end
