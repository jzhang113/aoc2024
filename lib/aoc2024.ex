defmodule Aoc2024 do
  @moduledoc """
  Documentation for `Aoc2024`.
  """

  @doc """
  Loads the input file for a given day

  ## Examples

      iex> Aoc2024.load(1)
      :world

  """
  def load(day) do
    path = filepath(day)
    case File.read(path) do
      {:ok, body} -> body
      {:error, :enoent} -> write(day)
      {:error, reason} -> raise reason
    end
  end

  defp write(day) do
    path = filepath(day)
    data = Req.get!(
        "https://adventofcode.com/2024/day/#{day}/input",
        headers: [
          {"User-Agent", "custom downloader - jzhang113 - jiahuaz01@gmail.com"},
          {"Cookie", "session=#{System.get_env("AOC_SESSION")}"}
        ]).body

    File.write!(path, data)
    data
  end

  defp filepath(day) do
    filename = day |> to_string |> String.pad_leading(2, "0") |> then(&"#{&1}.txt")
    Path.join([File.cwd!(), "input", filename])
  end
end
