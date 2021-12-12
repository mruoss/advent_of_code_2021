defmodule AOC2021.Day12.SolverTest do
  use ExUnit.Case

  alias AOC2021.Day12.Solver, as: MUT

  describe "solve/2" do
    @tag :day12
    test "should solve first task with first test input from website correctly" do
      stream =
        """
        start-A
        start-b
        A-c
        A-b
        b-d
        A-end
        b-end
        """
        |> String.split("\n", trim: true)

      assert 10 == MUT.solve(stream, :first)
    end

    @tag :day12
    test "should solve first task with second test input from website correctly" do
      stream =
        """
        dc-end
        HN-start
        start-kj
        dc-start
        dc-HN
        LN-dc
        HN-end
        kj-sa
        kj-HN
        kj-dc
        """
        |> String.split("\n", trim: true)

      assert 19 == MUT.solve(stream, :first)
    end

    @tag :day12
    test "should solve first task with third test input from website correctly" do
      stream =
        """
        fs-end
        he-DX
        fs-he
        start-DX
        pj-DX
        end-zg
        zg-sl
        zg-pj
        pj-he
        RW-he
        fs-DX
        pj-RW
        zg-RW
        start-pj
        he-WI
        zg-he
        pj-fs
        start-RW
        """
        |> String.split("\n", trim: true)

      assert 226 == MUT.solve(stream, :first)
    end

    @tag :day12
    test "should solve second task with first test input from website correctly" do
      stream =
        """
        start-A
        start-b
        A-c
        A-b
        b-d
        A-end
        b-end
        """
        |> String.split("\n", trim: true)

      assert 36 == MUT.solve(stream, :second)
    end

    @tag :day12
    test "should solve second task with second test input from website correctly" do
      stream =
        """
        dc-end
        HN-start
        start-kj
        dc-start
        dc-HN
        LN-dc
        HN-end
        kj-sa
        kj-HN
        kj-dc
        """
        |> String.split("\n", trim: true)

      assert 103 == MUT.solve(stream, :second)
    end

    @tag :day12
    test "should solve second task with third test input from website correctly" do
      stream =
        """
        fs-end
        he-DX
        fs-he
        start-DX
        pj-DX
        end-zg
        zg-sl
        zg-pj
        pj-he
        RW-he
        fs-DX
        pj-RW
        zg-RW
        start-pj
        he-WI
        zg-he
        pj-fs
        start-RW
        """
        |> String.split("\n", trim: true)

      assert 3509 == MUT.solve(stream, :second)
    end
  end
end
