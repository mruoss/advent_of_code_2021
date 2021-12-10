defmodule Mix.Tasks.Solve do
  use Mix.Task
  @impl Mix.Task
  def run([day, subtask]) do
    apply(String.to_existing_atom("Elixir.AOC2021.#{String.capitalize(day)}.Solver"), :solve, [
      File.stream!("priv/input/#{day}.txt") |> Stream.map(&String.trim/1),
      String.to_existing_atom(subtask)
    ])
    |> IO.inspect()
  end
end
