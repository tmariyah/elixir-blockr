defmodule Blockr.Game do
  alias Blockr.Game.Tetromino

  def left(board) do
    tetro =
      Tetromino.left(board.tetro)

    attempt(board, tetro)
  end

  def right(board) do
    tetro =
      Tetromino.right(board.tetro)

    attempt(board, tetro)
  end

  def turn(board) do
    tetro =
      Tetromino.rotate_right_90(board.tetro)

    attempt(board, tetro)
  end

  def fall(board) do

  end

  defp attempt(board, tetro) do
    set =
      tetro
      |> Tetromino.to_group()
      |> MapSet.new()

    intersection = MapSet.intersection(set, board.points)
    safe = MapSet.size(intersection) == 0

    if safe do
      %{board | tetro: tetro}
    else
      board
    end
  end

end
