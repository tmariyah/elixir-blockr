defmodule Blockr.Game.Tetromino do
  @moduledoc """
  Alphabets shapes

  T: ***
      *

  L: *
     *
     * *

  J:   *
       *
     * *

  I:  *
      *
      *
      *

  O: * *
     * *

  S:   **
     **

  Z: **
      **

  Directions:
    north: 0
    east: 90
    south: 180
    west: 270
  """
  defstruct [
    name: :i,
    location: {0, 0},
    rotation: 0
  ]

  alias Blockr.Game.{Group, Point}

  def new() do
    %__MODULE__{}
  end

  def new(options) when is_list(options) do
    __struct__(options)
  end

  def new(name) do
    %__MODULE__{name: name}
  end

  def new_random() do
    # new tetro in the top middle with a random shape
  end

  def left(tetro) do
    %{tetro | location: Point.move_left(tetro.location)}
  end

  def right(tetro) do
    %{tetro | location: Point.move_right(tetro.location)}
  end

  def fall(tetro) do
    %{tetro | location: Point.move_down(tetro.location)}
  end

  # def rotate_right_90(%{rotation: 270} = tetro) do
  #   %{tetro | rotation: 0}
  # end

  def rotate_right_90(tetro) do
    %{tetro | rotation: rem(tetro.rotation + 90, 360)}
  end

  def to_group(%{name: name} = tetro) do
    name
    |> tetro_shape()
    |> Group.rotate(tetro.rotation)
    |> Group.move_to(tetro.location)
  end

  defp tetro_shape(name) do
    shape =
      fn
        :i -> [{1, 2}, {2, 2}, {3, 2}, {4, 2}]
        :j -> [{1, 3}, {2, 3}, {3, 3}, {3, 2}]
        :l -> [{1, 2}, {2, 2}, {3, 2}, {3, 3}]
        :o -> [{2, 2}, {2, 3}, {3, 2}, {3, 3}]
        :s -> [{2, 3}, {2, 4}, {3, 3}, {3, 2}]
        :t -> [{1, 2}, {2, 2}, {2, 3}, {3, 2}]
        :z -> [{2, 2}, {2, 3}, {3, 3}, {3, 4}]
      end

    shape.(name)
  end
end
