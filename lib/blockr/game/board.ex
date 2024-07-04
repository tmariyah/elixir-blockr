defmodule Blockr.Game.Board do
  defstruct [
    score: 0,
    tetro: nil,
    walls: [],
    points: MapSet.new([]),
    junkyard: []
  ]

  alias Blockr.Game.{Tetromino, Group}

  # random tetromino function
  # new constructor new tetromino, in the middle of the top of the page

  def new(opts \\ []) do # constructor
    __struct__(opts)
    |> initialize_tetro
    |> add_walls()
  end

  defp initialize_tetro(board) do # reducer
    random_name =
      [:s, :z, :l, :j, :i, :o, :t]
      |> Enum.random()

    %{board | tetro: Tetromino.new(name: random_name, location: {0, 3})}
  end

  defp add_walls(board) do
    walls =
      for row <- 0..21, col <- 0..11,
          (row in [0, 21]) or (col in [0, 11])
      do
        {row, col}
        # [{row, 0}, {row, 11}, {0, col}, {21, col}]
      end

      %{board | walls: walls, points: MapSet.new(walls)}
  end

  def show(board) do
    tetro =
      board.tetro
    |> Tetromino.to_group()
    |> Group.paint(board.tetro.name)

    [tetro, board.walls, board.junkyard]
  end
end
