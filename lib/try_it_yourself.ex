defmodule TryItYourself do
  @moduledoc """
  book: Programmer Passport: Elixir
  page #45
  """

  # How would you represent a three dimensional point on a tuple?
  def three_dimensional_point(x, y, z), do: {x, y, z}

  # Write a function to determine if a three dimensional point {x, y, z}
  # is on a plane identified by a z coordinate. For example plane({4, 5, 0}, 0)
  # would return true but plane({1, 1, 1}, 0) would return false.
  def same_plane_point({_x, _y, z}, z), do: true

  # How would you represent a shopping cart with a tuple?
  def shopping_cart({user, items}), do: %{user: user, items: items}

  def identity?({i, i}), do: true

  def total([]), do: 0 |> IO.inspect(label: "inside zero case")
  def total([head | tail]), do: head + total(tail)
end
