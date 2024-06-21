defmodule Group do
  def move_down(points) do
    points
    |> Enum.map(&Point.move_down/1)
  end

  # move in the correct direction by changing the column in point
  def move_left(points) do
    points
    |> Enum.map(&Point.move_left/1)
  end

  # move in the correct direction by changing the column in point
  def move_right(points) do
    points
    |> Enum.map(&Point.move_right/1)
  end

  def swap(points) do
    points
    |> Enum.map(&Point.swap/1)
  end

  def flip_left_right(points) do
    points
    |> Enum.map(&Point.flip_left_right/1)
  end

  def flip_top_bottom(points) do
    points
    |> Enum.map(&Point.flip_top_bottom/1)
  end

  def rotate(points, 0) do
    points
  end

  def rotate(points, 90) do
    points
    |> Enum.map(&Point.swap/1)
    |> Enum.map(&Point.flip_left_right/1)
  end

  def rotate(points, 180) do
    points
    |> Enum.map(&Point.flip_top_bottom/1)
    |> Enum.map(&Point.flip_left_right/1)
  end

  def rotate(points, 270) do
    points
    |> Enum.map(&Point.swap/1)
    |> Enum.map(&Point.flip_top_bottom/1)
  end
end
