defmodule XGPS.Mixfile do
  use Mix.Project

  def project do
    [app: :xgps,
     name: XGPS,
     version: "0.5.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     source_url: "https://github.com/rveshovda/xgps",
     deps: deps(),
     description: description(),
     package: package()]
  end

  def application do
    [applications: [:logger, :gen_stage],
     mod: {XGPS, []}]
  end

  defp deps do
    [{:nerves_uart, "~> 0.1.1"},
     {:mix_test_watch, "~> 0.2.6"},
     {:gen_stage, "~> 0.6.1"}]
  end

  defp description do
    """
    An OTP application for reading and parsing GPS data written in Elixir.
    Will attach to an serial port, and provide positions to subscribers.
    Distributes positions using GenStage.
    """
  end

  defp package do
    [# These are the default files included in the package
     name: :xgps,
     files: ["lib", "priv", "mix.exs", "README*", "LICENSE*", "simulator_positions.txt"],
     maintainers: ["Roy Veshovda"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/rveshovda/xgps"}]
  end
end
