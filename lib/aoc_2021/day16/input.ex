defmodule AOC2021.Day16.Input do
  def parse(input) do
    input
    |> Enum.to_list()
    |> hd()
    |> String.graphemes()
    |> Enum.map(fn char ->
      char
      |> String.to_integer(16)
      |> Integer.digits(2)
      |> Enum.join()
      |> String.pad_leading(4, "0")
    end)
    |> Enum.join()
  end

  def parse_transmission(<< version::binary-size(3), type::binary-size(3), rest::binary >>) do
    obj = %{
      version: String.to_integer(version, 2),
      type: String.to_integer(type, 2)
    }

    if obj.type == 4,
      do: parse_literal(obj, rest),
      else: parse_operator(obj, rest)
  end

  defp parse_literal(literal, input), do: parse_literal(literal, [], input)
  defp parse_literal(literal, values, << "1", value::binary-size(4), rest::binary >>),
    do: parse_literal(literal, [value | values], rest)
  defp parse_literal(literal, values, << "0", value::binary-size(4), rest::binary >>) do
    value =
      [value | values]
      |> Enum.reverse()
      |> Enum.join()
      |> String.to_integer(2)

    {Map.put(literal, :value, value), rest}
  end

  defp parse_operator(operator, << "0", sub_packet_bits::binary-size(15), input::binary >>) do
    sub_packet_bits = String.to_integer(sub_packet_bits, 2)
    << sub_packets_raw::binary-size(sub_packet_bits), rest::binary>> = input
    sub_packets = parse_sub_packets(sub_packets_raw)

    {Map.put(operator, :sub_packets, sub_packets), rest}
  end

  defp parse_operator(obj, << "1", sub_packet_bits::binary-size(11), input::binary >>) do
    nr_of_sub_packets = String.to_integer(sub_packet_bits, 2)
    {sub_packets, rest} =
      Enum.map_reduce(1..nr_of_sub_packets, input, fn
        _, acc -> parse_transmission(acc)
      end)
    {Map.put(obj, :sub_packets, sub_packets), rest}
  end

  defp parse_sub_packets(input), do: parse_sub_packets([], input)
  defp parse_sub_packets(sub_packets, ""), do: sub_packets |> Enum.reverse()
  defp parse_sub_packets(sub_packets, input) do
    {packet, rest} = parse_transmission(input)
    parse_sub_packets([packet | sub_packets], rest)
  end
end
