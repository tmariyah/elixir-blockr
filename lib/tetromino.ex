defmodule Tetromino do
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
    location: {1, 3},
    rotation: 0,
    color: :green
  ]

  def new(name \\ :i) do
    %__MODULE__{name: name}
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
    case name do
      :i -> [{1, 2}, {2, 2}, {3, 2}, {4, 2}]
      :j -> [{1, 3}, {2, 3}, {3, 3}, {3, 2}]
      :l -> [{1, 2}, {2, 2}, {3, 2}, {3, 3}]
      :o -> [{2, 2}, {2, 3}, {3, 2}, {3, 3}]
      :s -> [{2, 3}, {2, 4}, {3, 3}, {3, 2}]
      :t -> [{1, 2}, {2, 2}, {2, 3}, {3, 2}]
      :z -> [{2, 2}, {2, 3}, {3, 3}, {3, 4}]
    end
    |> Group.rotate(tetro.rotation)
    |> Group.move_to(tetro.location)

    # shape = fn
    #   :i -> [{1, 2}, {2, 2}, {3, 2}, {4, 2}]
    #   :j -> [{1, 3}, {2, 3}, {3, 3}, {3, 2}]
    #   :l -> [{1, 2}, {2, 2}, {3, 2}, {3, 3}]
    #   :o -> [{2, 2}, {2, 3}, {3, 2}, {3, 3}]
    #   :s -> [{2, 3}, {2, 4}, {3, 3}, {3, 2}]
    #   :t -> [{1, 2}, {2, 2}, {2, 3}, {3, 2}]
    #   :z -> [{2, 2}, {2, 3}, {3, 3}, {3, 4}]
    #   end

    # %{tetro | location: shape.(name)}
  end
end
