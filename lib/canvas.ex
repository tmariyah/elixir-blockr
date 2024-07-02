defmodule Canvas do
  def new(contents) do
    """
    <svg
      width="100" height="200"
      xmlns="http://www.w3.org/2000/svg">
      #{draw(contents, 10)}
    </svg>
    """
    |> Kino.Image.new(:svg)
  end

  def tetromino(contents) do
    """
    <svg
      width="100" height="100"
      xmlns="http://www.w3.org/2000/svg">
      #{draw(contents, 25)}
    </svg>
    """
    |> Kino.Image.new(:svg)
  end

  def draw({{row, col}, color}, width) when is_binary(color) do
    x = (col - 1) * width
    y = (row - 1) * width

    ~s[<rect width="#{width}" height="#{width}" x="#{x}" y="#{y}" fill="#{color}" />]
  end

  def draw({_row, _col} = point, width) do
    draw({point, "black"}, width)
  end

  def draw(points, width) when is_list(points) do
    points
    |> Enum.map(&draw(&1, width))
    |> Enum.join("\n")
  end
end
