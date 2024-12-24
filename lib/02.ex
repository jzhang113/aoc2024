defmodule Aoc2024.Day2 do
  def input do
    Aoc2024.load(2)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1))
    |> Enum.map(fn line -> Enum.map(line, &String.to_integer/1) end)
  end

  def part1() do
    input()
    |> Enum.filter(&is_safe_levels/1)
    |> Enum.count()
  end

  def part2() do
    input()
    |> Enum.filter(&any_safe_levels/1)
    |> Enum.count()
  end

  def run do
    IO.puts("Part 1: #{part1()}")
    IO.puts("Part 2: #{part2()}")
  end

  defp is_safe_levels(list) do
    pairs = Enum.zip(list, Enum.drop(list, 1))
    Enum.all?(pairs, fn {x, y} -> y + 1 <= x and x <= y + 3 end) || Enum.all?(pairs, fn {x, y} -> x + 1 <= y and y <= x + 3 end)
  end

  defp any_safe_levels(list) do
    list
    |> Enum.with_index
    |> Enum.map(fn {_level, idx} ->
      List.delete_at(list, idx) |> is_safe_levels
    end)
    |> Enum.any?()
  end
end
