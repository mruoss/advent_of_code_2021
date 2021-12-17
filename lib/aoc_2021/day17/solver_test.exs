defmodule AOC2021.Day17.SolverTest do
  use ExUnit.Case

  alias AOC2021.Day17.Solver, as: MUT

  describe "solve/2" do
    @tag :day17
    test "should solve firts task for all test inputs from website correctly" do
      assert 45 == MUT.solve("target area: x=20..30, y=-10..-5", :first)
    end

    @tag :day17
    test "should solve second task for all test inputs from website correctly" do
      assert 112 == MUT.solve("target area: x=20..30, y=-10..-5", :second)
    end
  end
end
