defmodule Point do

  # a new point
  def new(row, col), do: {row, col}

  def move({x1, y1}, {x2, y2}), do: {x1 + x2, y1 + y2}


  # move in the correct direction by changing the column in point
  def move_down({row, column}), do: {row + 1, column}

  # move in the correct direction by changing the column in point
  @spec move_left({any(), number()}) :: {any(), number()}
  def move_left({row, column}), do: {row, column - 1}

  # move in the correct direction by changing the column in point
  def move_right({row, column}), do: {row, column + 1}
end
