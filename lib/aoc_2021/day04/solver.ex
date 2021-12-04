defmodule AOC2021.Day04.Solver do
  def solve(stream, task) do
    [draws | boards] = stream
    |> Stream.map(&String.trim/1)
    |> Stream.reject(&(&1 == "\n")) |> Enum.to_list()

    {forward_draws, reverse_draws} = format_draws(draws)

    boards = boards
    |> Enum.map(fn line ->
      line
      |> String.split([" "], trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Enum.map(&(reverse_draws[&1]))
    end)
    |> Enum.concat()
    |> Enum.chunk_every(25)

    {max_idx, winner_idx} = boards
    |> Enum.map(fn board ->
      [
        board |> Enum.take_every(5),
        board |> Enum.drop(1) |> Enum.take_every(5),
        board |> Enum.drop(2) |> Enum.take_every(5),
        board |> Enum.drop(3) |> Enum.take_every(5),
        board |> Enum.drop(4) |> Enum.take_every(5)
        |
        board |> Enum.chunk_every(5)
      ]
      |> Enum.map(&Enum.max/1)
      |> Enum.min()
    end)
    |> Enum.with_index()
    |> Enum.min(fn
      ({score1, _}, {score2, _}) when task == :first -> score1 < score2
      ({score1, _}, {score2, _}) when task == :second -> score1 > score2
    end)

    winner = Enum.at(boards, winner_idx)
    factor = winner |> Enum.filter(&(&1 > max_idx)) |> Enum.map(&(forward_draws[&1])) |> Enum.sum()

    factor * forward_draws[max_idx]
  end

  defp format_draws(draws) do
    indexed = draws
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index()

    reversed = Enum.map(indexed, fn ({key, value}) -> {value, key} end)

    {
      Enum.into(reversed, %{}),
      Enum.into(indexed, %{})
    }
  end
end
