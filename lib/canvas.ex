defmodule Canvas do
  def tetromino(points, tetro) do
    Enum.map(points, fn ({x, y}) ->
      """
      <svg width="25" height="25" xmlns="http://www.w3.org/2000/svg">
        <rect width="25" height="25" x="10" y="10" rx="20" ry="20" fill="#{tetro.color}" />
      </svg>
      """
    end)
    # return Kino Image tha
  end

  def new() do

  end
end


# Tetromino.new(:z)
# |> Tetromino.rotate_right_90()
# |> Tetromino.fall()
# |> Tetromino.fall()
# |> Tetromino.fall()
# |> Tetromino.right()
# |> Tetromino.to_group()
# |> Canvas.new()

# Remove the :canvas dependency from mix.exs and add a new :kino dependency to access the LiveBook component model.
# Add a new file called canvas.ex.
# Within Canvas, add constructor function called Canvas.tetromino/1 that accepts a list of points within a 4x4 grid and returns a SVG canvas that’s 100x100 pixels with rect tags 25x25 pixels for each point.
# Within Canvas, add constructor function called Canvas.new/1 that accepts a list of points within a 20x10 grid and returns a SVG canvas that’s 100x200 pixels with rect tags 10x10 pixels for each point.
# Make both Canvas.new/1 and Canvas.tetromino/1 return a Kino component that wraps an SVG image.
# Write test cases for any new Tetromino and Group functions.
