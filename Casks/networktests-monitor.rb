cask "networktests-monitor" do
  version "0.4.6"
  sha256 "5a102dfd19639515962fc2993b128f08bfb465f8ff2e2c86b06163b6fd99fb41"

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
