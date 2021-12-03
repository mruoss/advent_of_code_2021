defmodule AOC2021.Input do
  def stream_of_int(stream) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
  end

  def stream_of_charlist(stream) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_charlist/1)
  end
end
