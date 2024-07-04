defmodule PointTest do
  use ExUnit.Case
  alias Blockr.Game.Point

  test "New point" do
    assert Point.new(5, 6) == {5, 6}
  end

  test "move" do
    assert Point.move({1, 1}, {1, 2}) == {2, 3}
  end

  test "Move point down" do
    assert Point.move_down({5, 6}) == {6, 6}
  end

  test "Move point left" do
    assert Point.move_left({5, 6}) == {5, 5}
  end

  test "Move point right" do
    assert Point.move_right({5, 6}) == {5, 7}
  end

  test "move to" do
    assert Point.move_to({1, 2}, {2, 2}) == {3, 4}
  end
end
