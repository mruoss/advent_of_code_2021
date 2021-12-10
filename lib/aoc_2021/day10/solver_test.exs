defmodule AOC2021.Day10.SolverTest do
  use ExUnit.Case

  alias AOC2021.Day10.Solver, as: MUT

  describe "solve/2" do
    @tag :day10
    test "should solve first task with first test input from website correctly" do
      stream =
        """
        [({(<(())[]>[[{[]{<()<>>
        [(()[<>])]({[<{<<[]>>(
        {([(<{}[<>[]}>{[]{[(<()>
        (((({<>}<{<{<>}{[]{[]{}
        [[<[([]))<([[{}[[()]]]
        [{[{({}]{}}([{[{{{}}([]
        {<[[]]>}<{[{[{[]{()[[[]
        [<(<(<(<{}))><([]([]()
        <{([([[(<>()){}]>(<<{{
        <{([{{}}[<[[[<>{}]]]>[]]
        """
        |> String.split("\n", trim: true)

      assert 26397 == MUT.solve(stream, :first)
    end

    @tag :day10
    test "should solve second task with first test input from website correctly" do
      stream =
        """
        [({(<(())[]>[[{[]{<()<>>
        [(()[<>])]({[<{<<[]>>(
        {([(<{}[<>[]}>{[]{[(<()>
        (((({<>}<{<{<>}{[]{[]{}
        [[<[([]))<([[{}[[()]]]
        [{[{({}]{}}([{[{{{}}([]
        {<[[]]>}<{[{[{[]{()[[[]
        [<(<(<(<{}))><([]([]()
        <{([([[(<>()){}]>(<<{{
        <{([{{}}[<[[[<>{}]]]>[]]
        """
        |> String.split("\n", trim: true)

      assert 288957 == MUT.solve(stream, :second)
    end
  end
end
