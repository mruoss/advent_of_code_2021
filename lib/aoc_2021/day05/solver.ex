defmodule AOC2021.Day05.Solver do
  def solve(stream, :first), do: solve(stream, fn _ -> [] end)
  def solve(stream, :second), do: solve(stream, fn [x1, y1, x2, y2] -> Enum.zip(x1..x2, y1..y2) end)

  def solve(stream, get_diagonal) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split(&1, [" -> ", ","]))
    |> Stream.map(fn line -> Enum.map(line, &String.to_integer/1) end)
    |> Stream.flat_map(fn
      [x, y1, x, y2] -> Enum.map(y1..y2, fn y -> {x, y} end)
      [x1, y, x2, y] -> Enum.map(x1..x2, fn x -> {x, y} end)
      diagonal_line -> get_diagonal.(diagonal_line)
    end)
    |> Enum.group_by(&Function.identity/1)
    |> Enum.count(fn {_, val} -> Enum.count(val) >= 2 end)
  end
end
