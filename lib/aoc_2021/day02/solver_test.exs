defmodule AOC2021.Day02.SolverTest do
  use ExUnit.Case

  alias AOC2021.Day02.Solver, as: MUT

  describe "solve/2" do
    @tag :day02
    test "should solve first task with first test input from website correctly" do
      stream = """
      forward 5
      down 5
      forward 8
      up 3
      down 8
      forward 2
      """
      |> String.split("\n", trim: true)

      assert 150 == MUT.solve(stream, :first)
    end

    @tag :day02
    test "should solve second task with first test input from website correctly" do
      stream = """
      forward 5
      down 5
      forward 8
      up 3
      down 8
      forward 2
      """
      |> String.split("\n", trim: true)

      assert 900 == MUT.solve(stream, :second)
    end
  end
end
