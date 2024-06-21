defmodule Point do
  # a new point
  def new(row, col), do: {row, col}

  def move({x1, y1}, {x2, y2}), do: {x1 + x2, y1 + y2}

  # move in the correct direction by changing the column in point
  def move_down({row, column}), do: {row + 1, column}

  # move in the correct direction by changing the column in point
  def move_left({row, column}), do: {row, column - 1}

  # move in the correct direction by changing the column in point
  def move_right({row, column}), do: {row, column + 1}

  def swap({row, col}) do
    {col, row}
  end

  def flip_left_right({row, col}) do
    {row, 5 - col}
  end

  def flip_top_bottom({row, col}) do
    {5 - row, col}
  end

  def rotate(point, 0) do
    point
  end

  def rotate(point, 90) do
    point
    |> swap()
    |> flip_left_right()
  end

  def rotate(point, 180) do
    point
    |> flip_top_bottom()
    |> flip_left_right()
  end

  def rotate(point, 270) do
    point
    |> swap()
    |> flip_top_bottom()
  end

  # Reflect a Point on a Canvas
  def origin(), do: {0, 0}
  def mirror({x, y}, w), do: {w - x, y}
  def flip({x, y}, h), do: {x, h - y}
  def transpose({x, y}), do: {y, x}
  def northwest_to_southeast({x, y}, {cx, cy}), do: {x + cx, y + cy}

  # Rotate Around the Canvas Center
  def rotate(point, 0, _w, _h), do: point

  def rotate(point, 90, w, _h) do
    point
    |> transpose()
    |> mirror(w)
  end

  def rotate(point, 180, w, h) do
    point
    |> flip(h)
    |> mirror(w)
  end

  def rotate(point, 270, _w, h) do
    point
    |> flip(h)
    |> transpose()
  end

end
