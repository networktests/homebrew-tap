cask "networktests-monitor" do
  version "0.4.7"
  sha256 "2ad81360c6381502a01f1ff5b36a8ae16d2f7c759eac4d74a19d36ac64674f98"

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
