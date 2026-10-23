cask "networktests-monitor" do
  version "0.4.4"
  sha256 "ac683bb5c2b2d7f49337f438108c45913baa1fd2c88c53f90861fa8d96c61a1d"

  url "https://github.com/networktests/networktests/releases/download/v#{version}/NetworkTests-Monitor-#{version}.pkg"
  name "NetworkTests Monitor"
  desc "Continuous network monitoring with plain-English verdicts"
  homepage "https://networktests.com/monitor"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  pkg "NetworkTests-Monitor-#{version}.pkg"

  uninstall launchctl: "com.networktests.agent",
            quit:      "com.networktests.monitor",
            pkgutil:   "com.networktests.agent"

  zap trash: [
    "~/Library/Application Support/networktests",
    "~/Library/Caches/com.networktests.monitor",
    "~/Library/Preferences/com.networktests.monitor.plist",
    "~/Library/WebKit/com.networktests.monitor",
  ]
end
