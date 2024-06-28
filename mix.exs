defmodule Blockr.MixProject do
  use Mix.Project

  def project do
    [
      app: :blockr,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:canvas, git: "https://github.com/groxio-learning/canvas.git"},
      {:kino, "~> 0.13.1"}
    ]
  end
end
