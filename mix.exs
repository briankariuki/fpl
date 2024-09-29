defmodule Fpl.MixProject do
  use Mix.Project

  @name :fpl
  @version "0.1.0"
  @description "An Elixir wrapper for the unofficial `Fantasy Premier League` API."
  @github_url "https://github.com/briankariuki/fpl"

  def project do
    [
      app: @name,
      version: @version,
      # build_path: "../../_build",
      # config_path: "../../config/config.exs",
      # deps_path: "../../deps",
      # lockfile: "../../mix.lock",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      consolidate_protocols: Mix.env() != :dev,
      package: package(),
      deps: deps(),
      docs: docs(),
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Fpl.Application, []}
    ]
  end

  defp package() do
    [
      maintainers: ["Brian Kariuki"],
      description: @description,
      licenses: ["MIT"],
      links: %{Github: @github_url},
      files: ~w(mix.exs lib .formatter.exs LICENSE.md  README.md)
    ]
  end

  defp deps do
    [
      {:tesla, "~> 1.4"},
      {:hackney, "~> 1.17"},
      {:jason, ">= 1.0.0"},
      {:poison, "~> 5.0"},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  def docs() do
    [
      homepage_url: @github_url,
      source_url: @github_url,
      source_ref: "v#{@version}",
      main: "readme",
      extras: [
        "README.md": [title: "Guide"],
        "LICENSE.md": [title: "License"]
      ]
    ]
  end

  defp aliases() do
    [
      docs: ["docs"]
    ]
  end
end
