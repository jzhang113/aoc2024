defmodule Aoc2024.Day3 do
  def input do
    Aoc2024.load(3)
  end

  def part1 do
    Regex.scan(~r/mul\((\d+),(\d+)\)/, input())
    |> Enum.map(fn [_, x, y] -> String.to_integer(x) * String.to_integer(y) end)
    |> Enum.sum()
  end

  def part2 do
    Regex.scan(~r/mul\((\d+),(\d+)\)|do\(\)|don't\(\)/, input())
    |> filter_instructions(:do, [])
    |> Enum.map(fn [_, x, y] -> String.to_integer(x) * String.to_integer(y) end)
    |> Enum.sum()
  end

  def run do
    IO.puts("Part 1: #{part1()}")
    IO.puts("Part 2: #{part2()}")
  end

  defp filter_instructions([head | tail], state, acc) do
    {next_state, val} = case head do
      ["do()"] -> {:do, []}
      ["don't()"] -> {:dont, []}
      _ -> {state, [head]}
    end

    case next_state do
      :do -> filter_instructions(tail, next_state, val ++ acc)
      :dont -> filter_instructions(tail, next_state, acc)
    end
  end

  defp filter_instructions([], _state, acc) do
    acc
  end
end
