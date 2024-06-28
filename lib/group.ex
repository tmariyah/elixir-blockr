defmodule Group do
  def move_down(points) do
    Enum.map(points, &Point.move_down/1)
  end

  # move in the correct direction by changing the column in point
  def move_left(points) do
    Enum.map(points, &Point.move_left/1)
  end

  # move in the correct direction by changing the column in point
  def move_right(points) do
    Enum.map(points, &Point.move_right/1)
  end

  def move_to(points, location) do
    Enum.map(points, &Point.move_to(&1, location))
  end

  def swap(points) do
    Enum.map(points, &Point.swap/1)
  end

  def flip_left_right(points) do
    Enum.map(points, &Point.flip_left_right/1)
  end

  def flip_top_bottom(points) do
    Enum.map(points, &Point.flip_top_bottom/1)
  end

  def rotate(points, degree) do
    Enum.map(points, &Point.rotate(&1, degree))
  end
end
