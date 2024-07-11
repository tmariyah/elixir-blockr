defmodule Blockr.Game.Board do
  defstruct [
    score: 0,
    tetro: nil,
    walls: [],
    points: MapSet.new([]),
    junkyard: [],
    game_over: false
  ]

  alias Blockr.Game.{Tetromino, Group}

  # random tetromino function
  # new constructor new tetromino, in the middle of the top of the page

  def new(opts \\ []) do # constructor
    __struct__(opts)
    |> new_tetro
    |> add_walls()
  end

  def new_tetro(board) do # reducer
    random_name =
      [:s, :z, :l, :j, :i, :o, :t]
      |> Enum.random()

    %{board | tetro: Tetromino.new(name: random_name, location: {0, 3})}
  end

  defp count_complete_rows(board) do
    board.junkyard
    |> Map.new()
    |> Map.keys()
    |> Enum.group_by(fn  {r, _c} -> r end)
    |> Map.values()
    |> Enum.count(&length(&1) == 10)
  end

  def add_score(board) do
    number_of_rows = count_complete_rows(board)

    score =
      cond do
        number_of_rows == 0 ->
          0

        true ->
          :math.pow(2, number_of_rows)
          |> round()
          |> Kernel.*(50)
      end

      %{board| score: score}
  end

  # def add_score(board) do
  #   completed_rows = count_complete_rows(board)

  #   if completed_rows in [1, 2, 3] do
  #     %{board| score: board.score + completed_rows * 100}
  #   else
  #     %{board| score: board.score + ((completed_rows * 100) * 2)}
  #   end
  # end

  def detach(board) do
    points = Tetromino.to_group(board.tetro)
    colors = Group.paint(points, board.tetro.name)

    mapset = Enum.reduce(points, board.points, &MapSet.put(&2, &1))

    %{board | points: mapset, junkyard: board.junkyard ++ colors}
    |> add_score()
    |> eat_completed_rows()
    |> new_tetro()
    |> check_game_over()
  end

  def check_game_over(board) do
    left = board.points
    right =
      board.tetro
      |> Tetromino.to_group()
      |> MapSet.new()

    overlap_size =
      MapSet.intersection(left, right)
      |> MapSet.size()

    %{board| game_over: overlap_size > 0}
  end

  # converter
  def show(board) do
    tetro =
      board.tetro
      |> Tetromino.to_group()
      |> Group.paint(board.tetro.name)

    [tetro, board.walls, board.junkyard]
  end

  def fall(board) do
    # add score for completed rows
    add_score(board)

    # clear rows i.e., remove completed rows
    board.junkyard
    |> Map.new()
    |> Map.keys()
    |> Enum.group_by(fn  {r, _c} -> r end)
    |> Enum.to_list()
    |> Enum.filter(fn {_row_num, row_cells} -> length(row_cells) == 10 end)

    # fall all other pieces to the number of completed rows

  end

  def eat_completed_rows(board) do
    rows = Enum.group_by(board.junkyard, fn {{row, _col}, _color} -> row end)

    completed =
      rows
      |> Enum.filter(fn {_row, list} -> length(list) == 10 end)
      |> Map.new()
      |> Map.keys()

    junkyard =
      Enum.reduce(completed, rows, &eat_row/2)
      |> Map.values()
      |> List.flatten()

    junkyard_points = Enum.map(junkyard, fn {point, _color} -> point end)

    %{board| junkyard: junkyard, points: MapSet.new(board.walls ++ junkyard_points)}
  end

  defp eat_row(row_number, rows) do
    rows
    |> Map.delete(row_number)
    |> Enum.map(fn {rn, list} ->
      if(row_number > rn) do
        {rn + 1, move_all_down(list)}
      else
        {rn, list}
      end
    end)
    |> Map.new()
  end

  defp move_all_down(points) do
    Enum.map(points, fn {{row, col}, color} ->
      {{row + 1, col}, color}
    end)
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
end
