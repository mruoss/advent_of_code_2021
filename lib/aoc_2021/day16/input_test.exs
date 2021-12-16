defmodule AOC2021.Day16.InputTest do
  use ExUnit.Case

  alias AOC2021.Day16.Input, as: MUT

  @tag :day16
  describe "prase/1" do
    @tag :day16
    test "should solve first task with first test input from website correctly" do
      assert "110100101111111000101000" == MUT.parse(["D2FE28"])
      assert "00111000000000000110111101000101001010010001001000000000" == MUT.parse(["38006F45291200"])
    end
  end

  describe "parse_transmission/1" do
    @tag :day16
    test "parses literal example correctly" do
      assert {%{
        version: 6,
        type: 4,
        value: 2021
      }, "000"} == MUT.parse_transmission("110100101111111000101000")
    end

    @tag :day16
    test "parses first operator example correctly" do
      assert {%{
        version: 1,
        type: 6,
        sub_packets: [
          %{
            version: 6,
            type: 4,
            value: 10
          },
          %{
            version: 2,
            type: 4,
            value: 20
          },
        ]
      }, "0000000"} == MUT.parse_transmission("00111000000000000110111101000101001010010001001000000000")
    end
  end

  @tag :day16
  test "parses first operator example correctly" do
    assert {%{
      version: 7,
      type: 3,
      sub_packets: [
        %{
          version: 2,
          type: 4,
          value: 1
        },
        %{
          version: 4,
          type: 4,
          value: 2
        },
        %{
          version: 1,
          type: 4,
          value: 3
        },
      ]
    }, "00000"} == MUT.parse_transmission("11101110000000001101010000001100100000100011000001100000")
  end
end
