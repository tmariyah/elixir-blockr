defmodule PointTest do
  use ExUnit.Case

  test "A new point" do
    assert Point.new(5, 6) == {5, 6}
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
end
