defmodule Day1 do
  def input do
    Aoc2024.load(1) |> Enum.map(&String.to_integer/1) |> Enum.chunk_every(2)
  end

  def part1() do
    input = Day1.input()
    left = input |> Enum.map(&Enum.fetch!(&1, 0)) |> Enum.sort()
    right = input |> Enum.map(&Enum.fetch!(&1, 1)) |> Enum.sort()

    Enum.zip_reduce(left, right, 0, fn x, y, acc -> acc + abs(x - y) end)
  end

  def part2() do
    input = Day1.input()
    freq = input |> Enum.map(&Enum.fetch!(&1, 0)) |> Enum.frequencies()

    input
    |> Enum.map(&Enum.fetch!(&1, 1))
    |> Enum.reduce(fn x, acc -> if freq[x], do: acc + x * freq[x], else: acc end)
  end

  def run do
    IO.puts("Part 1: #{Day1.part1()}")
    IO.puts("Part 2: #{Day1.part2()}")
  end
end
