defmodule Polygon do
  @moduledoc false

  alias Blockr.Game.Point

  def rectangle({x, y}, width, height) do
    [{x, y}, {x + width, y}, {x + width, y + height}, {x, y + height}]
  end

  def square(point, length) do
    rectangle(point, length, length)
  end

  def mirror(polygon, w), do: Enum.map(polygon, &Point.mirror(&1, w))
  def flip(polygon, h), do: Enum.map(polygon, &Point.flip(&1, h))
  def transpose(polygon), do: Enum.map(polygon, &Point.transpose/1)
  def rotate(polygon, degress, w, h), do: Enum.map(polygon, &Point.rotate(&1, degress, w, h))
  def move(polygon, vector), do: Enum.map(polygon, &Point.move(&1, vector))
end
