defmodule Loggertest.Mixfile do
  use Mix.Project

  def project do
    [app: :loggertest,
     version: "0.0.1",
     elixir: "~> 0.15.0",
     deps: deps]
  end

  def application, do: [
    applications: [:logger, :crypto, :ranch, :cowboy, :plug],
    mod: { Loggertest, [] },
  ]

  defp deps, do: [
    { :cowboy, "~> 1.0.0" },
    { :exrm, "~> 0.14.0" },
    { :plug, "~> 0.5.3" },
  ]
end
