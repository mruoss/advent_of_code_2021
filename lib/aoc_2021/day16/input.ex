defmodule AOC2021.Day16.Input do
  def parse(input) do
    input
    |> Enum.to_list()
    |> hd()
    |> Base.decode16!()
    |> parse_transmission()
  end

  def parse_transmission(<< version::3, type::3, rest::bits >>) do
    obj = %{
      version: version,
      type: type
    }

    if obj.type == 4,
      do: parse_literal(obj, rest),
      else: parse_operator(obj, rest)
  end

  defp parse_literal(literal, input), do: parse_literal(literal, <<>>, input)
  defp parse_literal(literal, values, << 1::1, value::4, rest::bits >>),
    do: parse_literal(literal, << values::bits, value::4 >>, rest)
  defp parse_literal(literal, values, << 0::1, lastvalue::4, rest::bits >>) do
      bs = bit_size(values) + 4
      << value::size(bs) >> = << values::bits, lastvalue::4 >>
      {Map.put(literal, :value, value), rest}
  end

  defp parse_operator(operator, << 0::1, sub_packet_bits::15, input::bits >>) do
    << sub_packets_raw::size(sub_packet_bits), rest::bits>> = input
    sub_packets = parse_sub_packets(<< sub_packets_raw::size(sub_packet_bits) >>)

    {Map.put(operator, :sub_packets, sub_packets), rest}
  end

  defp parse_operator(obj, << 1::1, nr_of_sub_packets::11, input::bits >>) do
    {sub_packets, rest} =
      Enum.map_reduce(1..nr_of_sub_packets, input, fn
        _, acc -> parse_transmission(acc)
      end)
    {Map.put(obj, :sub_packets, sub_packets), rest}
  end

  defp parse_sub_packets(input), do: parse_sub_packets([], input)
  defp parse_sub_packets(sub_packets, <<>>), do: sub_packets |> Enum.reverse()
  defp parse_sub_packets(sub_packets, input) do
    {packet, rest} = parse_transmission(input)
    parse_sub_packets([packet | sub_packets], rest)
  end
end
