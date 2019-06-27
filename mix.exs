defmodule BitwiseBinary.MixProject do
  use Mix.Project

  @version "0.2.0"
  @repo_url "https://github.com/aawalton/bitwise_binary"

  def project do
    [
      app: :bitwise_binary,
      version: @version,
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description:
        "Simple module to extend bitwise operations to full binaries (and not just integers).",
      package: package()
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
      {:propcheck, "~> 1.1.5", only: [:test, :dev]},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
    [
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => @repo_url}
    ]
  end
end
