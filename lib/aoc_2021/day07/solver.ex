defmodule AOC2021.Day07.Solver do
  @doc """
  Approach Part 1:
  * Calculate the mean of all numbers which is the alignment position.
  * Calculate the sum of fuels

  Approach Part 2:
  * Iterate over all numbers and positions and sum up fuels for each of them.
  * get the minimum
  """
  def solve(stream, :first) do
    numbers = stream
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
    |> hd()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)

    mean = numbers |> Enum.sort() |> Enum.at(numbers |> length() |> div(2))
    numbers
    |> Enum.map(&(abs(mean - &1)))
    |> Enum.sum()
  end

  def solve(stream, :second) do
    numbers = stream
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
    |> hd()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)

    max = Enum.max(numbers)
    for nr <- numbers,
        pos <- 0..max,
        reduce: Tuple.duplicate(0, max+1)
        do acc ->
          diff = abs(pos-nr)
          fuel = div((1+diff) * diff, 2)
          put_elem(acc, pos, elem(acc, pos) + fuel)
    end
    |> Tuple.to_list()
    |> Enum.min()

  end
end
