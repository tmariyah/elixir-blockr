defmodule Blockr.Game do
  alias Blockr.Game.Tetromino

  def left(board) do
    tetro =
      Tetromino.left(board.tetro)

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

  def right(board) do
    tetro =
      Tetromino.right(board.tetro)

    %{board | tetro: tetro}
  end

  def turn(board) do
    tetro =
      Tetromino.left(board.tetro)

    %{board | tetro: tetro}
  end


end
