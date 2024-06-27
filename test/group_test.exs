defmodule GroupTest do
  use ExUnit.Case

  @points [{2, 3}, {3, 3}, {4, 3}, {4, 4}]

  test "move down" do
    assert Group.move_down(@points) == [{3, 3}, {4, 3}, {5, 3}, {5, 4}]
  end

  test "move left" do
    assert Group.move_left(@points) == [{2, 2}, {3, 2}, {4, 2}, {4, 3}]
  end

  test "move right" do
    assert Group.move_right(@points) == [{2, 4}, {3, 4}, {4, 4}, {4, 5}]
  end

  test "swap" do
    assert Group.swap(@points) == [{3, 2}, {3, 3}, {3, 4}, {4, 4}]
  end

  test "Flip left to right" do
    assert Group.flip_left_right(@points) == [{2, 2}, {3, 2}, {4, 2}, {4, 1}]
  end

  test "Flip top to bottom" do
    assert Group.flip_left_right(@points) == [{2, 2}, {3, 2}, {4, 2}, {4, 1}]
  end

  test "Rotate points at 0 degree" do
    assert Group.rotate(@points, 0) == [{2, 3}, {3, 3}, {4, 3}, {4, 4}]
  end

  test "Rotate points at 90 degrees" do
    assert Group.rotate(@points, 90) == [{3, 3}, {3, 2}, {3, 1}, {4, 1}]
  end

  test "Rotate points at 180 degrees" do
    assert Group.rotate(@points, 180) == [{3, 2}, {2, 2}, {1, 2}, {1, 1}]
  end

  test "Rotate points at 270 degrees" do
    assert Group.rotate(@points, 270) == [{2, 2}, {2, 3}, {2, 4}, {1, 4}]
  end
end
