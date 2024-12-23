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
    filename = day |> to_string |> String.pad_leading(2, "0") |> then(&"#{&1}.txt")
    path = Path.join([File.cwd!(), "input", filename])

    case File.read(path) do
      {:ok, body} -> String.split(body)
      {:error, :enoent} -> :missing
    end
  end
end
