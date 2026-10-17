cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.1"
  sha256 arm:   "ef904fb991a9ed5f0deaedb0a66f4a45dccfceeb45225d602fad3f2246aa9b99",
         intel: "01bf8bc434a7f035fe2c27736f061c3cb7721e63771000277711840dde0d5219"

  url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-#{arch}.dmg"
  name "FlClash"
  desc "Based on Clasheta, a multi-platform proxy client"
  homepage "https://github.com/chen08209/FlClash/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "FlClash.app"

  zap trash: [
    "~/Library/Application Support/com.follow.clash",
    "~/Library/Caches/com.follow.clash",
    "~/Library/Preferences/com.follow.clash.plist",
  ]
end
