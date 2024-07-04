defmodule Spinner do
  def swap({row, col}) do
    {col, row}
  end

  def flip_left_right({row, col}) do
    {row, 5 - col}
  end

  def flip_top_bottom({row, col}) do
    {5 - row, col}
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
    |> rotate(180)
    |> rotate(90)
  end
end

points =
  [
    Blockr.Game.Point.new(2, 2),
    Blockr.Game.Point.new(3, 2),
    Blockr.Game.Point.new(4, 2),
    Blockr.Game.Point.new(4, 3)
  ]

# Canvas.tetromino(points)

points
|> Enum.map(&Spinner.flip_left_right/1)
# |> Canvas.tetromino()

points
|> Enum.map(&Spinner.flip_top_bottom()/1)
# |> Canvas.tetromino()

points
|> Enum.map(&Spinner.rotate(&1, 180))
# |> Canvas.tetromino()

points
|> Enum.map(&Spinner.rotate(&1, 90))
# |> Canvas.tetromino()

points
|> Enum.map(&Spinner.rotate(&1, 270))
# |> Canvas.tetromino()
