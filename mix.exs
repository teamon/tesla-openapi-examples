defmodule Examples.MixProject do
  use Mix.Project

  def project do
    [
      app: :examples,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # mMake GitHub Pages happy
      docs: [output: "docs"]
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
      {:jason, "~> 1.0"},
      # {:tesla, path: "../tesla"},
      {:tesla, github: "teamon/tesla", branch: "tt/open-api"},
      {:ex_doc, "~> 0.2", only: :dev, runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev, :test], runtime: false}
    ]
  end
end
